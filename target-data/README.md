# Target Data

This folder is used to store target data (also called "ground truth" or "truth
data") relevant to the RSV modeling efforts.
It contains the data and code used to generate the data.

## RSV-NET data

The [Weekly Rates of Laboratory-Confirmed RSV Hospitalizations from the RSV-NET Surveillance System](https://data.cdc.gov/Public-Health-Surveillance/Weekly-Rates-of-Laboratory-Confirmed-RSV-Hospitali/29hc-w46k)
is used for the hospitalization target after standardization. 
The standardization process is available in the 
[`get_target_data.R` script](./get_target_data.R)

The source data is downloaded and updated weekly in the 
[`auxiliary-data`](./../auxiliary-data/) folder. Please consult, the 
associated documentation for more information.

Following the source data update, the target data 
[`target_data/rsvnet_hospitalization.csv`](./rsvnet_hospitalization.csv)
is updated weekly with [`update target`](./../.github/workflows/update-target.yaml) 
GitHub Action.

### Workflow

The RSV-NET source files is standardized following these steps:

1. Load the RSV-NET file from the [`auxiliary-data`](./../auxiliary-data/) folder
2. Filter the source files to keep only the information of interest:
   - Select overall race and sex and age groups of interest (hub standard format
   in parentheses) :

     - 0-4 years (`"0-4"`), 5-17 years (`"5-17"`),  18-49 years (`"18-49"`),
       50-64 years (`"50-64"`), 65+ years (`"65-130"`),  0-<6 months (`"0-0.49"`), 
       6-<12 months (`"0.5-0.99"`), 1-<2 years (`"1-1.99"`),  2-4 years (`"2-4"`),
       18+ (Adults) (`"18-130"`) and overall (`"0-130"`)
     
     - As the data before the 2018-2019 season does not include children
       data, the overall age group has been removed from the selection for the
       seasons: 2014-2015, 2015-2016, 2016-2017, 2017-2018. For more information,
       please consult the
       [RSV-NET Overview and Methods](https://www.cdc.gov/rsv/research/rsv-net/overview-methods.html)
       webpage.
       
   - Remove the seasonal summaries
3. Re-code variable and associated values to the hub standard. See 
   [`model-output/README.md`](../model-output/README.md) for more information
4. Calculate the hospitalization number by applying:
   -  rate * population size / 100000
   - For the 6 months age group, the population size for the corresponding year
   divided by 2 is used.
   - The population data from the year 2022 are used for the year 2023
   - The population size information comes from the US Census Bureau, please
   consult the [`auxiliary-data`](./../auxiliary-data/) for more
   information
5. Standardize the output to the hub format:
   - output with six columns:
     - `location`: fips code of the associated state, `"US"` for national 
          level
     - `date`: end of the epiweek in a "YYYY-MM-DD" format
     - `age_group`: age groups in the hub format
     - `target`: associated target:
        - `"inc hosp"`: number of hospitalization (*target variable*)
        - `"rate hosp"`: number of hospitalization per 100 000 
     - `value`: associated value
     - `population`: associated population size
6. Write the output in a CSV format

### Visualization

A function to visualized the target data is also available in this folder. 

The function `weekly_hosp_state()` is available in the 
[`target_data_viz.R` script](./target_data_viz.R). 

The function can take as input the target data filtered for a specific target
and returns a faceted plot with the target by location for a specific age group. 
For more information on the function, please consult the documentation in the 
[`target_data_viz.R` script](./target_data_viz.R). 



