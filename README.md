# RSV Scenario Modeling Hub

Last updated: 16-10-2026 for **Round 4 Scenarios**.

## Rationale    

Even the best models of infectious disease transmission struggle to give 
accurate forecasts at time scales greater than 3-4 weeks due to unpredictable 
drivers like changing policy environments, behavior change, development of new 
control measures, and stochastic events. However, policy decisions around the 
course of infectious diseases, particularly emerging and seasonal infections, 
often require projections in the time frame of months. The goal of long-term 
projections is to compare outbreak trajectories under different scenarios, as 
opposed to offering a specific, unconditional estimate of what “will” happen. 
As such, long-term projections can guide longer-term decision-making while 
short-term forecasts are more useful for situational awareness and guiding 
immediate response.

We have specified a set of scenarios and target outcomes to allow alignment of 
model projections for collective insights. Scenarios have been designed in 
consultation with academic modeling teams and government agencies (e.g., CDC).

This repository follows the guidelines and standards outlined by the 
[hubverse](https://hubdocs.readthedocs.io/), 
which provides a set of data formats and open source tools for modeling hubs.

## How to participate    

The RSV Scenario Modeling Hub is open to any team willing to provide projections
at the right temporal and spatial scales, with minimal gatekeeping. We only 
require that participating teams share point estimates and uncertainty bounds, 
along with a short model description and answers to a list of key questions 
about design. A major output of the projection hub is ensemble estimates of 
epidemic outcomes (e.g., infection, hospitalizations, and deaths), for different
time points, intervention scenarios, and US jurisdictions.

Those interested to participate, please read the README file and email us at 
scenariohub@midasnetwork.us .

Model projections should be submitted via pull request to the 
[model-output/](./model-output/) folder and associated metadata should be 
submitted at the same time to the [model-metadata/](./model-metadata/) folder 
of this GitHub repository. 
Technical instructions for submission and required file formats can be found 
[here](./model-output/README.md), 
[here, for the metadata file](./model_metadata/README.md) and in the 
[Wiki](https://github.com/midas-network/rsv-scenario-modeling-hub/wiki).

## Round 4: Projections for the 2026-27 season

The goal of this RSV round is to generate ensemble projections of RSV hospitalizations 
for the 2026-27 season under different intervention scenarios. Two questions of 
specific focus of this round are (i) the potential impact of revaccinating seniors who 
were vaccinated more than a year prior, and (ii) the benefits of infant interventions 
at realistic vs aspirational coverage levels. We will consider 5 scenarios, following 
a 2\*2 table crossing the impact of infant products versus senior vaccination, with a 
5th scenario illustrating a no-vaccination counterfactual. 

For infants, we consider realistic versus optimistic coverage of long-acting infant 
monoclonals and maternal vaccines. For seniors, we consider revaccination of 90% of 
seniors vaccinated during the 2023-24 or 2024-25 seasons versus no revaccination, 
with a modest rate of new vaccination proceeding in both scenarios among unvaccinated 
individuals. The counterfactual scenario will consider no RSV mitigation strategies 
implemented during the 2026-27 season for either infants or seniors. Projections will 
be generated for a 44-week period, running Sunday August 2, 2026 to Saturday June 5, 2027. 


The scenario structure is as follows:

<img src= "https://raw.githubusercontent.com/midas-network/rsv-scenario-modeling-hub/main/auxiliary-data/rounds/round4_viz/rsv_round4.png">


### Assumptions regarding RSV interventions

Weekly cumulative age-specific coverage for senior vaccines, maternal vaccines, 
and monoclonals will be provided. Because of the shifting population denominator 
of infants coming in and aging out of eligibility, and more than one vaccine dose
among seniors in the revaccination scenario, we will provide coverage as no. of 
doses and no. of eligible population per week, in addition to percent immunized. 
**This year, we will consider regional differences in senior immunization, as reported to 
[NIS](https://www.cdc.gov/rsvvaxview/dashboard/adults-50-coverage-intent.html)**. 
For infants, we will consider two coverage assumptions depending on whether 
immunization uptake is optimistic (sc A and B) or similar to last year in 2025-26 
(sc C and D). In contrast, coverage assumptions for seniors do not vary between 
scenarios.

Below, we describe important details of the planned implementation of RSV 
interventions as well as our rationale for intervention coverage and effectiveness 
assumptions. 

#### Converge assumptions and data

##### Data

- Vaccination curves for infant mAb, maternal vaccination, vaccination for high-risk 
  adults 50-74 and adults 75+ will be provided at the national level for all seasons 
  administered plus future scenarios.
- Additional vaccination curves for regions or individual states will be provided as 
  possible and available - some data are available, but only for select states and 
  time periods. 
- Data will be available on the GitHub

##### Assumptions

- Future coverage saturation levels are extrapolated from current saturation levels and 
  anticipated continued uptake. Last season we experienced a 6% increase in coverage 
  saturation. We used this increase to define the coming season’s saturation point.
- Current (2025-26 Season) Saturation by age/product nationally:
    - Infant protection: 55.7% (Feb 2026)
    - Maternal vaccine: 41.6% (Feb 2026)
    - Infant mAb: TBD
    - High risk adults 50-74yr vaccine: 32.8%
    - Adult 75+yr vaccine: 43.2%
- Future (2026-27 Season) Saturation by age/product nationally:
    - Infant mAb: 70% (high coverage), 56% (usual coverage) 
    - Maternal vaccine: 20% (high coverage), 10% (usual coverage)
    - High-risk adults 50-74yr vaccine: 40%
    - Adult 75+yr vaccine: 50%

#### Implementation of RSV Interventions

##### Infants

Immunization recommendations for infants are available on 
[CDC website](https://www.cdc.gov/rsv/vaccines/protect-infants.html)

a. *Long-acting monoclonal antibodies (nirsevimab)* were 
[recommended](https://www.cdc.gov/mmwr/volumes/72/wr/mm7234a4.htm) for prophylactic 
use in infants on August 3, 2023. Current recommendations are that all infants aged 
≤ 7 months who are born during or entering their first RSV season should be 
prioritized to receive the new monoclonals. Older children up to 19 months who are 
at increased risk for severe RSV disease may also be recommended. **We require that 
teams implement monoclonal interventions in infants ≤ 7 months during the RSV season**, 
while explicit consideration of interventions in older high-risk babies (a small fraction 
of all US babies, see later) is at teams’ discretion. Long-acting monoclonals are 
administered during the RSV season running Oct 1 -Mar 31. The process is as follows: 

  - *Newborns:* During the RSV campaign, a fraction of all newborns will receive 
    long-acting monoclonals at birth. Specifically, a fraction of children born 
    Oct 1 - Mar 30 receive a birth dose of monoclonals based on specified weekly 
    coverage.
  - *Babies born before RSV season and <7 months on October 1:*  During the RSV 
    campaign, a fraction of infants who were born prior to the start of the RSV 
    campaign and are aged 0-7 months at the start of the RSV campaign will receive 
    a dose of monoclonals. This administration takes place at an accelerated pace 
    during the first month of the campaign. Specifically, babies born Apr 1 -Sep 30 
    receive a dose during Oct 1-31.

Note: Two long-acting monoclonals are currently available, including nirsevimab and 
clorsevimab. The timing of administration and effectiveness of the two products is 
assumed to be the same. Teams have discretion to model products separately or in 
combination. The provided immunization coverage curves represent combined coverage 
for both products.

b. *Maternal RSV vaccine.* Maternal vaccines were recommended in fall 2023 for women 
who are 32 through 36 weeks pregnant during the RSV vaccine campaign. We assume that 
a fraction of eligible women will get one dose of maternal RSV vaccine throughout the 
RSV campaign. Babies will be protected at birth (approximately one month after mom’s 
vaccination) and throughout the RSV season. Specifically, a fraction of 32-36 wk 
pregnant women will receive vaccination during Sep 1 -Jan 31 based on weekly maternal 
vaccine coverage.

c. *No double immunization:* We assume that long-acting monoclonals are administered 
to babies whose mothers have **not** received the RSV vaccine. CDC recommendations are 
that parents choose one of the existing intervention strategies. In other words, the 
coverage of long-acting monoclonals and maternal vaccines should be considered additive 
(i.e. these modes of immunization target different babies).


##### Older Individuals

Older individual RSV vaccine recommendations are the same as last year, namely the vaccine 
is 
[recommended for all seniors 75+ and those 50-74 with risk conditions](https://www.cdc.gov/rsv/vaccines/older-adults.html). 
Current recommendations stipulate that 1) Individuals vaccinated during prior seasons 
should not be revaccinated 2) All unvaccinated seniors 75+ yrs are recommended for 
vaccination, and 3) All unvaccinated high-risk individuals 50-74 are recommended for 
vaccination. 

We assume that CDC revaccination guidelines were followed up closely in the past, 
so that seniors have only received a single dose so far. As a result, the historic 
coverage is cumulative between fall 2023 and summer 2026 (i.e., targeting different 
individuals). The same assumption applies to the projection period in scenarios B and D, 
in which revaccination is not allowed. However, scenarios A and C assume that a fraction 
of individuals vaccinated before Jan 1, 2025 will be revaccinated to mitigate waning. 
Teams should use the coverage curves provided for repeat vaccine recipients in scenarios 
A and C to implement revaccination. We suggest that teams implement revaccination 
differently from first-time vaccination either implicitly or explicitly in their model. 
Model assumptions regarding revaccination should be documented in the abstract.

Target data are available from RESP-NET for fine age groups, including 50-64, 65-74 and 
75+. The exact implementation of targeting eligible 50+ yrs is left at teams’ discretion.  
Similar to last year, we recommend that teams report estimates for <1, 1-4, 5-49, 50-74 
and 75+. Vaccine curves will be provided separately for high-risk individuals 50-74 and 
those 75+, for 2023-26 (historic vaccination for calibration) and for 2026-27 (scenarios 
during projection period). **Further, for scenarios A and C, we will provide separate 
vaccine curves for first time vaccine recipients and repeat vaccine recipients.**

We also assume that high risk guidelines are followed closely. **Is it estimated that 
50% of 60-74 yo have high-risk conditions that are eligible for RSV vaccines. Further, 
high-risk individuals aged 60-74 yo have a 6.2-fold (95% CI, 4.0-9.5) risk of RSV 
hospitalization compared to their healthy age peers** (CDC personal communication and 
[slide 104](https://www.cdc.gov/acip/downloads/slides-2024-06-26-28/11-RSV-Adult-Melgar-Roper-Britton-508.pdf)).   


##### Intervention effectiveness

All VE estimates are against hospitalization. 

Infants: We assume that VE is **80%** for infant monoclonals and **75%** for maternal 
vaccines, based on 
[recent CDC data](https://www.cdc.gov/acip/downloads/slides-2025-06-25-26/03-MacNeil-Mat-Peds-RSV-508.pdf).
Waning immunity for these products is at teams discretion; we refer to a recent 
modeling paper by Hodgson et al describing waning curves from 
[RCT data](https://pubmed.ncbi.nlm.nih.gov/38476752/) (see Fig SM3.6 SM3.9 in Supp).

For senior vaccines, the VE in the first year of vaccination is set at **80%**, which is 
an intermediate value between estimates from a 
[meta-analysis](https://www.cdc.gov/acip/downloads/slides-2025-04-15-16/04-Ortega-Sanchez-Adult-RSV-508.pdf)
and [real-world data from the 2023-24 and 2024-25 seasons in the US](https://jamanetwork.com/journals/jama/article-abstract/2838490). 
Vaccine waning against hospitalization should follow the bounds of 20-30% decline 
annually (ie, 0.7*VE_initial to 0.8*VE_initial). This 20-30% decline proceeds in 
the same way each additional year. This means that VE is between 56-64% VE  in the 
2nd year and 31-51% in the 3rd year . Teams can choose to sample a mean value or a 
distribution within the annual waning bounds. We provide references for guidance: An 
RCT assessed VE in the second season after vaccine receipt: 
[Ison et al, 2024](https://pubmed.ncbi.nlm.nih.gov/38253338/) and an observational 
case-control study assessed VE as a function of time since immunization, 
[Surie at al, 2025](https://jamanetwork.com/journals/jama/article-abstract/2838490)
(VE declined from 69% in 1st year to 48% in 2nd year, a 30% relative decline in VE). 
For models that consider an effect of the vaccine against infection, the waning of VE 
against infection is at teams discretion. All waning assumptions should be documented 
in the abstract.

A few additional auxiliary references are provided below.

- Senior Vaccine:  
  - RCTS
    - GSK, [Papi et al](https://www.nejm.org/doi/full/10.1056/NEJMoa2209604)
    - Pfizer, [Walsh et al](https://www.nejm.org/doi/full/10.1056/NEJMoa2213836)
  - Observational 2023-24 data
    - [Surie et al](https://jamanetwork.com/journals/jama/fullarticle/2823011)
    
- Infants - Nirsevimab:
  - RCTS
    - Full term infants, [Hammitt et al](https://www.nejm.org/doi/full/10.1056/NEJMoa2110275)
    - Pre-term infants, [Griffin et al](https://www.nejm.org/doi/full/10.1056/nejmoa1913556)
  - Observational 2023-24 data
    - [Payne](https://stacks.cdc.gov/view/cdc/157872)

- Maternal Vaccine:
  - RCTS:
    - [Kampmann et al](https://www.nejm.org/doi/full/10.1056/NEJMoa2216480)


##### Assumptions about vaccine effects on transmission 

It is at teams’ discretion to proportionate VE values into protection against 
infection, protection against severe disease given infection, and any effect on 
transmission. However note that the current thinking and available data, 
[Wilkins et al](https://www.nature.com/articles/s41591-023-02316-5) suggests a 
limited protection against infection, if any. There is no data on transmission 
and the possible impact on these interventions on RSV shedding, so a small to 
moderate transmission effect cannot be ruled out.


##### Assumptions about duration of protection

Teams can refer to existing literature cited in the above section. As a general 
guideline, monoclonals and maternal vaccines are only expected to provide sizable 
protection within the first 6 months after receipt, while senior protection is 
more long-lasting. Teams have discretion to explore waning for infant products, 
while waning for seniors should be within the bounds provided.


##### Other RSV-specific interventions

Consideration of non-specific RSV interventions such as a low level of 
residual masking is allowed.


##### Counterfactual scenario (scenario E)

 In this scenario, we consider no new immunization in 2026-2027 in either 
 seniors or infants. This is a change from last year’s counterfactual. In 
 this scenario, as with all scenarios, immunizations prior to the start of 
 the projection period are assumed to have occurred as reported historically.


### RSV Model Calibration

#### RESP-NET Dataset

Age- and state-specific data on laboratory-confirmed RSV hospitalization rates are 
available for 12 states and the US from RESP-NET spanning 2017-18 to present 
(https://www.cdc.gov/resp-net/dashboard/). The RSV data come from the RSV-NET 
system, which is an RSV hospitalization surveillance network that collects data on 
laboratory-confirmed RSV-associated hospitalizations through a network of acute care
hospitals in a subset of states (13 states as of August 2024; WA joined for the 
2024-25 season). Age-specific weekly rates per 100,000 population are reported 
in this system. We have moved to the RESP-NET dataset rather than RSV-NET because 
RSV-NET is reporting monthly since summer 2026; however these are essentially the 
same data. 

The data has been standardized and posted on the SMH 
[RSV github](https://github.com/midas-network/rsv-scenario-modeling-hub) and is updated 
weekly. **The target in this data is the weekly number of hospitalizations in each 
given state (inc_hosp variable), for all ages and by age group.** To obtain counts, 
we have converted RSV-NET weekly rates based on state population sizes. This method 
assumes that RSV-NET hospitals are representative of the whole state. To obtain national 
US counts, we have used the rates provided for the “overall RSV-NET network”. The data 
covers the 2016-2017 season to present. Reported age groups include: [under 1 yr], , 
[1-4 yr], [5-17 yr], [18-49 yr], [50-64 yr], and [65-74] and 75+ years. The standardized 
dataset provided by SMH includes week- state- and age-specific RSV counts (the target), 
rates, and population sizes.  Those wishing to obtain more resolved age data (eg 0-6mon 
vs 6mo-1yr) should consult RSV-net directly.

The source of age distribution used for calibration (RESP-NET vs other estimates) should 
be provided in the abstract meta-data that is submitted with the projections.


#### Other RSV datasets available for calibration

A few auxiliary datasets, updated weekly (except POPHIVE), are available in the
[auxiliary-data/rsv folder](https://github.com/midas-network/rsv-scenario-modeling-hub/tree/main/auxiliary-data/rsv) including: 

- National and region-specific CDC surveillance from 
  [NREVSS](https://github.com/midas-network/rsv-scenario-modeling-hub/tree/main/auxiliary-data/rsv#the-national-respiratory-and-enteric-virus-surveillance-system-nrevss)
- State-specific and national ED data with demographic information 
  (national only) 
- Data on trends in RSV testing is available from 
  [PopHIVE](https://github.com/midas-network/rsv-scenario-modeling-hub/tree/main/auxiliary-data/rsv#pophive).


Given that the risk of RSV hospitalization changes substantially throughout the 
first year of life, and that timing of interventions differs for catch-up babies 
(who are older and less at risk) vs newborns (who are at highest risk), we 
recommend that teams consider the risk profile of infants by month (or 2-month) 
of age. Detailed hospitalization risk estimates are available
[here, Curns et al.](https://publications.aap.org/pediatrics/article/153/3/e2023062574/196566/Respiratory-Syncytial-Virus-Associated?autologincheck=redirected). 


### Targets

In this round, we will **require submission of 300 individual trajectories 
for each target** while submission of **quantiles is optional**. Targets will 
be based on the RESP-NET dataset. The required targets for trajectories **will 
be weekly RSV incident hospital admissions. We request hospitalization counts 
for the 12 RSV-NET states and nationally, for all ages, and for a set of minimal 
age groups.** A more resolved set of age groups is strongly encouraged (see below). 
Estimates of cumulative counts can be obtained from weekly trajectories and hence 
we do not require trajectories for cumulative counts. Similarly, peak targets (peak 
hospital admission magnitude and peak timing) can be reconstructed from weekly 
trajectories. Teams who wish to submit quantiles along with trajectories should 
provide quantiles for weekly and cumulative counts, as well as for hospital admission 
peak size and peak timing. 


#### Weekly targets

- Weekly *reported* all-age and age-specific state-level incident hospital 
  admissions, based on RESP-NET. This dataset is updated daily and covers 
  2017-present. There should be no adjustment for reporting (=raw data from 
  RESP-NET dataset to be projected). A current and standardized version of 
  the weekly data has been posted [here](https://github.com/midas-network/rsv-scenario-modeling-hub/tree/main/target-data/)
- **Optional**, Weekly all-age and age-specific state-level incident infection
- No case target
- No death target
- All targets should be numbers of individuals, rather than rates

#### Age target

##### Required

- Hospital admissions should be provided for the following age groups: 
  all ages,  <1 yr, 1-4, 5-49, 50-64, 65+. (Most of the RSV 
  burden on hospitalizations comes from the 0-1 and 65+ age groups.)


##### Additional age details (optional)

- Weekly state-specific and national RSV hospitalizations among individuals 
  <1 yr, 1-4, 5-17, 18-49, 50-64, 65-74, 75+ and all ages  (Most of the RSV 
  burden on hospitalizations comes from the 0-1 and 65-74 and 75+ age 
  groups.)


#### Optional targets (if submitting quantiles in addition to trajectories)

- Cumulative hospital admissions. Cumulative outcomes start at 0 at the start 
  of projections, on Aug 2, 2026.
- State-level peak hospital admissions
- State-level timing of peak hospital admission

### Timeline

- **Scenarios set (no changes after)**: *Friday, Aug 28, 2026*
- **Projections due**: *Tuesday, Oct 20, 2026*
- **Report finalized**: *November 2026*

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
  children and seniors. Maternal immunity is expected to be brief.
- Teams are allowed to vary prior immunity by age or other demographic 
  characteristic, and state.
- Unlike influenza virus, antigenic evolution is not a key feature of RSV.

#### COVID-19 Interactions

- No major interactions with future COVID-19 and flu surges (e.g., 
  immunological, social, behavioral) should be considered in this round.
- We note that many studies have reported that RSV circulation was perturbed 
  during the COVID19 pandemic, as can be seen in the RSVnet data. Whether and 
  how to fit the COVID19 pandemic period is left at teams discretion

#### Projection Period

- **Sun Aug 2, 2026 to Sat June 5, 2027 (44 weeks)**
  - NO CALIBRATION TO DATA after Saturday Aug 1,2026

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
discretion of the teams. In addition to the RESP-NET hospital admission 
dataset, CDC’s NREVSS 
[viral surveillance dataset](https://github.com/midas-network/rsv-scenario-modeling-hub/tree/main/auxiliary-data/rsv/nrevss) 
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
| Scenario A. Senior revaccination and high coverage of infant interventions     | SenRevax_highInfCov    | A-2026-08-01 |
| Scenario B. No senior revaccination and high coverage of infant interventions  | noSenRevax_highInfCov  | B-2026-08-01 |
| Scenario C. Senior revaccination and usual coverage of infant interventions    | SenRevax_usualInfCov   | C-2026-08-01 |
| Scenario D. No senior revaccination and usual coverage of infant interventions | noSenRevax_usualInfCov | D-2026-08-01 | 
| Scenario E. Counterfactual                                                     | counterfactual         | E-2026-08-01 |

*   **Projection Due date**: Tuesday Oct 20, 2026
*   **End date for fitting data**: Saturday Aug 1, 2026
*   **Start date for scenarios**: Sunday Aug 2, 2026 (first date of simulated transmission/outcomes)
*   **Simulation end date:** Saturday June 5, 2027 (44-week horizon)

*   Desire to release results by November 2026

#### Other submission requirements

- Simulation trajectories: We ask that teams submit a sample of 300-600 
  trajectories most likely to capture the uncertainty of the simulated process. 
  For some models, this may mean a random sample of simulations, for others with 
  larger numbers of simulations, it may require weighted sampling. Trajectories 
  will need to be paired across **age, horizon, and scenarios** 
  (e.g., for a given model, location, scenario and week, all age data for 
  simulation 1 corresponds to the sum of age-specific estimates for
  simulation 1).

- Geographic scope: state-level and national projections
  - 12 states or a subset of 12 states, US overall recommended. We note 
  that WA and NC joined RSV-NET after 2023-24. 
  **Projections for NC and WA are optional.**

- Results: 
  - Summary: Results must consist of a subset of weekly targets listed
    below; all are not required. 
  - Weeks follow epi-weeks (Sun-Sat) dated by the last day of the week. 
  - **Weekly Targets**: 
    - Weekly incident hospitalizations by location, all ages and 
    age-specific

- Metadata: We will require a brief meta-data form, from all teams.

- Uncertainty: 
  - For trajectories (required submission): we require 300
    trajectories, paired.
  - For quantiles (optional submission) We ask for 0.01, 0.025, 0.05,
    every 5% to 0.95, 0.975, and 0.99. 


## Target data

The [target-data/](./target-data/) folder contains the RSV hospitalization data
(also called "truth data") standardized from:
- [Weekly Rates of Laboratory-Confirmed RSV Hospitalizations from the RSV-NET Surveillance System](https://data.cdc.gov/Public-Health-Surveillance/Weekly-Rates-of-Laboratory-Confirmed-RSV-Hospitali/29hc-w46k) until 2026-08-28.
- [RESP-NET Rates and Clinical Data](https://data.cdc.gov/Public-Health-Surveillance/RESP-NET-Rates-and-Clinical-Data/kvib-3txy/about_data), starting 2026-08-28.

The target data is outputted in the [hubverse format](https://hubverse.io/en/latest/user-guide/target-data.html).

The weekly hospitalization number per location is used as truth data in the hub.

More information on the source, workflow and archive files are
available in the [auxiliary-data/target-data/](./auxiliary-data/target-data/) 
folder.

The code to generate the data are available in the [src](./src) folder.

## Auxiliary Data

The repository stores and updates additional data relevant to the RSV modeling 
efforts in the [auxiliary-data/](./auxiliary-data/) folder:

- Vaccine Coverage: data on vaccination coverage that can be used for a 
  specific round

- Population and census data:
    - National and State level name and fips code as used in the Hub and
    associated population size.
    - State level population size per year and per age from the US Census 
    Bureau.

- Birth Rate:
    - Birth Number and Rate per state and per year from 1995 to 2022 included.
    - Data from the US Census Bureau and from the Centers for Disease Control 
    and Prevention, National Center for Health Statistics. National Vital 
    Statistics System, Natality on CDC WONDER Online Database.

- RSV data:
    - The National Respiratory and Enteric Virus Surveillance System (NREVSS)
    data at national and state level [ARCHIVED].
    - The [Weekly Rates of Laboratory-Confirmed RSV Hospitalizations from the RSV-NET Surveillance System](https://data.cdc.gov/Public-Health-Surveillance/Weekly-Rates-of-Laboratory-Confirmed-RSV-Hospitali/29hc-w46k)
    - The [National Emergency Department Visits for COVID-19, Influenza, and Respiratory Syncytial Virus](https://www.cdc.gov/respiratory-viruses/data/emergency-department-visits.html)

- Target Data Archive: archive of the target-data time-series data. The data 
  are automatically updated on Monday, and a version with additional information
  (rate, population size). The data are automatically moved to this folder, 
  with the date append to the file name.

- Reports: Reports from RSV Scenario Modeling Hub rounds results. Each report 
    contains an executive summary with key messages and results, and analyses 
    of ensemble and individual projections.
    
- Rounds: Information on ongoing round and previous round available in the 
  repository
    - [Round 1 - 2023/2024](./auxiliary-data/rounds/round1.md)
    - [Round 1 - 2024/2025](./auxiliary-data/rounds/round2.md)
    - [Round 1 - 2025/2026](./auxiliary-data/rounds/round3.md)
  
- Model Examples: Model output and metadata example files

For more information, please consult the associated 
[README file](./auxiliary-data/README.md).

## Data license and reuse

All source code that is specific to the overall project is available under an 
open-source [MIT license](https://opensource.org/licenses/MIT). We note that 
this license does NOT cover model code from the various teams, model scenario 
data (available under specified licenses as described above) and auxiliary data.

## Computational power

Those teams interested in accessing additional computational power should 
contact Katriona Shea at k-shea@psu.edu. Additional resources might be available from the 
[MIDAS Coordination Center](https://midasnetwork.us) - please contact questions@midasnetwork.us 
for information. 

## Funding

Scenario modeling groups are supported through grants to the contributing investigators.

The Scenario Modeling Hub site is supported by the MIDAS Coordination Center, NIGMS 
Grant U24GM132013 (2019-2024) and R24GM153920 (2024-2029) to the University of Pittsburgh.

## Teams and models

- [CEPH Lab at Indiana University — ASTRA_RSV](./model-metadata/CEPH-ASTRA_RSV.yaml)
    - Marco Ajelli (Indiana University Bloomington),
    Paulo C. Ventura (Indiana University Bloomington),
    Shreeya Mhade (Indiana University Bloomington),
    Maria Litvinova (Indiana University Bloomington)
 
- [Johns Hopkins University and University of North Carolina at Chapel Hill - flepiMoP](./model-metadata/JHU_UNC-flepiMop.yaml)
    - Shaun Truelove (JHU), Alison Hill (JHU),
    Justin Lessler (UNC), Sara Loo (JHU), 
    Joseph Lemaitre (UNC), Anjalika Nande (JHU),
    Madeleine Gastonguay (JHU), Sung-mok Jung (UNC), 
    Timothy Willard (UNC), Carl Pearson (UNC),
    Vivek Murali (JHU)

- [University of North Carolina Charlotte - Hierbin](./model-metadata/UNCC-Hierbin.yaml)
    -  Chen S (UNCC), Janies D (UNCC), Paul R (UNCC)

- [University of Texas at Austin - UT-ImmunoSEIRS](./model-metadata/UT-ImmunoSEIRS.yaml)
    -  Kaiming Bi (UTA), Shraddha Ramdas Bandekar (UTA), 
    Anass Bouchnita (The University of Texas at El Paso), 
    Spencer J. Fox (The University of Georgia),
    Lauren Ancel Meyers (UTA)

### Past Teams and Models

- [CEPH Lab at Indiana University - MetaRSV](.model-metadata/CEPH-MetaRSV.yaml)
    -  Marco Ajelli (Indiana University Bloomington),
    Shreeya Mhade (Indiana University Bloomington),
    Paulo C. Ventura (Indiana University Bloomington),
    Maria Litvinova (Indiana University Bloomington)

- [Columbia University — RSV_SVIRS](./model-metadata/CU-RSV_SVIRS.yaml)
    - Teresa Yamana (CU), Sen Pei (CU)

- [MOBS Lab at Northeastern University - GLEAM RSV Model](./model-metadata/MOBS_NEU-GLEAM_RSV.yaml)
    - Alessandro Vespignani (Network Science Institute, NEU), 
    Matteo Chinazzi (The Roux Institute, NEU, Portland (ME); 
    Network Science Institute, NEU),
    Jessica T. Davis (Network Science Institute, NEU), 
    Clara Bay (Network Science Institute, NEU), 
    Guillaume St-Onge (The Roux Institute, NEU, Portland (ME); 
    Network Science Institute, NEU),

- [National Institutes of Health - RSV_MSIRS](./model-metadata/NIH-RSV_MSIRS.yaml)
    - Kaiyuan Sun (Fogarty International Center, NIH), 
    Cécile Viboud (Fogarty International Center, NIH)

- [National Institutes of Health - RSV_Phenomenological](./model-metadata/NIH-RSV_Phenomenological.yaml)
    - Kaiyuan Sun (Fogarty International Center, NIH), 
    Cécile Viboud (Fogarty International Center, NIH)

- [National Institutes of Health - RSV_WIN](./model-metadata/NIH-RSV_WIN.yaml)
    - Chelsea Hansen (Fogarty International Center, NIH), 
    Samantha Bents (Fogarty International Center, NIH), 
    Cécile Viboud (Fogarty International Center, NIH)
    
- [Predictive Sciences - Package for Respiratory Disease Open-source Forecasting](./model-metadata/PSI-PROF.yaml)
    - James Turtle (Predictive Science Inc), 
    Michal Ben-Nun (Predictive Science Inc), 
    Pete Riley (Predictive Science Inc)

- [University of Notre Dame - FRED](./model-metadata/NotreDame-FRED.yaml)
    -  Sean Moore (UND), Alex Perkins (UND), Guido Espana (CDC Center for Forecasting and Analysis)

- [University of Southern California - SIkJalpha](./model-metadata/USC-SIkJalpha.yaml)
    -  Ajitesh Srivastava (USC), Majd Al Aawar (USC)

- [University of Virginia - EpiHiper Scenario Modeling for RSV](./model-metadata/UVA-EpiHiperRSV.yaml)
    - Jiangzhuo Chen (UVA), Stefan Hoops (UVA), Bryan Lewis (UVA),
    Srini Venkatramanan (UVA), Parantapa Bhattacharya (UVA),
    Dustin Machi (UVA), Madhav Marathe (UVA)

## The RSV Scenario Modeling Hub Coordination Team    

 - Shaun Truelove, Johns Hopkins University
 - Cécile Viboud, NIH Fogarty
 - Justin Lessler, University of North Carolina
 - Sara Loo, Johns Hopkins University
 - Lucie Contamin, University of Pittsburgh
 - Emily Howerton, Penn State University
 - Claire Smith, Johns Hopkins University
 - Harry Hochheiser, University of Pittsburgh
 - Katriona Shea, Penn State University
 - Michael Runge, USGS
 - Erica Carcelen, John Hopkins University
 - Sung-mok Jung, University of North Carolina
 - Jessi Espino, University of Pittsburgh
 - John Levander, University of Pittsburgh
 - Samantha Bents, NIH Fogarty
 - Katie Yan, Penn State University

