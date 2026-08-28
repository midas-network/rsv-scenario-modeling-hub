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
abbr2fips <- setNames(df_loc$location, df_loc$abbreviation)

# Age Group
age2st_age <-
  setNames(c("0-130", "0-130",
             "0-4", "0-4",
             "1-4", "1-4",
             "5-11",
             "5-17", "5-17",
             "12-17",
             "0-17", "0-17", "0-17",
             "18-29",
             "30-39",
             "40-49",
             "18-49", "18-49",
             "50-64", "50-64",
             "65-130", "65-130", "65-130",
             "85-130", "85-130", "85-130",
             "0-0.49", "0-0.49",
             "0.5-0.99", "0.5-0.99",
             "75-84", "75-84",
             "75-130", "75-130", "75-130",
             "65-74", "65-74",
             "0-0.99", "0-0.99",
             "1-1.99", "1-1.99",
             "2-4", "2-4",
             "18-130", "18-130", "18-130", "18-130"),
           c("Overall", "All",
             "0-4 years", "0-4 yr",
             "1-4 years" , "1-4 yr",
             "5-11 yr",
             "5-17 years", "5-17 yr",
             "12-17 yr",
             "0-17 years", "0-17 years (Children)", "Pediatrics",
             "18-29 yr",
             "30-39 yr",
             "40-49 yr",
             "18-49 years", "18-49 yr",
             "50-64 years", "50-64 yr",
             "65+ years", "≥65 years", "65+ yr",
             "≥85 years", "85+ years", "85+ yr",
             "----0-<6 months", "0-<6 months",
             "6mo-<12 months", "----6-<12 months",
             "75-84 years", "75-84 yr",
             "75+ years", "≥75 years", "75+ yr",
             "65-74 years", "65-74 yr",
             "0-<1 year", "0-<1 yr",
             "----1-<2 years", "1-<2 years",
             "----2-4 years", "2-4 years",
             "18+ (Adults)", "18+ years (Adults)", "≥18 years (Adults)", "Adults"))

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
  dplyr::mutate(POPEST2026_CIV = POPEST2022_CIV) %>%
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
  tail(sort(dir("auxiliary-data/rsv/resp-net/", full.names = TRUE)), 1))

# Standardize:
# - Load relevant age groups
# - Filter overall race, sex, observed weekly data
# - Remove seasonal summaries
# - Standardize date format in "YYYY-MM-DD" format
# - Add missing value in the time series
# - Recode age group information to US SMH format
# - Standardize column names (lower case, without space, dot)
rsv <- df %>%
  dplyr::filter(`Date Type` == "Week Ending Date",
                `Surveillance Network` == "RSV-NET") |>
  dplyr::mutate(
    date = as.Date(`Date`,
                   tryFormats = c("%m/%d/%Y", "%Y-%m-%d"))) %>%
  dplyr::filter(
    Sex == "All" & Race == "All" &
      `Age Category` %in%
      c("Overall", "All", #"0-4 years", "0-4 yr",
        "5-17 years", "5-17 yr",
        "18-49 years", "18-49 yr", "50-64 years", "50-64 yr",
        "65+ years", "≥65 years", "65+ yr",
        #"----0-<6 months", "0-<6 months", "6mo-<12 months", "----6-<12 months",
        "75+ years", "≥75 years", "75+ yr", "65-74 years", "65-74 yr",
        "0-<1 yr", "1-4 yr",
        #"----1-<2 years", "1-<2 years", "----2-4 years", "2-4 years",
        "18+ (Adults)", "18+ years (Adults)", "≥18 years (Adults)", "Adults")
  )
full_ts <- seq(min(rsv$date),max(rsv$date), by = "week")
full_df <- tidyr::expand(rsv, tidyr::nesting(State, `Age Category`),
                         full_ts) %>%
  dplyr::rename(date = full_ts)

rsv_standard <- dplyr::full_join(rsv, full_df,
                                 by = c("State", "Age Category", "date")) %>%
  dplyr::mutate(
    week = MMWRweek::MMWRweek(date)$MMWRweek,
    year = MMWRweek::MMWRweek(date)$MMWRyear,
    location = gsub("Entire Network \\(RSV-NET\\)|RSV-NET|Overall", "US",
                    State),
    fips = location2fips[location],
    age_group = age2st_age[`Age Category`]) %>%
  dplyr::filter(`Rate Type` == "Observed")  %>%
  dplyr::distinct() |>
  tidyr::pivot_wider(names_from = "Data Type", values_from = "Estimate") %>%
  dplyr::rename(value_rate = `Weekly Rate`,
                value_cumul_rate = `Cumulative Rate`,
                season = Season) %>%
  dplyr::select(location, fips, age_group, date, week, year, season, value_rate,
                value_cumul_rate)

# Test all rows is unique
test <- dplyr::summarise(rsv_standard, n = dplyr::n(),
                         .by = c("location", "age_group", "date", "week",
                                 "year", "season"))
if (!all(test$n == 1)) {
  stop("The tables contains duplicate row, please check")
}


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

## Append previous season (removed on the new version of the data (2023-11-10))
## Use last version of the file containing the 2014-2015 and 2015-2016 seasons
## from the RSV SMH GitHub Repository (commit #f183e8a) - stop when switched to
## RESP-NET
#rsv_past_season <-
#  read.csv(paste0("https://raw.githubusercontent.com/midas-network/",
#                  "rsv-scenario-modeling-hub/",
#                  "f183e8a1a8d2387f02c2e007527af48226370d03/",
#                  "target-data/rsvnet_hospitalization.csv"))
#rsv_past_season <- dplyr::filter(rsv_past_season, date < min(rsv_output$date))
#rsv_output <- rbind(rsv_output, rsv_past_season)

# Test all rows is unique
test <- dplyr::summarise(rsv_standard, n = dplyr::n(),
                         .by = c("location", "age_group", "date", "week",
                                 "year", "season"))
if (!all(test$n == 1)) {
  stop("The tables contains duplicate row, please check")
}

# Archive complete version
archive_name <- paste0("auxiliary-data/target-data/archive/",
                       as.Date(Sys.time()), "_respnet_hospitalization.csv")
archive_rsv_output <- dplyr::rename(rsv_output, signal = target,
                                    observation = value)
write.csv(archive_rsv_output, archive_name, row.names = FALSE)

# Write output
rsv_output <- dplyr::filter(rsv_output, target == "inc hosp") |>
  dplyr::select(date, location, age_group, target, observation = value)
write.csv(rsv_output, "target-data/time-series.csv", row.names = FALSE)

