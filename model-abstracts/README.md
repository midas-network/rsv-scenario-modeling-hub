# Model Abstract

This folder contains abstract files per round for team-models submitting to the 
Scenario Modeling Hub. 

----

## Subdirectory

Each sub-directory within the [model-abstract/](./) directory has the
format:

    team-model
    
where 

- `team` is the abbraviated teamname (`team_abbr`) and 
- `model` is the abbreviated name of your model (`model_abbr`). 

Both team and model should be less than 15 characters, and not include
hyphens nor spaces.

The `team-model` should correspond to the `team-model` sub-directory in the
associated model-output folder containing the associated projections. 

----

## Template

Each abstract is associated with a specific round. A template of 
the expected abstract format is available in the 
[template/](./template/) folder.


## Abstract file 

Each abstract file within the subdirectory should have the following 
name

    YYYY-MM-DD-team-model.md
    
where

- `YYYY` is the 4 digit year,
- `MM` is the 2 digit month,
- `DD` is the 2 digit day,
- `team` is the teamname, and
- `model` is the name of your model.

The date YYYY-MM-DD should correspond to the start date for scenarios
projection ("first date of simulated transmission/outcomes" as noted in the
scenario description on the main 
[README, Submission Information](https://github.com/midas-network/rsv-scenario-modeling-hub)).

Please keep the sections (or headings), lines starting with `#`, as 
they are in the templates and only change spaces marked with `FILL`.
All markdown associated format is accepted, except the addition of other 
sections (or headings).

For more information on the markdown format, please consult the 
[GitHub - Basic writing and formatting syntax help page](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)

### Examples

The [model-abstract/](./) contains an example abstract file from 
a `team2-modelb` team. The abstract file associated with the example
is a copy of a template file, the example here is mainly design
to illustrate the organization of the folder and the file naming system. 
