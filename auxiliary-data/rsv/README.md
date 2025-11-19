## RSV data

The folder contains the RSV data divided in three sub-folders: 
one per each CDC source and the python code to extract and update the data.

The data is updated weekly by the 
[update-rsv-data](../.github/workflows/update-rsv-data.yaml) GitHub Action, 
which runs weekly on Friday morning, 9:00 am UTC, except POPHIVE Data

### Respiratory Syncytial Virus Hospitalization Surveillance Network (RSV-NET)

The [Weekly Rates of Laboratory-Confirmed RSV Hospitalizations from the RSV-NET Surveillance System](https://data.cdc.gov/Public-Health-Surveillance/Weekly-Rates-of-Laboratory-Confirmed-RSV-Hospitali/29hc-w46k)
is also downloaded weekly and output in a PARQUET file with the download date added in the name of the file: 
[rsv-net/DATE_weekly_rates_lab_confirmed_rsv_hosp.parquet](./rsv-net/).

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
[rsv/rsv-vax/weekly_respiratory_virus_vaccination_data.parquet](./rsv-vax/weekly_respiratory_virus_vaccination_data.parquet).

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

The repository also contains 3 CSV files about 
[2023-2024 Weekly RSV vaccination data](./rsv-vax/20232024/).

- [2023_24_observed_coverage_60plus_NIS.csv](./rsv-vax/20232024/2023_24_observed_coverage_60plus_NIS.csv)
- [2023_2024_observed_coverage_maternal_vaccine_nirsevimab_NIS.csv](./rsv-vax/20232024/2023_2024_observed_coverage_maternal_vaccine_nirsevimab_NIS.csv) 
contains the monthly estimates of receipt for nirsevimab reported by adult females 
aged 18–49 years with infants under the age of 8 months. Data is from the 
[National Immunization Survey-Adult COVID Module (NIS-ACM)](https://www.cdc.gov/rsvvaxview/dashboard/2023-24-nirsevimab-coverage-infants.html). Also contains maternal vaccine coverage estimates for pregnant persons 18-49 years old based on EHR data from the Vaccine Safety Datalink, obtained from [National Center for Immunization and Respiratory Diseases (NCIRD)](https://data.cdc.gov/Pregnancy-Vaccination/Weekly-Respiratory-Syncytial-Virus-RSV-Vaccination/g4jn-64pd/about_data) 
- [2023_24_nirsevimab_coverage.csv](./rsv-vax/20232024/2023_24_nirsevimab_coverage.csv)
from Monthly Cumulative Number and Percent of Children <20 Months Who Received Nirsevimab by 
Age Group and Jurisdiction assessed through the Immunization Information System (IIS) obtained from 
[National Center for Immunization and Respiratory Diseases (NCIRD)](https://data.cdc.gov/Vaccinations/Monthly-Cumulative-Number-and-Percent-of-Children-/ku7p-zn4c/about_data). Note that the IIS underestimates the true coverage. The file also contains monthly national estimates of eceipt for nirsevimab reported by adult females 
ged 18–49 years with infants under the age of 8 months obtained from the 
[National Immunization Survey-Adult COVID Module (NIS-ACM)](https://www.cdc.gov/rsvvaxview/dashboard/2023-24-nirsevimab-coverage-infants.html).

The NIS and IIS estimates are based on different groups of children recommended to receive nirsevimab. 
The IIS estimates include only "catch-up: babies" ie excludes babies who would become eligible on or 
after October 1, 2023 (i.e., babies born October 2023 - March 2024 are excluded). Further, IIS is 
based on an administrative database which may miss  a fraction of immunizations.

### The National Respiratory and Enteric Virus Surveillance System (NREVSS)

The [Percent Positivity of Respiratory Syncytial Virus Nucleic Acid Amplification Tests by HHS Region, National Respiratory and Enteric Virus Surveillance System](https://data.cdc.gov/Laboratory-Surveillance/Percent-Positivity-of-Respiratory-Syncytial-Virus-/3cxc-4k8q/about_data)
is also downloaded weekly and output in a PARQUET file: 
[rsv/nrevss/weekly_positivity.parquet](./nrevss/weekly_positivity.parquet).

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
- [rsv/nssp/ed_state.parquet](./nssp/ed_state.parquet)
- [rsv/nssp/ed_demo.parquet](./nssp/ed_demo.parquet)

> 2023 Respiratory Virus Response - NSSP Emergency Department (ED) Visit 
> Trajectories by State and Sub-State Regions- COVID-19, Flu, RSV, Combined. 
> This dataset provides the percentage of emergency department patient visits 
> for the specified pathogen of all ED patient visits for the specified 
> geography each part of the country that were observed for the given week 
>  from data submitted to the National Syndromic Surveillance Program (NSSP).


For more information, please consult the 
[NSSP homepage](https://www.cdc.gov/nssp/index.html)

### PopHIVE

The PopHIVE GitHub repositories contain multiple dataset that might be of 
interested about RSV testing trends:

- [Montly 2028 - 2025 Data (csv)](https://github.com/PopHIVE/Ingest/raw/refs/heads/main/data/epic/standard/monthly_tests.csv.gz)
  with the associated [metadata](https://github.com/PopHIVE/Ingest/blob/main/data/epic/measure_info.json)
- [2018 - 2024 Data (csv)](https://github.com/ysph-dsde/PopHIVE_DataHub/blob/main/Data/Plot%20Files/Cosmos%20ED/rsv_testing_freq.csv)
- [2023 - Aug2025 Data (parquet)](https://github.com/PopHIVE/Ingest/blob/main/data/bundle_respiratory/dist/rsv_testing_pct.parquet)


Results of research performed with Epic Cosmos were obtained from the [PopHIVE 
platform](https://github.com/PopHIVE/Ingest/tree/main), 
https://doi.org/10.5281/zenodo.17345935

An associated scaling factors (csv) and graph (pdf) generated from the data is 
also available in the [pophive folder](./pophive)

#### Round 3 - 2025/26 projections

Teams should assume that age-specific testing/reporting to RSV-NET is the same in 
2024-25 and 2025-26. However  teams can use rescaling factors to adjust RSV-NET 
data for historic years (=calibration period) if needed.


