## Archive

### Vaccine Coverage

#### Round 1 - 2023 / 2024

For round 1, the file 
[vaccine_coverage/RSV_round1_Coverage_2023_2024.csv](./vaccine_coverage/round1/RSV_round1_Coverage_2023_2024.csv) 
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
 [vaccine_coverage/](./vaccine_coverage/round1) folder in an 
 [add_doses.R](./vaccine_coverage/round1/add_doses.R) file.
 
#### Round 2 - 2024/2025

##### Senior

For round 2, the file 
[vaccine_coverage/RSV_round2_vax_coverage_seniors_2024_25.csv](./vaccine_coverage/round2/RSV_round2_vax_coverage_seniors_2024_25.csv) 
provides weekly vaccine coverage (cumulative percentage, cumulative no of doses, 
size of eligible population) for seniors from summer 2024 to the end of the 
projection period for RSVnet states. Separate values are provided for seniors 
60-74 high risk and 75+.

Coverage should be considered additive to that of last season. The same coverage 
values apply to all intervention scenarios (A-D), while the counterfactual (F) 
assumes no coverage.

##### Maternal & Infant

- [RSV_RD2_maternal_vaccine_2024_25.csv](./vaccine_coverage/round2/RSV_RD2_maternal_vaccine_2024_25.csv) 
has weekly state-specific coverage for maternal vaccine. The weekdate is the 
Saturday at the end of each week. This date represents the date when the mother 
was vaccinated, so that the vaccine effect on the infant would start on average 
one month later after the baby is born. Columns are provided for total state pop 
size (`Total_pop`), annual number of births (`Births_per_year`), Scenarios 
(`"A"` through `"D"`), No of weekly vaccine doses administered 
(`Maternal_vaccine_weekly_doses`), No of eligible mothers throughout the 
season (`Eligible_mothers_entire_season`, calculated as the no of moms who 
are eligible for vaccination at **any time point of the campaign**), weekly 
incident coverage (`Weekly_incident_cov`, calculated as weekly doses 
divided by the number of eligible mothers), and cumulative coverage 
(calculated as the cumulative sum of weekly incidence coverage)
- [RSV_RD2_nirsevimab_aggregated_2024_25.csv](./vaccine_coverage/round2/RSV_RD2_nirsevimab_aggregated_2024_25.csv) 
has a similar structure as the maternal vaccine file for nirsevimab. 
Note that the column `Dose_Type` indicates whether a baby is vaccinated at 
birth (at a constant rate throughout the season; New Born) or during the 
catch-up campaign (accelerated immunization in the first month of the season; 
Catch Up). `Eligible_babies_entire_season` reflects the number of babies in each 
category (catchup/newborn) who are **eligible for nirsevimab at any time point during 
the campaign.** Weekly incident and cumulative coverages are estimated based on 
this eligible population
- [RSV_RD2_nirsevimab_byweekofage_2024_25.csv](./vaccine_coverage/round2/RSV_RD2_nirsevimab_byweekofage_2024_25.csv) 
is a version of the above file where the catch-up babies have been disaggregated 
by single week of age. This is the age at **receipt** of nirsevimab. Eligible babies 
counts the number of babies would are of that age in any given week of the season, 
which represents one week of babies.

In all files, the first and last weeks of the campaign have lower vaccination rates 
than other weeks to account for the fact that the campaign starts and ends at precise 
dates which do not exactly match with the start of a week  (eg Aug 15, Sep 1... etc).

**For teams that require US-level vaccine coverage, we advise to either do a 
weighted mean of the state coverage proportions, where the weights are the state 
population sizes. Or you can also sum all the state-level no of doses and 
state-level populations**

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
