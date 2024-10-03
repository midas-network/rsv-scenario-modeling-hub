# Data submission instructions

This page is intended to provide teams with all the information they
need to submit scenarios.  

All projections should be submitted directly to the [model-output/](./) 
folder. Data in this directory should be added to the repository
through a pull request. 

Due to file size limitation, the file can be submitted in a in a 
`.parquet` or `.gz.parquet`.

----
## Example

The GitHub Repository contains multiple example files reproducing the 
required and optional targets for RSV round 1 and different sample format: 

- Team 2 - Model B: 
  - Example file: [2023-11-12-team2-modelb.parquet](./team2-modelb)
- Team 3 - Model C
  - Example file: [2023-11-12-team3-modelc.parquet](./team3-modelc)
- Team 4 - Model D:
  - Example file: [2023-11-12-team4-modeld.parquet](./team4-modeld)
- Team 5 - Model E:
  - Example file: [2023-11-12-team5-modele.parquet](./team5-modele)

For more information on the different sample format, please consult the 
[Sample Format Wiki page](https://github.com/midas-network/rsv-scenario-modeling-hub/wiki/Sample-File-Format).

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
```r
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

#### Column format

|Column Name|Accepted Format|
|:---:|:---:|
|`origin_date`|character, date (datetime not accepted)|
|`scenario_id`|character|
|`target`|character|
|`horizon`|numeric, integer|
|`location`|character|
|`age_group`|character|
|`output_type`|character| 
|`output_type_id`|numeric, character, logical (if all `NA`)| 
|`value`|numeric|
|`run_grouping`|numeric, integer|
|`stochastic_run`|numeric, interger|

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

Addition for round 2:

- sample:
    - weekly incident infection
- quantile:
    - weekly incident infection
    - weekly cumulative infection

For the incident and cumulative targets, the age groups:
`"0-0.99"`, `"1-4"`, `"5-64"`, `"65-130"`, and `"0-130"` are 
required, all the incident and cumulative targets can also include other age 
group information (optional).

For the peak targets, only the age groups `"0-130"` is accepted.

Values in the `target` column must be one of the following character strings:

- `"inc hosp"`
- `"cum hosp"`
- `"peak size hosp"`
- `"peak time hosp"`
- `"inc inf"` (starting round 2)
- `"cum inf"` (starting round 2)


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

#### inc inf

This target is the incident (weekly) number of infection
predicted by the model during the week that is N weeks after
`origin_date`.

A week-ahead scenario should represent the total number of new
infection reported during a given epiweek (from Sunday through
Saturday, inclusive).

#### cum inf

This target is the cumulative number of incident (weekly) number of
infection predicted by the model during the week that is N
weeks after `model_projection_date`.  There should be 0 cumulative
hospitalization on week 0 of projection.

A week-ahead scenario should represent the cumulative number of
infection reported up to the Saturday of a given epiweek.


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
[FIPS numeric code file](../auxiliary-data/location_census/locations.csv) 
which includes numeric FIPS codes for U.S. states, counties, and territories, 
as well as "US" for national scenarios. 

Please note that when writing FIPS codes, they should be written in as a 
character string to preserve any leading zeroes.

For the round 1, only the location included in RSV-NET target data are 
expected:
`"US","06","08","09","13","24","26","27","35","36","41","47","49"`


Starting round 2: 

- the same location as in Round 1 are expected: 
`"US","06","08","09","13","24","26","27","35","36","41","47","49"`

- optional to submit additional state and territories. See 
[location.csv](../auxiliary-data/location_census/locations.csv) for
a complete list of all accepted location. 


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
[Sample Format Wiki page](https://github.com/midas-network/rsv-scenario-modeling-hub/wiki/Sample-File-Format).

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
- "65-74"
- "75-130" 
- "65-130" (required)
- "5-64" (required)
- "0-130" (required)

Aggregation of the previous list, for example: "0-17" is NOT accepted. 

Some of the `age_group` are optionals, however, the submission should contain 
at least the age group marked as required:`"0-0.99"`, `"1-4"`, `"5-64"`, 
`"65-130"`, and `"0-130"`.

**For the peak targets, only the age-group 0-130 is required.**

----

## Scenario validation

To ensure proper data formatting, pull requests for new data or updates in
model-output/ will be automatically validated

When a pull request is submitted, the data are validated by running the
scripts in [validation.R](../code/validation/validation.R). The intent for
these tests are to validate the requirements above and all checks are 
specifically enumerated 
[on the Validation wiki page]([https://github.com/midas-network/frsv-scenario-modeling-hub/wiki/Validation](https://github.com/midas-network/rsv-scenario-modeling-hub/wiki/Validation)).

Please [let us know](https://github.com/midas-network/rsv-scenario-modeling-hub/issues) if
the wiki is inaccurate or if any questions.

#### Workflow

When a pull request is submitted, the validation will be 
automatically triggered.

- If the pull request (PR) contains update on metadata 
and/or abstract file(s):
    - These files are manually validated, the automatic validation
    will only returns a message indicating it did not run any
    validation. 

- If the PR contains model output submission file(s). The validation 
automatically runs and output a message and a PDF file containing the 
quantiles projections of the requested targets at national and State
level (only if available in the submission file).

    - The validation has 3 possible output:
        - "Error": the validation has failled and returned a message 
        indicating the error(s). The error(s) should be fixed to have the PR 
        accepted
        - "Warning": the PR can be accepted. However, it might be necessary 
        for the submitting team to validate if the warning(s) is expected or 
        not before merging the PR.
        - "Success": the validation did not found any issue and returns a message 
        indicating that the validation is a success and the PR can be merged.


#### Run checks locally

To run these checks locally rather than waiting for the results from a pull
request, follow [these instructions](https://github.com/midas-network/rsv-scenario-modeling-hub/wiki/Validation#file-checks-running-locally)
(section File Checks Running Locally).



