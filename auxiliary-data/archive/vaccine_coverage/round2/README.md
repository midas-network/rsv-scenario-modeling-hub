## Vaccine Coverage

The folder provides weekly 
state-specific cumulative coverage for specific rounds.

### Round 2 - 2024 / 2025

#### Senior

For round 2, the file 
[vaccine_coverage/RSV_round2_vax_coverage_seniors_2024_25.csv](./RSV_round2_vax_coverage_seniors_2024_25.csv) 
provides weekly vaccine coverage (cumulative percentage, cumulative no of doses, 
size of eligible population) for seniors from summer 2024 to the end of the 
projection period for RSVnet states. Separate values are provided for seniors 
60-74 high risk and 75+.

Coverage should be considered additive to that of last season. The same coverage 
values apply to all intervention scenarios (A-D), while the counterfactual (F) 
assumes no coverage.

#### Maternal & Infant

- [RSV_RD2_maternal_vaccine_2024_25.csv](./RSV_RD2_maternal_vaccine_2024_25.csv) 
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
- [RSV_RD2_nirsevimab_aggregated_2024_25.csv](./RSV_RD2_nirsevimab_aggregated_2024_25.csv) 
has a similar structure as the maternal vaccine file for nirsevimab. 
Note that the column `Dose_Type` indicates whether a baby is vaccinated at 
birth (at a constant rate throughout the season; New Born) or during the 
catch-up campaign (accelerated immunization in the first month of the season; 
Catch Up). `Eligible_babies_entire_season` reflects the number of babies in each 
category (catchup/newborn) who are **eligible for nirsevimab at any time point during 
the campaign.** Weekly incident and cumulative coverages are estimated based on 
this eligible population
- [RSV_RD2_nirsevimab_byweekofage_2024_25.csv](./RSV_RD2_nirsevimab_byweekofage_2024_25.csv) 
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
