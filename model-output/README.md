# Data submission instructions

This page is intended to provide teams with all the information they
need to submit scenarios.  

All projections should be submitted directly to the [model-output/](./) 
folder. Data in this directory should be added to the repository
through a pull request. 

Due to file size limitation, the file can be submitted in a in a 
`.parquet` or `.gz.parquet`.

----

## Subdirectory

Each sub-directory within the [model-output/](./) directory has the
format:

    team-model
    
where 

- `team` is the abbreviated team name and 
- `model` is the  abbreviated name of your model. 

Both team and model should be less than 15 characters, and not include
hyphens nor spaces.

----

## Metadadata

Each submission team should have an associated metadata file. The file should
be submitted with the first projection in the 
[model-metadata/](../model-metadata/) folder, in a file named: 
`team-model.yaml`.

For more information on the metadata file format, please consult the associated
[README](../model-metadata/README.md)

----

## Date/Epiweek information

For week-ahead scenarios, we will use the specification of epidemiological
weeks (EWs) [defined by the US CDC](https://ndc.services.cdc.gov/wp-content/uploads/MMWR_Week_overview.pdf)
which run Sunday through Saturday.

There are standard software packages to convert from dates to epidemic weeks
and vice versa. E.g. [MMWRweek](https://cran.r-project.org/web/packages/MMWRweek/) 
for R and [pymmwr](https://pypi.org/project/pymmwr/) and 
[epiweeks](https://pypi.org/project/epiweeks/) for python.

---

## Model Results

Each model results file within the subdirectory should have the following 
name

    YYYY-MM-DD-team-model.parquet
    
where

- `YYYY` is the 4 digit year,
- `MM` is the 2 digit month,
- `DD` is the 2 digit day,
- `team` is the teamname, and
- `model` is the name of your model.

"parquet" files format from Apache is "is an open source, column-oriented data
file format designed for efficient data storage and retrieval". Please find more
information on the [parquet.apache.com](https://parquet.apache.org/) website.

The "arrow" library can be used to read/write the files in 
[Python](https://arrow.apache.org/docs/python/parquet.html) and 
[R](https://arrow.apache.org/docs/r/index.html).
Other tools are also accessible, for example [parquet-tools](https://github.com/hangxie/parquet-tools)

For example, in R:
```
# To write "parquet" file format:
filename <- ”path/YYYY-MM-DD-team_model.parquet”
arrow::write_parquet(df, filename)
# with "gz compression"
filename <- ”path/YYYY-MM-DD-team_model.gz.parquet”
arrow::write_parquet(df, filename, compression = "gzip", compression_level = 9)

# To read "parquet" file format:
arrow::read_parquet(filename)
```

The date YYYY-MM-DD should correspond to the start date for scenarios
projection ("first date of simulated transmission/outcomes" as noted in the
scenario description on the main 
[README, Submission Information](https://github.com/midas-network/rsv-scenario-modeling-hub)).

The `team` and `model` in this file must match the `team` and `model` in the 
directory this file is in. Both `team` and `model` should be less than 15 
characters, alpha-numeric and underscores only, with no spaces or hyphens.

If the size of the file is larger than 100MB, it should be submitted in a 
`.gz.parquet` format. 

---

## Model results file format

The output file must contain eleven columns (in any order):

- `origin_date`
- `scenario_id`
- `target`
- `horizon`
- `location`
- `age_group`
- `output_type` 
- `output_type_id` 
- `value`
- `run_grouping`
- `stochastic_run`

No additional columns are allowed.

Each row in the file is a specific type for a scenario for a location on
a particular date for a particular target. 


### `origin_date`

Values in the `origin_date` column must be a date in the format

    YYYY-MM-DD
    
The `origin_date` is the start date for scenarios (first date of 
simulated transmission/outcomes).
The "origin_date" and date in the filename should correspond.


### `scenario_id`

The standard scenario id should be used as given in in the scenario 
description in the [main README](https://github.com/midas-network/rsv-scenario-modeling-hub). 
Scenario id's include a capitalized letter and date as YYYY-MM-DD, e.g., 
`A-2023-10-27`.


### `target`

The submission can contain multiple output type information: 

- 100 representative trajectories from the model simulations. We will 
  call this format "sample" output type. For more information, please
  consult the [sample](./data-processed#sample) 
  section.
- A set of quantiles value for all the targets (except peak timing).
  We will call this format "quantile" output type. For more information, 
  please consult the [quantile](./data-processed#quantile) 
  section. 
- A cumulative distribution function for the peak timing target. 
  We will call this format "cdf" output type. For more information, 
  please consult the [cdf](.data-processed#cdf) 
  section. 

The requested targets are (for "sample" type output):

- weekly incident hospitalizations

Optional target (for "quantile" or "cdf" type output):

- quantile:
    - weekly cumulative hospitalizations
    - weekly incident hospitalizations
    - peak size hospitalizations
- cdf:
    - weekly peak timing hospitalizations

For all the targets, the age groups `"0-0.99"`, `"1-64"` and `"65-130"` are 
required, all the incident and cumulative targets can also include other age 
group information (optional).

Values in the `target` column must be one of the following character strings:

- `"inc hosp"`
- `"cum hosp"`
- `"peak size hosp"`
- `"peak time hosp"`


#### inc hosp

This target is the incident (weekly) number of hospitalized cases
predicted by the model during the week that is N weeks after
`origin_date`.

A week-ahead scenario should represent the total number of new
hospitalized cases reported during a given epiweek (from Sunday through
Saturday, inclusive).

Predictions for this target will be evaluated against the weekly number
of new hospitalized cases, as recorded by the laboratory-confirmed RSV 
hospitalizations from the RSV-NET surveillance system.


#### cum hosp

This target is the cumulative number of incident (weekly) number of
hospitalized cases predicted by the model during the week that is N
weeks after `model_projection_date`.  There should be 0 cumulative
hospitalization on week 0 of projection.

A week-ahead scenario should represent the cumulative number of
hospitalized cases reported up to the Saturday of a given epiweek.

Predictions for this target will be evaluated against the cumulative
number of hospitalized cases since the start of the projection period,
as recorded by tthe laboratory-confirmed RSV hospitalizations from the RSV-NET 
surveillance system.


#### peak time hosp

This target is the cumulative probability of the incident
hospitalization peak occurring before or during the week that is N
weeks after `orgin_date`. For instance "peak
time hosp" on the 22nd epiweek of projection is the probability that 
hospitalizations peak within the first 22 weeks of the projection 
period. This cumulative probability will be 1 on the last week of the 
projection period. A probability of 1 in the first week of the projection 
period could mean either future projections are not expected to 
exceed a prior peak or projections expect the peak will occur in the 
first week.

Predictions for this target will be evaluated against the week of the
peak number of hospitalized cases, as recorded the laboratory-confirmed RSV 
hospitalizations from the RSV-NET surveillance system.


#### peak size hosp

This target is the magnitude of the peak of weekly incident
hospitalizations in the model, when considering the full projection
period. 

Further, we do not expect a full time series, the `horizon`
column associated with this value should be set to `NA`.

Predictions for this target will be evaluated against the size of the
peak number of weekly hospitalized cases, as recorded by the 
laboratory-confirmed RSV hospitalizations from the RSV-NET surveillance 
system.


### `horizon`

Values in the `horizon` column must be a integer (N) between 1 and last week 
horion value representing the associated target value during the N weeks
after `origin_date`. The information is noted in the
scenario description on the main 
[README, Submission Information](https://github.com/midas-network/rsv-scenario-modeling-hub)),
see "Simulation end date" information

For example, between 1 and 29, in the following example table,
the first row represent the number of incident death in the US, for the 1st 
epiweek (epiweek ending on 2023-11-18, if start date is 2023-11-12)

|origin_date|scenario_id|location|target|age_group|horizon|...|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|2023-11-12|A-2023-10-27|US|inc hosp|0-0.99|1|...|
|||||||


### `location`

Values in the `location` column must be one of the "locations" in this 
[FIPS numeric code file](../data-locations/locations.csv) which includes 
numeric FIPS codes for U.S. states, counties, territories, and districts as 
well as "US" for national scenarios. 

Please note that when writing FIPS codes, they should be written in as a 
character string to preserve any leading zeroes.

For the round 1, only the location included in RSV-NET target data are 
expected:
`"US","06","08","09","13","24","26","27","35","36","41","47","49"`


### `output_type`

Values in the `output_type` column are either

- `"sample"` or 
- `"quantile"` (optional) or
- `"cdf"` (optional)


This value indicates whether that row corresponds to a "sample" scenario or a
quantile scenario, etc. 

**Scenarios must include "sample" scenario for every
  scenario-location-target-horizon-age_group group.**

### `output_type_id`

#### `sample`

For the simulation samples format only. Value in the `output_type_id` 
column is `NA`

The id sample number is input via two columns:

- `run_grouping`: This column specifies any additional grouping if it controls 
   for some factor driving the variance between trajectories (e.g., underlying 
   parameters, baseline fit) that is shared across trajectories in different 
   scenarios. I.e., if using this grouping will reduce overall variance 
   compared to analyzing all trajectories as independent, this grouping should 
   be recorded by giving all relevant rows the same number. If no such 
   grouping exists, number each model run independently. 
- `stochastic_run` : a unique id to differentiate multiple stochastic runs. If 
   no stochasticity: the column will contain an unique value

Both columns should only contain integer number. 

The submission file is expected to have 100 simulation samples 
(or trajectories) for each "group". 

For round 1, it is required to have the trajectories grouped at least by 
`"age_group"` and `"horizon"`, so it is required that the combination of 
the `run_grouping` and `stochastic_run` columns contains at least an unique
identifier for each group containing all the possible value for `"age_group"` 
and `"horizon"`.

Fore more information and examples, please consult the 
[Sample Format Wiki page]().

For example:

|origin_date|scenario_id|location|target|horizon|age_group|output_type|output_type_id|run_grouping|stochastic_run|value|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|2023-11-12|A-2023-10-27|US|inc hosp|1|0-0.99|sample|NA|1|1||
|2023-11-12|A-2023-10-27|US|inc hosp|2|0-0.99|sample|NA|1|1||
|2023-11-12|A-2023-10-27|US|inc hosp|3|0-0.99|sample|NA|1|1||
||||||||||||
|2023-11-12|A-2023-10-27|US|inc hosp|1|0-0.99|sample|NA|2|1||
|2023-11-12|A-2023-10-27|US|inc hosp|2|0-0.99|sample|NA|2|1||
||||||||||||


#### `quantile` 

Values in the `output_type_id` column are quantiles in the format

    0.###

and `NA` in the `run_grouping` and `stochastic_run` columns.
    
For quantile scenarios, this value indicates the quantile for the `value` in
this row. 

Teams should provide the following 23 quantiles:

``` 
0.010 0.025 0.050 0.100 0.150 0.200 0.250 0.300 0.350 0.400 0.450 0.500
0.550 0.600 0.650 0.700 0.750, 0.800 0.850 0.900 0.950 0.975 0.990 
```

An optional `0`  and `1` value can also be provided.

For example:

|origin_date|scenario_id|location|target|horizon|age_group|output_type|output_type_id|run_grouping|stochastic_run|value|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|2023-11-12|A-2023-10-27|US|inc hosp|1|0-0.99|quantile|0.010|NA|NA||
|2023-11-12|A-2023-10-27|US|inc hosp|1|0-0.99|quantile|0.025|NA|NA||
||||||||||||


#### `cdf`

Values in the `output_type_id` column are the epiweek associated with cumulative 
probability of the incident hospitalization peak occurring before or during the 
week that is N weeks after `origin_date` in the format:

    EWYYYYWW
    

and `NA` in the `run_grouping` and `stochastic_run` columns.
    
For instance `"EW202348"`` is the probability that hospitalizations peak within 
the epiweek 2023-48 or before.

Teams should provide the complete time series associated with the round, and the
`horizon` column should be set to `NA` value. The week 
information should be in 2 digits format, so if the epiweek is for example 2024-2, 
then it should be reported as `"EW202402"`. 

It can be calculated by applying:

-  `origin_date` +  7 * `N` - 1 (N being the number of
week ahead projection in the associated target, e.g `"1 wk ahead"`, 
`"2 wk ahead"` after the start of the projection), and transform
the output in epiweek format.

For example:
```
# If `origin_date` is "2023-11-12"

# Week 1 will be:
week1_date = as.Date("2023-11-12") + 7 * 1 - 1
epiweek1 = MMWRweek::MMWRweek(week1_date) 
epiweek1 

```

For example:

|origin_date|scenario_id|location|target|horizon|age_group|output_type|output_type_id|run_grouping|stochastic_run|value|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|2023-11-12|A-2023-10-27|US|inc hosp|NA|0-0.99|cdf|EW202346|NA|NA||
|2023-11-12|A-2023-10-27|US|inc hosp|NA|0-0.99|cdf|EW202347|NA|NA||
||||||||||||


### `value`

Values in the `value` column are non-negative numbers indicating the associated
output_type prediction for this row. 

#### Peak time hosp

For the `peak time hosp` target, the values in the `value` column are non-negative 
numbers between 0 and 1.  

### `age_group ` 

Accepted values in the  `age_group` column are:

- "0-0.99" (required)
- "1-4" (required)
- "5-17"
- "18-49"
- "50-64"
- "65-130" (required)
- "5-64" (required)
- "0-130" (required)

Aggregation of the previous list, for example: "0-17" is NOT accepted. 

Some of the `age_group` are optionals, however, the submission should contain 
at least the age group marked as required:`"0-0.99"`, `"1-4"`, `"5-64"`, 
`"65-130"`, and `"0-130"`.

**For the peak targets, only the age-group 0-130 is required.**


