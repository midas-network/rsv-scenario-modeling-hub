# System and library
library(dplyr)

# Census - From US Census Bureau
# - Add columns for 2023 with the same values as 2022
census_pop <- read.csv("auxiliary-data/location_census/state_pop_data.csv")
census_pop <- dplyr::mutate(
  census_pop,
  fips = gsub("00", "US", ifelse(nchar(STATE) < 2, paste0("0", STATE),
                                 as.character(STATE)))) %>%
  dplyr::filter(SEX == 0, AGE == 0) %>%
  dplyr::select(fips, age = AGE, contains("POPEST2022")) %>%
  dplyr::mutate(pop_0_6m = POPEST2022_CIV/2) %>%
  dplyr::select(-POPEST2022_CIV)

# Location
df_loc <- read.csv("auxiliary-data/location_census/locations.csv")
location2fips <- setNames(c(df_loc$location, "US"),
                          c(df_loc$location_name, "United States"))

# Load Coverage Data
cov_rsv <- read.csv(
  "auxiliary-data/vaccine_coverage/RSV_round1_Coverage_2023_2024.csv") %>%
  dplyr::mutate(fips = location2fips[Geography]) %>%
  dplyr::left_join(census_pop, by = "fips") %>%
  dplyr::mutate(
    rsv_n_dose_infants_pes = rsv_cov_infants_pes * pop_0_6m,
    rsv_n_dose_infants_opt = rsv_cov_infants_opt * pop_0_6m
  )

# Write output file
write.csv(cov_rsv,
          "auxiliary-data/vaccine_coverage/RSV_round1_Coverage_2023_2024.csv",
          row.names = FALSE)
