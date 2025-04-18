# System and Libraries ----
library(dplyr)
library(tidyr)
library(lubridate)

# Workflow ----

# Read files from the US SMH RSV GitHub Repository, please consult the
# repository for more information
# - RSV-NET data
# - Location information

# Location
df_loc <- read.csv("auxiliary-data/location_census/locations.csv")
location2fips <- setNames(df_loc$location, df_loc$location_name)

# Age Group
age2st_age <-
  setNames(c("0-130", "0-130",
             "0-4",
             "5-17",
             "18-49",
             "50-64",
             "65-130", "65-130",
             "0-0.49", "0-0.49",
             "0.5-0.99", "0.5-0.99",
             "75-130", "75-130",
             "65-74",
             "1-1.99", "1-1.99",
             "2-4", "2-4",
             "18-130", "18-130", "18-130"),
           c("Overall", "All",
             "0-4 years",
             "5-17 years",
             "18-49 years",
             "50-64 years",
             "65+ years", "≥65 years",
             "----0-<6 months", "0-<6 months",
             "6mo-<12 months", "----6-<12 months",
             "75+ years", "≥75 years",
             "65-74 years",
             "----1-<2 years", "1-<2 years",
             "----2-4 years", "2-4 years",
             "18+ (Adults)", "18+ years (Adults)", "≥18 years (Adults)"))

# Census - From US Census Bureau
# - Add columns for 2023 and 2024 with the same values as 2022
census_pop <- read.csv("auxiliary-data/location_census/state_pop_data.csv")
census_pop <- dplyr::mutate(
  census_pop,
  fips = gsub("00", "US", ifelse(nchar(STATE) < 2, paste0("0", STATE),
                                 as.character(STATE)))) %>%
  dplyr::filter(SEX == 0) %>%
  dplyr::select(fips, age = AGE, contains("POPEST")) %>%
  dplyr::mutate(POPEST2023_CIV = POPEST2022_CIV) %>%
  dplyr::mutate(POPEST2024_CIV = POPEST2022_CIV) %>%
  dplyr::mutate(POPEST2025_CIV = POPEST2022_CIV) %>%
  tidyr::pivot_longer(cols = contains("POPEST"), names_to = "year") %>%
  dplyr::mutate(year = as.numeric(gsub("[[:alpha:]]|_", "", year)))

# Calculate census data by age group of interest
# For the age groups: "0-0.49" and "0.5-0.99", use the year 0 divided by 2.
# The other age groups include all the years included in the range:
#   - "0-4" include all the years from 0 to 4: 0, 1, 2, 3, and 4.
#   - "1-1.99" include the year 1
#   - etc.
census_agegroup <- lapply(unique(age2st_age), function(age_grp) {
  age_min = as.numeric(strsplit(age_grp, "-")[[1]][1])
  age_max = as.numeric(strsplit(age_grp, "-")[[1]][2])
  div = 1
  if (age_min < 1 & age_max < 1) div = 2
  if (age_min < 1) age_min <- 0
  if (age_max < 1)  age_max <- 0
  df <- dplyr::filter(census_pop, age >= age_min, age <= age_max)
  df_age_group <-  dplyr::group_by(df, fips, year) %>%
    dplyr::summarise(tot_pop = sum(value) / div, .groups = "keep")  %>%
    dplyr::ungroup() %>%
    dplyr::mutate(age_group = age_grp)
  return(df_age_group)
}) %>% bind_rows()

# RSV-Net
df <- arrow::read_parquet(
  tail(sort(dir("auxiliary-data/rsv/rsv-net/", full.names = TRUE)), 1))

# Standardize:
# - Load relevant age groups
# - Filter overall race, sex
# - Remove seasonal summaries
# - Standardize date format in "YYYY-MM-DD" format
# - Add missing value in the time series
# - Recode age group information to US SMH format
# - Standardize column names (lower case, without space, dot)
rsv <- df %>%
  dplyr::mutate(
    date = as.Date(`Week ending date`,
                   tryFormats = c("%m/%d/%Y", "%Y-%m-%d"))) %>%
  dplyr::filter(
    Sex == "All" & Race == "All" &
      `Age Category` %in%
      c("Overall", "All", "0-4 years", "5-17 years", "18-49 years",
        "50-64 years", "65+ years", "≥65 years", "----0-<6 months",
        "0-<6 months", "6mo-<12 months", "----6-<12 months", "75+ years",
        "≥75 years", "65-74 years", "----1-<2 years", "1-<2 years",
        "----2-4 years", "2-4 years", "18+ (Adults)", "18+ years (Adults)",
        "≥18 years (Adults)")
  )
full_ts <- seq(min(rsv$date),max(rsv$date), by = "week")
full_df <- tidyr::expand(rsv, tidyr::nesting(State, `Age Category`),
                         full_ts) %>%
  dplyr::rename(date = full_ts)

rsv_standard <- dplyr::full_join(rsv, full_df,
                                 by = c("State", "Age Category", "date")) %>%
  dplyr::mutate(
    week = lubridate::epiweek(date),
    year = lubridate::epiyear(date),
    location = gsub("Entire Network \\(RSV-NET\\)|RSV-NET", "US", State),
    fips = location2fips[location],
    age_group = age2st_age[`Age Category`]) %>%
  dplyr::rename(value_rate = Rate, value_cumul_rate = `Cumulative Rate`,
                season = Season) %>%
  dplyr::select(location, fips, age_group, date, week, year, season, value_rate,
                value_cumul_rate)

# Calculate hospitalization number:
# - add population data per year, age_group, state
# - apply function: rate * population size / 100000
rsv_pop <- dplyr::left_join(rsv_standard, census_agegroup,
                            by = c("age_group", "fips", "year")) %>%
  dplyr::mutate(inc_hosp = value_rate * tot_pop / 100000) %>%
  dplyr::rename(rate_hosp = value_rate)


# Standardization to US SMH format
rsv_output <-
  tidyr::pivot_longer(
    rsv_pop, contains("_hosp"), names_to = "target", values_to = "value") %>%
  dplyr::mutate(target  = gsub("_", " ", target)) %>%
  dplyr::select(location = fips, date, age_group, target, value,
                population = tot_pop)

# Append previous season (removed on the new version of the data (2023-11-10))
# Use last version of the file containing the 2014-2015 and 2015-2016 seasons
# from the RSV SMH GitHub Repository (commit #f183e8a)
rsv_past_season <-
  read.csv(paste0("https://raw.githubusercontent.com/midas-network/",
                  "rsv-scenario-modeling-hub/",
                  "f183e8a1a8d2387f02c2e007527af48226370d03/",
                  "target-data/rsvnet_hospitalization.csv"))
rsv_past_season <- dplyr::filter(rsv_past_season, date < min(rsv_output$date))
rsv_output <- rbind(rsv_output, rsv_past_season)

# Archive complete version
archive_name <- paste0("auxiliary-data/target-data/archive/",
                       as.Date(Sys.time()), "_rsvnet_hospitalization.csv")
archive_rsv_output <- dplyr::rename(rsv_output, signal = target,
                                    observation = value)
write.csv(archive_rsv_output, archive_name, row.names = FALSE)

# Write output
rsv_output <- dplyr::filter(rsv_output, target == "inc hosp") |>
  dplyr::select(date, location, age_group, target, observation = value)
write.csv(rsv_output, "target-data/time-series.csv", row.names = FALSE)

