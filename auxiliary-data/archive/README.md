## Archive

### Vaccine Coverage

#### Round 1 - 2023 / 2024

For round 1, the file 
[vaccine_coverage/RSV_round1_Coverage_2023_2024.csv](./vaccine_coverage/RSV_round1_Coverage_2023_2024.csv) 
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
 [vaccine_coverage/](./vaccine_coverage/) folder in an 
 [add_doses.R](./vaccine_coverage/add_doses.R) file.


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
   by week ([rsv/nrevss/rsv_data_us.csv](./nrevss/rsv_data_us.csv))
-  RSV detections in the United States, by week 
   ([rsv/nrevss/rsv_numerator_data_us.csv](./nrevss/rsv_numerator_data_us.csv))

##### State

The National RSV Trends were extracted from the 
[NREVSS-RSV State Trends webpage](https://archive.cdc.gov/#/details?url=https://www.cdc.gov/surveillance/nrevss/rsv/state.html).

> State-level trends are only displayed when two or more labs report RSV testing data for at least 
36 of the prior 52 weeks presented by diagnostic method.

For each state, three tables are extracted:

- Percent positive antigen detection RSV tests, by 3-week moving average 
  ([rsv/nrevss/rsv_antigen_3_week_average.csv](./nrevss/rsv_antigen_3_week_average.csv))
- Percent positive RSV PCR tests, by 3-week moving average 
  ([rsv/nrevss/rsv_pcr_3_week_average.csv](./nrevss/rsv_pcr_3_week_average.csv))
- RSV detections, by 5-week average 
  ([rsv/nrevss/rsv_numerator_data_5_week_average.csv](./nrevss/rsv_numerator_data_5_week_average.csv))

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
  ([nssp/resp_ed_count_weekly_national.csv](./nssp/resp_ed_count_weekly_national.csv))
- Weekly Emergency Department Visits by Age Group and 
  Respiratory Illness, as a Percent of All Emergency Department Visits
  ([nssp/resp_ed_percent_weekly_national.csv](./nssp/resp_ed_percent_weekly_national.csv))
- Weekly Emergency Department Visits by Viral Respiratory 
  Illness Type and State, as a Percent of All Emergency Department Visits
  ([nssp/resp_ed_percent_weekly_state.csv](./nssp/resp_ed_percent_weekly_state.csv))
