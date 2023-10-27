## Round 1: Impact of new interventions - Mid-season projections for the 2023-24 season

The primary goal of SMH RSV Round 1 is to build capacity within the hub to model
Respiratory Syncytial Virus (RSV) dynamics in the US and assess the feasibility
of modeling this pathogen at the scale of the US given limited availability of
epidemiological data. A secondary goal is to use nascent RSV modeling
capabilities to generate ensemble projections for the impact of new
interventions that are coming online during the 2023-24 season. We will
consider 5 scenarios in total, following a 2*2 table describing the impact
of long-acting monoclonals targeted at infants (first dimension, optimistic
and pessimistic protection) and senior vaccination (second dimension,
optimistic and pessimistic protection). A 5th counterfactual scenario will
consider status quo RSV mitigation. Projections will be generated for a
29-week period, running Sun Nov 12, 2023 to Sat June 1, 2024. The scenario
structure is as follows:

<img src= "https://raw.githubusercontent.com/midas-network/rsv-scenario-modeling-hub/main/rounds/round1_viz/rsv_round1.png">

### Assumptions regarding RSV interventions

Weekly cumulative age-specific coverage for vaccines and monoclonals are
[provided](./auxiliary-data//vaccine_coverage/RSV_round1_Coverage_2023_2024.csv).

We describe important details of the planned implementation of RSV
interventions below as well as our rationale for vaccine coverage and
effectiveness assumptions.

#### Implementation of RSV Interventions

##### Infants

Long-acting monoclonal antibodies (nirsevimab) were
[recommended](https://www.cdc.gov/mmwr/volumes/72/wr/mm7234a4.htm)
for prophylactic use in infants on August 3, 2023, and an
[update](https://emergency.cdc.gov/han/2023/han00499.asp#:~:text=In%20the%20context%20of%20limited,risk%20for%20severe%20RSV%20disease)
due to limited availability in the 2023-24 season  was issued on
October 23, 2023. Current recommendations are that all infants aged <6 months
who are born during or entering their first RSV season should be prioritized to
receive the new monoclonals. Older children up to 19 months who are at
increased risk for severe RSV disease should not be prioritized for the new
monoclonals. Older children at high risk will continue to receive the older
monoclonals used in prior years.
**We require that teams implement new monoclonal interventions in infants <6 months**,
while explicit consideration of interventions in older high-risk babies (a
small fraction of all US babies, see later) is at teams’ discretion. The new
long-acting monoclonals will be administered in most of the continental United
States from October through the end of March, the months of highest RSV
activity.

For infants < 6 months the process is as follows:

- during the RSV season Oct 2023-Mar 2024, a fraction of all newborns will
  receive long-acting monoclonals at birth (fraction based on weekly
  monoclonal coverage)
- a fraction of infants who are born from Apr-Sep 2023 and are <6 months at
  the start of the season will receive a catch up dose of monoclonals during
  the RSV season, Oct 2023-Mar 2024 (also based on weekly coverage). No
  infant >= 6 months can receive monoclonals.

##### Seniors

Senior RSV vaccination was
[recommended](https://www.cdc.gov/mmwr/volumes/72/wr/mm7229a4.htm) in July 2023
for individuals over 60 yrs. We recommend that teams consider vaccination in
all individuals 60+ yrs, even though the hospitalisation target data is only
available for individuals 65+ yrs. However the exact implementation of
targeting 60+ yrs is left at teams’ discretion. Vaccination will proceed
seasonally, similarly to the flu vaccine, between Sep 2023 (slightly slower
start than flu vaccine) and June 2024. Because RSV is not a well known pathogen
among seniors, and recommendations stipulate that vaccination should occur
after consultation with a physician (unlike flu), we assume that the
intervention will have limited uptake.

##### Coverage assumptions

We will index the coverage of RSV interventions on flu vaccine coverage in a
given state and relevant age group to reflect different propensities of
different states to adopt new health interventions. The roll out of RSV
interventions is likely to be slow since it is the first year interventions
have been approved, and there are shortages and fee reimbursement issues for
infant interventions.

CDC flu vaccine curves from 2021-22 will be used to estimate anticipated
coverage of RSV interventions (similarly to recent flu and COVID-19 rounds).
Specifically, for infants, weekly interpolated flu coverage will be shifted by
2 months (monoclonals will start on Oct 1, 2023) and administration will end at
the end of March 2024 to reflect i) a late start of RSV interventions in the
2023-24 season and ii) CDC recommendations. For seniors, we will use the actual
timing of flu vaccination shifted by only one month since the RSV vaccine was
recommended in the summer. For both infants and seniors, weekly flu vaccine
estimates will be adjusted for the intended level of RSV coverage saturation.
We generally expect real coverage in 2023-24 to track with our pessimistic
coverage assumptions, while we have chosen optimistic levels of coverage that
would reflect potential benefits in a future season with no shortage and more
awareness of these interventions.
**Senior and infant vaccination coverage curves are provided for all projection weeks and target locations**,
in the [Github auxiliary data folder](./auxiliary-data/vaccine_coverage/)

##### VE Assumptions

We stipulate VE against hospitalizations for both senior vaccination and infant
monoclonals, since severe RSV disease is the primary endpoint of most clinical
trials (generally lower respiratory tract infection or RSV-associated
hospitalizations, see literature below).
Scenario assumption values are based on optimistic and pessimistic
interpretation of the randomized control trial data. For seniors, VE values
considered are **70%** (scenarios B, D) and **90%** (scenarios A, C).
For infants, VE values considered are **60%** (scenarios C, D) and
**80%** (scenarios A, B).

RCTs – senior vaccines:
- GSK, [Papi et al](https://www.nejm.org/doi/full/10.1056/NEJMoa2209604)
- Pfizer, [Walsh et al](https://www.nejm.org/doi/full/10.1056/NEJMoa2213836)

RCTs in infants - Nirsevimab:
- Full term infants, [Hammitt et al](https://www.nejm.org/doi/full/10.1056/NEJMoa2110275)
- Pre-term infants, [Griffin et al](https://www.nejm.org/doi/full/10.1056/nejmoa1913556)

It is at teams’ discretion to proportionate VE values into protection against
infection, protection against severe disease given infection, and any effect on
transmission. However note that the current thinking and available data
suggests a very limited protection against infection,
[Wilkins et al](https://www.nature.com/articles/s41591-023-02316-5),
if any. There is no data on transmission and the possible impact on these
interventions on RSV shedding, so a small to moderate transmission effect
cannot be ruled out.

##### Assumptions about duration of protection

We do not prescribe a specific duration of protection for senior vaccination or
infant monoclonals. Teams can refer to existing literature cited in the above
section. As a general guideline, monoclonals are expected to provide protection
for a mean of 6 months, while senior protection remains relatively stable
within 2 years of vaccination.

##### Other RSV-specific interventions

None of the scenarios consider maternal vaccination (to protect infants after
birth) since maternal interventions are not expected to have high enough
coverage to make a significant impact on the 2023-24 season at the time of
scenario specification. Teams should not model maternal vaccines. Consideration
of non-specific RSV interventions such as a low level of residual masking is
allowed.

##### Counterfactual scenario (scenario E)

In this scenario, we consider no change to the historic policy of RSV
mitigation, which consists in a limited coverage of palivizumab monoclonals
to high-risk premature infants (~2% of the US birth cohort receives a partial or
full dose,
[Ambrose et al](https://www.tandfonline.com/doi/full/10.4161/hv.32082)).
The calibration data available from 2017-present takes into account the impact
of this intervention. Teams have discretion to consider this policy explicitly
or ignore it given the small fraction of infants covered. We note that high
risk premature infants <6mo who previously would have received palivizumab
(the older treatment) will now receive the new monoclonal nirsevimab, with
comparable effectiveness. Due to shortages in 2023-24, older high risk babies
will keep receiving palivizumab this season.

Fig 1: RSV  vaccination coverage ramp up in seniors 60+ yrs

<img src= "https://raw.githubusercontent.com/midas-network/rsv-scenario-modeling-hub/main/rounds/round1_viz/SeniorRSV_Coverage_2023_2024.png">

Fig 2: RSV monoclonals usage ramp up in infants <6 mo throughout the RSV
season Oct-Mar

<img src= "https://raw.githubusercontent.com/midas-network/rsv-scenario-modeling-hub/main/rounds/round1_viz/InfantsRSV_Coverage_2023_2024.png">

### RSV Model Calibration

#### RSV-NET Dataset

Age- and state-specific data on laboratory-confirmed RSV hospitalization rates
are available for 12 states and the US from RSV-NET spanning 2017-18 to present
([RSV-NET CDC Webpage](https://www.cdc.gov/rsv/research/rsv-net/index.html)).
RSV-NET is an RSV hospitalization surveillance network that collects data on
laboratory-confirmed RSV-associated hospitalizations through a network of
acute care hospitals in a subset of states (12 states as of August 2023).
Age-specific weekly rates per 100,000 population are reported in this system.

The data has been standardized and posted on the
[SMH RSV github target-data/ folder](./target-data/) and is updated weekly.
**The target in this data is the weekly number of hospitalizations in each given state (inc_hosp variable), for all ages and by age group**.
To obtain counts, we have converted RSV-NET weekly rates based on state
population sizes. This method assumes that RSV-NET hospitals are representative
of the whole state. To obtain national US counts, we have used the rates
provided for the “overall RSV-NET network”. The data covers 2017-present.
Reported age groups include: [0-6 months[, [6-12 months[, [1-2 yr[, [2-4 yr[,
[5-17 yr[, [18-49 yr[, [50-64 yr[, and 65+ years.  The standardized dataset
provided by SMH includes week- state- and age-specific RSV counts (the target),
rates, and population sizes.
**Note that different states joined RSVnet in different years (between 2014 and 2018) while RSV surveillance throughout the network was initially limited to adults. Children RSV surveillance began in the 2018-19 season.**

The source of age distribution used for calibration (RSV-NET vs other
estimates) should be provided in the abstract metadata that is submitted with
the projections.

#### Other RSV datasets available for calibration

A few auxiliary datasets have been posted in the GitHub repositority
[auxiliary-data/ folder](./auxiliary-data/) including:

- state-specific CDC surveillance from NVERSS (only last year of data available)
- state-specific ED data (only last year of data available)

### Targets

In this round, we will
**require submission of 100 individual trajectories for each target** while
**submission of quantiles is optional**. Targets will be based on the RSV-NET
dataset. The required targets for trajectories
**will be weekly RSV incident hospital admissions (counts) in the 12 RSV-NET states, nationally for all ages, and for a set of minimal age groups; a more resolved set of age groups is strongly encouraged (see below)**.
Estimates of cumulative counts can be obtained from weekly trajectories and
hence we do not require trajectories for cumulative counts. Similarly, peak
targets (peak hospital admission magnitude and peak timing) can be
reconstructed from weekly trajectories. Teams who wish to submit quantiles
along with trajectories should provide quantiles for weekly and cumulative
counts, as well as for hospital admission peak size and peak timing.

#### Weekly targets

- Weekly *reported* all-age and age-specific state-level incident hospital
  admissions, based on RSV-NET. This dataset is updated daily and covers
  2017-2023. There should be no adjustment for reporting (=raw data from
  RSV-NET dataset to be projected). A current and standardized version of
  the weekly data has been posted [here](./target-data/)
- No infection target
- No case target
- No death target
- All targets should be numbers of individuals, rather than rates

#### Age target

##### Required

- Hospital admissions should be provided for the following age groups:
  all ages,  <1 yr, 1-4, 5-64, and 65+. (Most of the RSV burden on
  hospitalizations comes from the 0-1 and 65+ age groups)

##### Additional age details (optional)

- Weekly state-specific and national RSV hospitalizations among individuals
  <1 yr, 1-4, 5-17, 18-49, 50-64, 65+, and all ages

#### Optional targets (if submitting quantiles in addition to trajectories)

- Cumulative hospital admissions. Cumulative outcomes start at 0 at the start
  of projections, on Nov 12, 2023
- State-level peak hospital admissions
- State-level timing of peak hospital admission

### Timeline

- **Scenarios set (no changes after)**: *Friday, Oct 27, 2023*
- **Projections due**: *Tuesday, Nov 14, 2023*
- **Report finalized**: *No later than November 24, 2023*

### Other specifications and assumptions

#### Overall RSV dynamics and severity

Several reference studies are worth considering to set (or guide) RSV model
parameters that cannot be estimated from the available hospitalization data.
These include work by Ginny Pitzer and colleagues in the US (see
[Pitzer et al](https://pubmed.ncbi.nlm.nih.gov/25569275/) for state-specific
models driven by environmental drivers in the pre-intervention era, including
Table 2 for parameters; and
[Zheng et al](https://pubmed.ncbi.nlm.nih.gov/36302926/) for an
updated model with interventions).
Risk of severity given infection was parametrized in these models based on
children cohort studies in the US and Kenya: see
[Nokes et al](https://pubmed.ncbi.nlm.nih.gov/15499540/),
[Glezen et al](https://pubmed.ncbi.nlm.nih.gov/3706232/), and
[Breese Hall at al](https://pubmed.ncbi.nlm.nih.gov/19196675/).

Since these studies have been published, there has been an increased
recognition of the burden of RSV among seniors (see
[Jackson et al](https://academic.oup.com/jid/article/223/1/147/585958),
[Rha et al](https://publications.aap.org/pediatrics/article/146/1/e20193611/37046/Respiratory-Syncytial-Virus-Associated),
and
[McLaughlin et al](https://academic.oup.com/ofid/article/9/7/ofac300/6609557?login=false)

#### Prior Immunity

- Prior immunity is at each team’s discretion. Immunity against infection is
  waning rapidly for RSV; based on prior modeling work, estimates of duration of
  immunity against infection range between 200-365 days. However, immunity
  against severe disease can be more long-lasting and generally increases with
  age and  number of prior infections (eg see discussion in
  [Pitzer et al](https://pubmed.ncbi.nlm.nih.gov/25569275/)). Overall, most
  individuals will get reinfected multiple times throughout life, but severe RSV
  infections that lead to hospitalizations tend to only occur among young
  children and seniors. Maternal immunity is expected to be brief
- Teams are allowed to vary prior immunity by age or other demographic
  characteristic, and state
- Unlike influenza virus, antigenic evolution is not a key feature of RSV

#### COVID-19 Interactions

- No major interactions with future COVID-19 and flu surges (e.g.,
  immunological, social, behavioural) should be considered in this round
- We note that many studies have reported that RSV circulation was perturbed
  during the COVID19 pandemic, as can be seen in the RSVnet data. Whether and
  how to fit the COVID19 pandemic period is left at teams discretion

#### Projection Period

- Sun Nov 12, 2023 to Sat June 1, 2024 (29 weeks)

#### State-level variability

- Variability in severity and **reporting to RSV-NET** between states is
  possible

#### Seasonality

Teams should include their best estimates of RSV seasonality in their model but
we do not prescribe a specific level of seasonal forcing.

#### NPI

No reactive NPIs to COVID-19 or influenza should be modeled in this round;
low level masking is allowed at groups’ discretion.

#### Seeding of RSV

We leave seeding intensity, timing and geographic distribution at the
discretion of the teams. In addition to the RSV-NET hospital admission
dataset, CDC’s NVERSS
[viral surveillance dataset](https://github.com/midas-network/rsv-scenario-modeling-hub)
is a good resource for state-specific information on epidemic intensity
(e.g., weekly % positive, or weekly ILI*%positive), and can be used to adjust
seeding.

#### Initial Conditions

Prior immunity and amount of infections at the start of the projection period
is at the discretion of the teams based on their interpretation of the
scenarios. Variation in initial prevalence between states is left at teams’
discretion.

**All of the teams’ specific assumptions should be documented in meta-data and abstract.**

## Submission Information

| Scenario | Scenario name | Scenario ID for submission file (`scenario_id`) |
| ---------------------------------------------- |:-----------------:|:--------------------:|
| Scenario A. Optimistic protection from both senior and infant interventions                               | optInf_optSen   | A-2023-10-27 |
| Scenario B. Optimistic protection from infant monoclonals, Pessimistic protection from senior vaccination | optInf_pessSen  | B-2023-10-27 |
| Scenario C. Pessimistic protection from infant monoclonals, Optimistic protection from senior vaccination | pessInf_optSen  | C-2023-10-27 |
| Scenario D. Pessimistic protection from both senior and infant interventions                              | pessInf_pessSen | D-2023-10-27 |
| Scenario E. Counterfactual                                                                                | counter_fact.   | E-2023-10-27 |

*   **Projection Due date**: Tuesday, Nov 14, 2023
*   **End date for fitting data**:  Between Saturday Oct 28, 2023 and Saturday Nov 11, 2023
*   **Start date for scenarios**: Sunday November 12, 2023 (first date of simulated transmission/outcomes)
*   **Simulation end date:**  June 1, 2024 (29-week horizon)
*   Desire to release results by late-November 2023

#### Other submission requirements

- Simulation trajectories: We ask that teams submit a sample of 100 simulation
  replicates. Simulations should be sampled in such a way that they will be most
  likely to produce the uncertainty of the simulated process. For some
  models, this may mean a random sample of simulations, for others with
  larger numbers of simulations, it may require weighted sampling. Trajectories
  will need to be paired across age groups (eg, for a given model, location,
  scenario and week, all age data for simulation 1 corresponds to the sum of
  age-specific estimates for simulation 1).
- Geographic scope: state-level and national projections
  - 12 states or a subset of 12 states, US overall recommended.

- Results:
  - Summary: Results must consist of a subset of weekly targets listed
    below; all are not required.
  - Weeks follow epi-weeks (Sun-Sat) dated by the last day of the week.
  - **Weekly Targets**: Weekly incident hospitalizations by location,
    all ages and age-specific

- Metadata: We will require a brief meta-data form, from all teams.

- Uncertainty:
  - For trajectories (required submission): we require 100 trajectories.
  - For quantiles (optional submission) We ask for 0.01, 0.025, 0.05,
    every 5% to 0.95, 0.975, and 0.99. Teams are also encouraged to submit
    0 (min value) and 1 (max) quantiles if possible.
