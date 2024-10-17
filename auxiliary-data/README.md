# Auxiliary Data

This folder is used to store additional data relevant to the RSV modeling efforts. 
It contains multiple folders: 
  - one for vaccine coverage
  - one for RSV data from different CDC sources, including the python code to 
  extract and update the data. 
  - one for location and population data
  - one for birth rate data
  - one archive for past version and past round associated files
  
## Vaccine Coverage

The folder [vaccine_coverage/](./vaccine_coverage/) provides weekly 
state-specific cumulative coverage for specific rounds.

### Round 2 - 2024 / 2025

#### Senior

For round 2, the file 
[vaccine_coverage/RSV_round2_vax_coverage_seniors_2024_25.csv](./vaccine_coverage/RSV_round2_vax_coverage_seniors_2024_25.csv) 
provides weekly vaccine coverage (cumulative percentage, cumulative no of doses, 
size of eligible population) for seniors from summer 2024 to the end of the 
projection period for RSVnet states. Separate values are provided for seniors 
60-74 high risk and 75+.

Coverage should be considered additive to that of last season. The same coverage 
values apply to all intervention scenarios (A-D), while the counterfactual (F) 
assumes no coverage.

#### Maternal & Infant

- [RSV_RD2_maternal_vaccine_2024_25.csv](./vaccine_coverage/RSV_RD2_maternal_vaccine_2024_25.csv) 
has weekly state-specific coverage for maternal vaccine. The weekdate is the 
Saturday at the end of each week. Columns are provided for total state pop 
size (`Total_pop`), annual number of births (`Births_per_year`), Scenarios 
(`"A"` through `"D"`), No of weekly vaccine doses administered 
(`Maternal_vaccine_weekly_doses`), No of eligible mothers throughout the 
season (`Eligible_mothers_entire_season`, calculated as the no of moms who 
are eligible for vaccination at **any time point of the campaign**), weekly 
incident coverage (`Weekly_incident_cov`, calculated as weekly doses 
divided by the number of eligible mothers), and cumulative coverage 
(calculated as the cumulative sum of weekly incidence coverage)
- [RSV_RD2_nirsevimab_aggregated_2024_25.csv](./vaccine_coverage/RSV_RD2_nirsevimab_aggregated_2024_25.csv) 
has a similar structure as the maternal vaccine file for nirsevimab. 
Note that the column `Dose_Type` indicates whether a baby is vaccinated at 
birth (at a constant rate throughout the season; New Born) or during the 
catch-up campaign (accelerated immunization in the first month of the season; 
Catch Up). `Eligible_babies_entire_season` reflects the number of babies in each 
category (catchup/newborn) who are **eligible for nirsevimab at any time point during 
the campaign.** Weekly incident and cumulative coverages are estimated based on 
this eligible population
- [RSV_RD2_nirsevimab_byweekofage_2024_25.csv](./vaccine_coverage/RSV_RD2_nirsevimab_byweekofage_2024_25.csv) 
is a version of the above file where the catch-up babies have been disaggregated 
by single week of age. This is the age at **receipt** of nirsevimab. Eligible babies 
counts the number of babies would are of that age in any given week of the season, 
which represents one week of babies.

In all files, the first and last weeks of the campaign have lower vaccination rates 
than other weeks to account for the fact that the campaign starts and ends at precise 
dates which do not exactly match with the start of a week  (eg Aug 15, Sep 1... etc).
  
## Location and Census Data

The folder [location_census/](./location_census/) contains two files:

- [location_census/locations.csv](./location_census/locations.csv) containing
  the state and national full name, 2 letter abbreviation and fips code as used 
  in the hub. The file also contains the population size
- [location_census/state_pop_data](./location_census/state_pop_data.csv) 
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

The folder [birth_rate/](./birth_rate/) contains multiple files:

- [natality_](./birth_rate/) files containing total number of births per 
  state and per year from the Centers for Disease Control and Prevention, 
  National Center for Health Statistics. National Vital Statistics System, 
  Natality on CDC WONDER Online Database
- [birth_rate_2016_2022.txt](./birth_rate/birth_rate_2016_2022.txt) containing
  the birth rate per state and year from the Centers for Disease Control and 
  Prevention, National Center for Health Statistics. National Vital Statistics 
  System, Natality on CDC WONDER Online Database
