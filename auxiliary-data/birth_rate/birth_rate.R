# Library and System -----------------------------------------------------------
library(dplyr)
library(tidyr)

# Function ---------------------------------------------------------------------

# Read raw US Census data and standardized the output:
# - Filter overall age and sex
# - Standardized FIPS code to 2 digit
# - Select population estimate column
# - Pivot the table in a long format with the year
#   information in a `year` column
prep_census_data <- function(path) {
  df_pop <- read.csv(path)
  df_pop <- dplyr::filter(df_pop, AGE == 999, SEX == 0) %>%
    dplyr::mutate(
      fips = gsub("00", "US", ifelse(nchar(STATE) < 2, paste0("0", STATE),
                                     as.character(STATE))))  %>%
    dplyr::select(fips, contains("POPEST")) %>%
    tidyr::pivot_longer(cols = contains("POPEST"), names_to = "year",
                        values_to = "pop") %>%
    dplyr::mutate(year = as.numeric(gsub("[[:alpha:]]|_", "", year)))
}

# Prerequisite -----------------------------------------------------------------

# Location
df_loc <- read.csv("auxiliary-data/location_census/locations.csv")
location2fips <- setNames(df_loc$location, df_loc$location_name)

# Population Data from the US Census Bureau
base_url <- "https://www2.census.gov/programs-surveys/popest/"

# Census Data 1990 - 1999
# From Intercensal State and County Characteristics Population Estimates with
# 1990-Base Race Groups
# https://www.census.gov/data/datasets/time-series/demo/popest/intercensal-1990-2000-state-and-county-characteristics.html
year <- c(90:99)
pop90_99 <- lapply(year, function(x) {
  link <- paste0(base_url, "tables/1990-2000/intercensal/st-co/stch-icen19", x,
                 ".txt")

  raw_pop = read.delim(link[1], header = FALSE, sep = "",
                       colClasses = "character")

  raw_pop["year"] = as.numeric(paste0(19, raw_pop$V1))
  raw_pop["fips"] = substring(raw_pop$V2, 1, 2)
  raw_pop["pop"] = raw_pop$V6

  df_tot <- raw_pop %>% dplyr::group_by(year, fips) %>%
    dplyr::summarise(pop = sum(as.numeric(pop)), .groups = "drop")

  return(df_tot)
}) %>% dplyr::bind_rows()

# Census Data 2000 - 2010
# Intercensal Estimates of the Resident Population by Single Year of Age and
# Sex for States and the United States: April 1, 2000 to July 1, 2010
# https://www.census.gov/data/datasets/time-series/demo/popest/intercensal-2000-2010-state.html
pop00_10 <- prep_census_data(paste0(
  base_url, "datasets/2000-2010/intercensal/state/st-est00int-agesex.csv"))

# Census Data 2010 - 2022
# population size per year, state (and national level), age from
# 2010 to 2022 (included)
# See Auxiliary folder documentation for more information
pop10_22 <- prep_census_data(
  "auxiliary-data/location_census/state_pop_data.csv")

# Total
df_pop <- rbind(pop90_99, pop00_10, pop10_22)

# Workflow ---------------------------------------------------------------------

# Calculate birth rate, 1995 - 2015
# - Read all the "natality" source files
# - Standardize the location and column names
# - Calculate the birth rate by year and state:
#    - total births divided by the total population multiply by 1000
# - Filter to keep only data from 1995 to 2015 (included)
nat_files <- dir("auxiliary-data/birth_rate/", full.names = TRUE,
                 pattern = "natality")

birth_rate_95_15 <- lapply(nat_files, function(x) {
  nat <- read.delim(x)
  b_rate <- dplyr::mutate(nat, fips = location2fips[State]) %>%
    dplyr::select(fips, year = Year, birth = Births) %>%
    dplyr::left_join(df_pop, by = c("year", "fips")) %>%
    dplyr::mutate(birth_rate = birth / pop * 1000)
  return(b_rate)
}) %>% dplyr::bind_rows() %>%
  dplyr::filter(year < 2016)

# Standardize birth rate 2016 - 2022
# - Read the "birth_rate" source files
# - Standardize and select the location and column names
birth_rate_16_22 <- read.delim(
  "auxiliary-data/birth_rate/birth_rate_2016_2022.txt") %>%
  dplyr::mutate(fips = location2fips[`State.of.Residence`]) %>%
  dplyr::select(fips, year = Year, birth = Births, pop = `Total.Population`,
                birth_rate = `Birth.Rate`)

# Append all the birth rates information in one table
# Written in CSV format file
write.csv(rbind(birth_rate_95_15, birth_rate_16_22),
          "auxiliary-data/birth_rate/birth_rate_1995_2022.csv",
          row.names = FALSE)


