# Auxiliary Data

This folder is used to store additional data relevant to the RSV modeling efforts. 
It contains two folders: one per each CDC source and the python code to extract
and update the data. 

The data is updated weekly by the [update-rsv-data](../.github/workflows/update-rsv-data.yaml) GitHub Action, which runs
weekly on Friday morning, 9:00 am UTC.

## The National Respiratory and Enteric Virus Surveillance System (NREVSS)

The National Respiratory and Enteric Virus Surveillance System (NREVSS) provides
data at national and state level.

> Participating laboratories report weekly to CDC the total number of RSV tests performed that week, 
and the number of those tests that were positive. Because reporting delays may be expected for some 
laboratories, data shown for the most recent weeks, in particular the most recent two weeks, may be 
less complete than others.

For each CSV file, a `as_of` column has been added containing the date the data point
has been last downloaded.

### National

The National RSV Trends are extracted from the 
[NREVSS-RSV National Trends webpage](https://www.cdc.gov/surveillance/nrevss/rsv/natl-trend.html).

Two tables are extracted:

-  Percent positive respiratory syncytial virus tests in the United States, 
   by week (`nrevss/rsv_data_us.csv`)
-  RSV detections in the United States, by week (`nrevss/rsv_numerator_data_us.csv`)

### State

The National RSV Trends are extracted from the 
[NREVSS-RSV State Trends webpage](https://www.cdc.gov/surveillance/nrevss/rsv/state.html).

> State-level trends are only displayed when two or more labs report RSV testing data for at least 
36 of the prior 52 weeks presented by diagnostic method.

For each state, three tables are extracted:

- Percent positive antigen detection RSV tests, by 3 week moving average 
  (`nrevss/rsv_antigen_3_week_average.csv`)
- Percent positive RSV PCR tests, by 3 week moving average 
  (`nrevss/rsv_pcr_3_week_average.csv`)
- RSV detections, by 5 week average 
  (`nrevss/rsv_numerator_data_5_week_average.csv`)

All the states data are compiled together into one file. 


## Respiratory Syncytial Virus Hospitalization Surveillance Network (RSV-NET)

The [Weekly Rates of Laboratory-Confirmed RSV Hospitalizations from the RSV-NET Surveillance System](https://data.cdc.gov/Public-Health-Surveillance/Weekly-Rates-of-Laboratory-Confirmed-RSV-Hospitali/29hc-w46k)
is also downloaded weekly and output in a PARQUET file: `rsv-net/weekly_rates_lab_confirmed_rsv_hosp.parquet`.

> The Respiratory Syncytial Virus Hospitalization Surveillance Network (RSV-NET) is a network that 
conducts active, population-based surveillance for laboratory-confirmed RSV-associated hospitalizations 
in children younger than 18 years of age and adults. The network currently includes 58 counties in 12 states, 
and data are collected and reported during the October 1-April 30 season each year. In some years, additional 
months of data are collected.
