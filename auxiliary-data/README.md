# Auxiliary Data

This folder is used to store additional data relevant to the RSV modeling efforts. 
It contains multiple folders: 
  - one for RSV data from different CDC sources, including the python code to 
  extract and update the data. 
  - one for location and population data
  - one for birth rate data
  
## Location and Census Data

The folder ["location_census/"](./location_census/) contains two files:

- ["location_census/locations.csv"](./location_census/locations.csv) containing
  the state and national full name, 2 letter abbreviation and fips code as used 
  in the hub. The file also contains the population size
- ["location_census/state_pop_data"](./location_census/state_pop_data.csv) 
  contains the population size per year, state (and national level), age from
  2010 to 2022 (included). The data are coming from the US Census Bureau:
  - Annual Estimates of the Civilian Population by Single Year of Age and Sex 
  for the United States and States: April 1, 2010 to July 1,
  2020: available 
  [here](https://www.census.gov/programs-surveys/popest/technical-documentation/research/evaluation-estimates/2020-evaluation-estimates/2010s-state-detail.html)
  - Annual Estimates of the Civilian Population by Single Year of Age and Sex 
  for the United States and States: April 1, 2020 to July 1, 
  2022: available 
  [here](https://www.census.gov/data/datasets/time-series/demo/popest/2020s-state-detail.html)
  
## Birth Rate

The folder ["birth_rate"](./birth_rate/) contains multiple files:

- ["natality_"](./birth_rate/) files containing total number of births per 
  state and per year from the Centers for Disease Control and Prevention, 
  National Center for Health Statistics. National Vital Statistics System, 
  Natality on CDC WONDER Online Database
- ["birth_rate_2016_2022.txt"](./birth_rate/birth_rate_2016_2022.txt) containing
  the birth rate per state and year from the Centers for Disease Control and 
  Prevention, National Center for Health Statistics. National Vital Statistics 
  System, Natality on CDC WONDER Online Database
- ["birth_rate_1995_2022.txt"](./birth_rate/birth_rate_2016_2022.txt) containing
   the calculated birth rate and standardized birth rate from the "natality_" 
   and other "birth_rate" files from 1995 to 2022 per year and per state.
  
  
## RSV data

The folder ["rsv"](./rsv/) contains the RSV data divided in three sub-folders: 
one per each CDC source and the python code to extract and update the data.

The data is updated weekly by the 
[update-rsv-data](../.github/workflows/update-rsv-data.yaml) GitHub Action, 
which runs weekly on Friday morning, 9:00 am UTC.

### NREVSS and NSSP data

For the NREVSS and NSSP data, for each CSV file, an `as_of` column has been added 
containing the date the data point has been last downloaded, see table 1 for example.

Table 1: File downloaded on 2023-10-06 and stored in the repository on 2023-10-06

| ... | report_date |   as_of    |
|:---:|:-----------:|:----------:|
|     | 2021-10-02  | 2023-10-06 |
|     | 2021-10-09  | 2023-10-06 |
|     |             |            |

The source data are expressed using a rolling time period, meaning each week the
data contains only the last one or two years of data. For example table 2, starts
a week after table 1 and will contain an additional most recent week of data.

Table2: File downloaded on 2023-10-13

| ... | report_date |   as_of    |
|:---:|:-----------:|:----------:|
|     | 2021-10-09  | 2023-10-13 |
|     | 2021-10-13  | 2023-10-13 |
|     |             |            |

To preserve all the data in the repository, the rolling time series is 
updated weekly and the "historical" data are kept in the CSV file. For 
example, table 3 contains the "historical" data from table 1 and the 
last updated version of the time series from table 2.

Table3: Stored file containing all the information on 2023-10-13

| ... | report_date |   as_of    |
|:---:|:-----------:|:----------:|
|     | 2021-10-02  | 2023-10-06 |
|     | 2021-10-09  | 2023-10-13 |
|     | 2021-10-13  | 2023-10-13 |
|     |             |            |

#### The National Respiratory and Enteric Virus Surveillance System (NREVSS)

The National Respiratory and Enteric Virus Surveillance System (NREVSS) provides
data at national and state level.

> Participating laboratories report weekly to CDC the total number of RSV tests 
performed that week, and the number of those tests that were positive. Because 
reporting delays may be expected for some laboratories, data shown for the most 
recent weeks, in particular the most recent two weeks, may be less complete 
than others.

##### National

The National RSV Trends are extracted from the 
[NREVSS-RSV National Trends webpage](https://www.cdc.gov/surveillance/nrevss/rsv/natl-trend.html).

Two tables are extracted:

-  Percent positive respiratory syncytial virus tests in the United States, 
   by week (["rsv/nrevss/rsv_data_us.csv"](./rsv/nrevss/rsv_data_us.csv))
-  RSV detections in the United States, by week 
   (["rsv/nrevss/rsv_numerator_data_us.csv"](.rsv/nrevss/rsv_numerator_data_us.csv))

##### State

The National RSV Trends are extracted from the 
[NREVSS-RSV State Trends webpage](https://www.cdc.gov/surveillance/nrevss/rsv/state.html).

> State-level trends are only displayed when two or more labs report RSV testing data for at least 
36 of the prior 52 weeks presented by diagnostic method.

For each state, three tables are extracted:

- Percent positive antigen detection RSV tests, by 3-week moving average 
  (["rsv/nrevss/rsv_antigen_3_week_average.csv"](./rsv/nrevss/rsv_antigen_3_week_average.csv))
- Percent positive RSV PCR tests, by 3-week moving average 
  (["rsv/nrevss/rsv_pcr_3_week_average.csv"](./rsv/nrevss/rsv_pcr_3_week_average.csv))
- RSV detections, by 5-week average 
  (["rsv/nrevss/rsv_numerator_data_5_week_average.csv"](./rsv/nrevss/rsv_numerator_data_5_week_average.csv))

All the states data are compiled together into one file.

#### National Emergency Department Visits for COVID-19, Influenza, and Respiratory Syncytial Virus (NSSP)

The national and state level data are extracted from the 
[National Emergency Department Visits webpage](https://www.cdc.gov/ncird/surveillance/respiratory-illnesses/index.html).

> [...] emergency department visit data for multiple respiratory conditions as tracked by the National 
Syndromic Surveillance Program (NSSP). NSSP is a collaboration among CDC, federal partners, state and 
local health departments, and academic and private sector partners to collect, analyze, and share 
electronic data received from multiple health care settings. Data are monitored for a subset of emergency 
departments across the United States. 

Three tables are extracted from this page:

- Weekly Emergency Department Visits by Age Group 
  (["rsv/nssp/resp_ed_count_weekly_national.csv"](./rsv/nssp/resp_ed_count_weekly_national.csv))
- Weekly Emergency Department Visits by Age Group and 
  Respiratory Illness, as a Percent of All Emergency Department Visits
  (["rsv/nssp/resp_ed_percent_weekly_national.csv"](./rsv/nssp/resp_ed_percent_weekly_national.csv))
- Weekly Emergency Department Visits by Viral Respiratory 
  Illness Type and State, as a Percent of All Emergency Department Visits
  (["rsv/nssp/resp_ed_percent_weekly_state.csv"](./rsv/nssp/resp_ed_percent_weekly_state.csv))

### Respiratory Syncytial Virus Hospitalization Surveillance Network (RSV-NET)

The [Weekly Rates of Laboratory-Confirmed RSV Hospitalizations from the RSV-NET Surveillance System](https://data.cdc.gov/Public-Health-Surveillance/Weekly-Rates-of-Laboratory-Confirmed-RSV-Hospitali/29hc-w46k)
is also downloaded weekly and output in a PARQUET file: 
["rsv/rsv-net/weekly_rates_lab_confirmed_rsv_hosp.parquet"](./rsv/rsv-net/weekly_rates_lab_confirmed_rsv_hosp.parquet).

> The Respiratory Syncytial Virus Hospitalization Surveillance Network (RSV-NET) is a network that 
conducts active, population-based surveillance for laboratory-confirmed RSV-associated hospitalizations 
in children younger than 18 years of age and adults. The network currently includes 58 counties in 12 states, 
and data are collected and reported during the October 1-April 30 season each year. In some years, additional 
months of data are collected.

The output file contains the rate and cumulative rate of RSV hospitalization at national level and for 12
states by season, by week and by age category, sex, race.

For more information about RSV-NET, please consult the 
[CDC RSV-NET Overview and Methods](https://www.cdc.gov/rsv/research/rsv-net/overview-methods.html) 
webpage. 
