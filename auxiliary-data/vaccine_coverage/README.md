## Vaccine Coverage

The folder provides weekly 
state-specific cumulative coverage for specific rounds.

### Round 3 - 2025 / 2026

#### Senior

- [reported_immunization_seniors_2425.csv](./reported_immunization_seniors_2425.csv) 
provides weekly vaccine coverage for seniors for the 2024-2025 season at region and
national level, from the National Immunization Survey (NIS). For state projections, 
we advise teams to use the data for the region that the state is in.

- [Seniors_state_coverage_2025_26](./Seniors_state_coverage_2025_26.csv) provides
weekly vaccine coverage for seniors for the 2025-2026 season (projected) and
2024-2025 season at state level. The 2024-25 season data uses the regional NIS data 
corresponding to each state. Data represent the weekly cumulative percent of eligible 
group vaccinated since the start of the program (`cum_cov_percent`, ie 26 represents 26% 
vaccinated), the equivalent cumulative no of doses given (`cum_cov_doses`) and the population
size of eligible groups (`pop`). Data are provided for 3 separate groups: all 75 yrs+, 
60-74 with high risk, and 50-59 with high risk.  All senior scenarios should use the same 
coverage provided in this file.


#### Maternal & Infants

- [reported_immunization_infants_2324_2425.csv](./reported_immunization_infants_2324_2425.csv)
has weekly national coverage for the 2023-2024 and 2024-2025 seasons for
maternal vaccine and Nirsevimab, from the NIS survey.

- [Infants_state_coverage_2025_26](./Infants_state_coverage_2025_26.csv) has weekly 
projected immunization coverage at state and national level for the 2025-2026 season 
with two coverage assumptions depending on whether immunization uptake is optimistic 
(sc A and B) or similar to last year in 2024-25 (sc C and D). 
Data are provided separately for: 
    - catch up babies (under 6 months when they enter the RSV season on Oct 1, and 
    receiving nirsevimab in the first month of the campaign)
    - babies born during the RSV season and receiving nirsevimab at a constant rate 
    during Oct-Mar
    - mothers 32-36 weeks of gestation who receive the vaccine at a constant rate 
    from Sep to Jan
The file provides the weekly percent of the eligible population covered by each of the 
interventions (`weekly_incident_cov`, where for instance 1 means 1% covered each week), 
the weekly cumulative percent coverage (`weekly_cum_cov`, where for instance 26 means 26%), 
and the weekly number of doses given (`weekly_doses`). The file also has the total number 
of births each year (`Births_per_year`), the total population in the jurisdiction (`total_pop`), 
the denominator (ie the size of the eligible population for a given intervention) and denominator type 
(explaining whether denominators are eligible babies or eligible moms). As a result, 
weekly_doses = weekly_incident_cov / 100 \* denominator.
Data are provided for optimistic coverage scenario A and pessimistic scenario C. 
Teams should use scenario A coverage assumptions for scenario B, and scenario C 
assumptions for scenario D.