- [birth_rate_1995_2022.txt](./birth_rate/birth_rate_2016_2022.txt) containing
   the calculated birth rate and standardized birth rate from the "natality_" 
   and other "birth_rate" files from 1995 to 2022 per year and per state.
  
  
## RSV data

The folder [rsv/](./rsv/) contains the RSV data divided in three sub-folders: 
one per each CDC source and the python code to extract and update the data.

The data is updated weekly by the 
[update-rsv-data](../.github/workflows/update-rsv-data.yaml) GitHub Action, 
which runs weekly on Friday morning, 9:00 am UTC.

### Respiratory Syncytial Virus Hospitalization Surveillance Network (RSV-NET)

The [Weekly Rates of Laboratory-Confirmed RSV Hospitalizations from the RSV-NET Surveillance System](https://data.cdc.gov/Public-Health-Surveillance/Weekly-Rates-of-Laboratory-Confirmed-RSV-Hospitali/29hc-w46k)
is also downloaded weekly and output in a PARQUET file with the download date added in the name of the file: 
[rsv/rsv-net/DATE_weekly_rates_lab_confirmed_rsv_hosp.parquet](./rsv/rsv-net/).

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

### Weekly Respiratory Virus Vaccination Data, National Immunization Survey

The [Weekly Respiratory Virus Vaccination Data, Children 6 Months-17 Years and Adults 18 Years and Older, National Immunization Survey](https://data.cdc.gov/Vaccinations/Weekly-Respiratory-Virus-Vaccination-Data-Children/5c6r-xi2t/about_data)
is also downloaded weekly and output in a PARQUET file: 
[rsv/rsv-vax/weekly_respiratory_virus_vaccination_data.parquet](./rsv/rsv-vax/weekly_respiratory_virus_vaccination_data.parquet).

> The weekly respiratory virus vaccination data come from the National Immunization Survey-Adult COVID Module 
> (NIS-ACM), National Immunization Survey-Child COVID Module (NIS-CCM), and the National Immunization Survey-Flu 
> (NIS-Flu). The NIS-ACM provides data on Influenza (flu), COVID-19, and RSV vaccination for adults aged ≥18 years 
> in the United States.

The output file contains vaccination survey data on Influenza, COVID-19, and RSV vaccination for adults aged 
≥18 years in the United States and Children 6 Months-17 Years for a specific subset.

For more information, please consult the 
[homepage](https://data.cdc.gov/Vaccinations/Weekly-Respiratory-Virus-Vaccination-Data-Children/5c6r-xi2t/about_data) 
of the data and the [surveys method](https://www.cdc.gov/vaccines/imz-managers/nis/about.html#current-surveys) 
webpage information

Other links of interest:
- [Weekly Respiratory Syncytial Virus (RSV) Vaccination Coverage among Pregnant or Recently Pregnant Persons 18-49 Years, by Race and Ethnicity](https://data.cdc.gov/Pregnancy-Vaccination/Weekly-Respiratory-Syncytial-Virus-RSV-Vaccination/uqxy-gepz/about_data)
- [Monthly Nirsevimab Receipt and Intent Reported by Females Aged 18-49 Years Who Have a Baby <8 Months During the RSV Season, United States](https://data.cdc.gov/Pregnancy-Vaccination/Monthly-Nirsevimab-Receipt-and-Intent-Reported-by-/vdz4-qrri/about_data)
- [Weekly Cumulative RSV Vaccination Coverage and Intent, Overall, by Selected Demographics and Jurisdiction, Among Adults 75 and Older and 60-74 Years with High-Risk Conditions Ever Vaccinated, United States](https://data.cdc.gov/Vaccinations/Weekly-Cumulative-RSV-Vaccination-Coverage-and-Int/k4cb-dxd7/about_data)
- [Weekly Differences in Cumulative Respiratory Syncytial Virus (RSV) Vaccination Coverage and Comparison, Overall, by Jurisdiction, Among Adults 75 Years and Older and Adults 60─74 Years with High-Risk Conditions](https://data.cdc.gov/Vaccinations/Weekly-Differences-in-Cumulative-Respiratory-Syncy/qtvj-5vyb/about_data)

### 2023 - 2024  Weekly Respiratory Virus Vaccination Data

The repository also contains [2023-2024 Weekly RSV vaccination data](./rsv/rsv-vax/20232024/)
in a CSV format and with an associated PNG file.
The CSV file is a compilation of 
- [weekly RSV coverage in seniors 60+ nationally and by state, from the CDC National immunization survey](https://data.cdc.gov/Vaccinations/Weekly-Cumulative-Percentage-of-Adults-60-Years-an/qve4-fp9c/about_data)
- [monthly RSV nirsevimab coverage in babies 0-8 mo, nationally, from the  CDC National immunization survey](https://data.cdc.gov/Pregnancy-Vaccination/Monthly-Nirsevimab-Receipt-and-Intent-Among-Female/8ame-63pc/about_data)
- [monthly RSV vaccine coverage in pregnant moms, nationally, from the CDC vaccine safety datalink surveillance](https://data.cdc.gov/Pregnancy-Vaccination/Weekly-Respiratory-Syncytial-Virus-RSV-Vaccination/g4jn-64pd/about_data)


### The National Respiratory and Enteric Virus Surveillance System (NREVSS)

The [Percent Positivity of Respiratory Syncytial Virus Nucleic Acid Amplification Tests by HHS Region, National Respiratory and Enteric Virus Surveillance System](https://data.cdc.gov/Laboratory-Surveillance/Percent-Positivity-of-Respiratory-Syncytial-Virus-/3cxc-4k8q/about_data)
is also downloaded weekly and output in a PARQUET file: 
[rsv/nrevss/weekly_positivity.parquet](./rsv/nrevss/weekly_positivity.parquet).

> More than 450 public health, clinical, and commercial laboratories located 
> throughout the United States voluntarily participate in surveillance for 
> respiratory syncytial virus (RSV) through CDC's National Respiratory and 
> Enteric Virus Surveillance System (NREVSS). The data contain weekly, 
> aggregate counts of RSV tests performed and RSV detections as reported to 
> NREVSS since April 11, 2020. 

For more information, please consult the 
[homepage](https://data.cdc.gov/Laboratory-Surveillance/Percent-Positivity-of-Respiratory-Syncytial-Virus-/3cxc-4k8q/about_data) 
of the data and the [NREVSS](https://www.cdc.gov/nrevss/php/dashboard/index.html) 
webpage information

### NSSP Emergency Department (ED) 

Both the 
[2023 Respiratory Virus Response - NSSP Emergency Department Visit Trajectories by State and Sub State Regions- COVID-19, Flu, RSV, Combined](https://data.cdc.gov/Public-Health-Surveillance/2023-Respiratory-Virus-Response-NSSP-Emergency-Dep/rdmq-nq56/about_data), 
[2023 Respiratory Virus Response - NSSP Emergency Department Visits - COVID-19, Flu, RSV, Combined – by Demographic Category](https://data.cdc.gov/Public-Health-Surveillance/2023-Respiratory-Virus-Response-NSSP-Emergency-Dep/7xva-uux8/about_data)
are downloaded weekly and output in PARQUET files: 
- [rsv/nssp/ed_state.parquet](./rsv/nssp/ed_state.parquet)
- [rsv/nssp/ed_demo.parquet](./rsv/nssp/ed_demo.parquet)

> 2023 Respiratory Virus Response - NSSP Emergency Department (ED) Visit 
> Trajectories by State and Sub-State Regions- COVID-19, Flu, RSV, Combined. 
> This dataset provides the percentage of emergency department patient visits 
> for the specified pathogen of all ED patient visits for the specified 
> geography each part of the country that were observed for the given week 
>  from data submitted to the National Syndromic Surveillance Program (NSSP).


For more information, please consult the 
[NSSP homepage](https://www.cdc.gov/nssp/index.html)

----

## Archive

### Vaccine Coverage

#### Round 1 - 2023 / 2024

For round 1, the file 
[vaccine_coverage/RSV_round1_Coverage_2023_2024.csv](./archive/vaccine_coverage/RSV_round1_Coverage_2023_2024.csv) 
provides vaccine coverage (percentage) from summer 2023 to the end of the 
projection period to apply to infants 0-6 months (`rsv_cov_infants_pes` and 
`resv_cov_infants_opt`) and seniors over 60 years (`rsv_cover_over_60_pes` and 
`rsv_cov_over60_opt`). Values represent the optimistic and pessimistic 
assumptions prescribed in RSV round 1

The `rsv_n_dose_infants_opt` is the cumulative weekly number of monoclonal 
doses administered to infants 0-6 months during October through March in the 
optimistic scenario. This includes birth doses and catch up doses. 
`rsv_n_dose_infants_pes` is the same for the pessimistic scenario.

### Associated code

The R code to generate the `rsv_n_dose_infants_` is also available in the 
 [vaccine_coverage/](./archive/vaccine_coverage/) folder in an 
 [add_doses.R](./archive/vaccine_coverage/add_doses.R) file.


### Past NREVSS and NSSP version data [ARCHIVED version]

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

#### The National Respiratory and Enteric Virus Surveillance System (NREVSS) [Archived]

The National Respiratory and Enteric Virus Surveillance System (NREVSS) provides
data at national and state level.

> Participating laboratories report weekly to CDC the total number of RSV tests 
performed that week, and the number of those tests that were positive. Because 
reporting delays may be expected for some laboratories, data shown for the most 
recent weeks, in particular the most recent two weeks, may be less complete 
than others.

**As of May 10, 2024, the data previously included on the page was moved to the a new NREVSS Interactive Dashboard. We last downloaded the data on May 10, 2024 and will not be updated.**

##### National

The National RSV Trends were extracted from the 
[NREVSS-RSV National Trends webpage](https://archive.cdc.gov/#/details?url=https://www.cdc.gov/surveillance/nrevss/rsv/natl-trend.html).

Two tables are extracted:

-  Percent positive respiratory syncytial virus tests in the United States, 
   by week ([rsv/nrevss/rsv_data_us.csv](./archive/nrevss/rsv_data_us.csv))
-  RSV detections in the United States, by week 
   ([rsv/nrevss/rsv_numerator_data_us.csv](./archive/nrevss/rsv_numerator_data_us.csv))

##### State

The National RSV Trends were extracted from the 
[NREVSS-RSV State Trends webpage](https://archive.cdc.gov/#/details?url=https://www.cdc.gov/surveillance/nrevss/rsv/state.html).

> State-level trends are only displayed when two or more labs report RSV testing data for at least 
36 of the prior 52 weeks presented by diagnostic method.

For each state, three tables are extracted:

- Percent positive antigen detection RSV tests, by 3-week moving average 
  ([rsv/nrevss/rsv_antigen_3_week_average.csv](./archive/nrevss/rsv_antigen_3_week_average.csv))
- Percent positive RSV PCR tests, by 3-week moving average 
  ([rsv/nrevss/rsv_pcr_3_week_average.csv](./archive/nrevss/rsv_pcr_3_week_average.csv))
- RSV detections, by 5-week average 
  ([rsv/nrevss/rsv_numerator_data_5_week_average.csv](./archive/nrevss/rsv_numerator_data_5_week_average.csv))

All the states data are compiled together into one file.

#### National Emergency Department Visits for COVID-19, Influenza, and Respiratory Syncytial Virus (NSSP) [Archived]

The national and state level data are extracted from the 
[National Emergency Department Visits webpage](https://archive.cdc.gov/#/details?url=https://www.cdc.gov/ncird/surveillance/respiratory-illnesses/index.html).

> [...] emergency department visit data for multiple respiratory conditions as tracked by the National 
Syndromic Surveillance Program (NSSP). NSSP is a collaboration among CDC, federal partners, state and 
local health departments, and academic and private sector partners to collect, analyze, and share 
electronic data received from multiple health care settings. Data are monitored for a subset of emergency 
departments across the United States. 

**As Oct 2, 2024, the data extraction was stopped, last downloaded the data on Oct 2, 2024 and will not be updated.**


Three tables are extracted from this page:

- Weekly Emergency Department Visits by Age Group 
  ([rsv/nssp/resp_ed_count_weekly_national.csv](./rsv/archive/nssp/resp_ed_count_weekly_national.csv))
- Weekly Emergency Department Visits by Age Group and 
  Respiratory Illness, as a Percent of All Emergency Department Visits
  ([rsv/nssp/resp_ed_percent_weekly_national.csv](./rsv/archive/nssp/resp_ed_percent_weekly_national.csv))
- Weekly Emergency Department Visits by Viral Respiratory 
  Illness Type and State, as a Percent of All Emergency Department Visits
  ([rsv/nssp/resp_ed_percent_weekly_state.csv](./rsv/archive/nssp/resp_ed_percent_weekly_state.csv))
