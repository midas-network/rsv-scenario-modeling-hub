# RSV Scenario Modeling Hub

Last updated: 02-10-2024 for **Round 2 Scenarios**.

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

## Round 2: Projections for the 2024-25 season

The goal of this RSV round is to expand on RSV modeling capabilities developed 
last year by the Scenario Modeling Hub to generate ensemble projections of RSV 
hospitalizations for the 2024-25 season under different intervention scenarios. 
Two questions of particular interest are (i) the potential impact of waning of 
vaccine-induced immunity among seniors in the second year after vaccination and 
(ii) the optimal timing of infant interventions. We will consider 5 scenarios 
in total, following a 2 * 2 table describing the impact of infant products 
(first dimension, early and classic timing of administration of nirsevimab 
and maternal vaccine) and senior vaccination (second dimension, optimistic 
and pessimistic waning of vaccine effectiveness). A 5th counterfactual scenario 
will consider no RSV mitigation strategy implemented in either 2023-24 or 2024-25.
 Projections will be generated for a 45-week period, running Sun July 28, 2024 
 to Sat June 7, 2025. 

The scenario structure is as follows:

<img src= "./rounds/round2_viz/rsv_round2.png">

### Assumptions regarding RSV interventions

Weekly cumulative age-specific coverage for senior vaccines, maternal 
vaccine, and monoclonals will be provided. Because of the shifting population 
denominator of infants coming in and aging out of eligibility, and the 
issue with seniors not being recommended for revaccination, we will provide 
coverage as no. of doses and no. of eligible population per week. 

Below, we describe important details of the planned implementation of RSV 
interventions as well as our rationale for intervention coverage and 
effectiveness assumptions. 

#### Implementation of RSV Interventions


##### Infants

Immunization recommendations for infants are available on 
[CDC website](https://www.cdc.gov/rsv/vaccines/protect-infants.html)

a. *Long-acting monoclonal antibodies (nirsevimab)* were 
[recommended](https://www.cdc.gov/mmwr/volumes/72/wr/mm7234a4.htm) for 
prophylactic use in infants on August 3, 2023. Current recommendations 
are that all infants aged **≤ 7 months** who are born during or entering 
their first RSV season should be prioritized to receive the new monoclonals.
Older children up to 19 months who are at increased risk for severe 
RSV disease may also be recommended. **We require that teams implement 
monoclonal interventions in infants ≤ 7 months** , while explicit 
consideration of interventions in older high-risk babies (a small 
fraction of all US babies, see later) is at teams’ discretion. The 
timing of administration of long-acting monoclonals depends on the 
scenario modeled (Aug 15-Mar 30 or Oct 1-Mar 30). 
The process is as follows: 

  - Newborns: During the RSV campaign, a fraction of all newborns 
    will receive long-acting monoclonals at birth (fraction based on 
    weekly monoclonal coverage). Specifically, for scenarios A-B (early 
    timing of interventions), a fraction of children born Aug 15 - Mar 
    30 receive a birth dose of monoclonals based on weekly coverage. For 
    scenarios C-D (classic timing of interventions), a fraction of 
    children born Oct 1 - Mar 30 receive a birth dose of monoclonals 
    based on weekly coverage.
  - Babies (0-7m):  During the RSV campaign, a fraction of infants
    who were born prior to the start of the RSV campaign and are aged
    0-7 months at the start of the RSV campaign will receive a dose 
    of monoclonals. This administration takes place at an accelerated 
    pace during the first month of the campaign. Specifically, for 
    scenarios A-B (early timing of interventions), babies born 
    Apr 1 - Aug 14 receive a nirsevimab dose during the first month of 
    the campaign, namely Aug 15 -Sep 15. For scenarios C-D (classic 
    timing of interventions), babies born Apr 1 -Sep 30 receive a dose 
    during Oct 1-31.

b. *Maternal RSV vaccine.* Maternal vaccines were recommended in fall 
2023 for women who are 32 through 36 weeks pregnant during the RSV 
vaccine campaign. We assume that a fraction of eligible women will 
get one dose of maternal RSV vaccine throughout the RSV campaign. Babies 
will be protected at birth (approximately one month after mom’s vaccination) 
and throughout the RSV season.  Specifically, for scenarios A-B (early 
timing of interventions), a fraction of 32-36 wk pregnant women receive 
vaccine during July 15-Jan 31 based on weekly coverage. For scenarios C-D 
(classic timing of interventions), a fraction of 32-36 wk pregnant women 
receive vaccine during Sep 1 -Jan 31 based on weekly coverage. For all 
scenarios A-D, we assume that 25% of eligible women are immunized.

c. *No double immunization:* We assume that nirsevimab is administered to 
babies whose mother has not received the RSV vaccine. CDC recommendations 
are that parents choose one of the two existing intervention strategies.  
In other words, the coverage of nirsevimab and maternal vaccines should 
be considered additive (ie these modes of immunization target different 
babies).


##### Seniors

Senior RSV vaccine recommendations were 
[updated for the 2024-25 season](https://www.cdc.gov/rsv/vaccines/older-adults.html). 
Current recommendations stipulate that 1) Seniors vaccinated during the 
2023-24 season should not be revaccinated 2) All unvaccinated seniors 75+ 
yrs are recommended for vaccination, and 3) All  high-risk seniors 60-74 
not yet vaccinated are recommended for vaccination. 

We recommend that teams consider vaccination in all individuals 60+ yrs, 
even though the hospitalization target data is only available for individuals 
65+ yrs. The exact implementation of targeting 60+ yrs is left at teams’ 
discretion. Vaccine curves will be provided separately for high-risk 
individuals 60-74 and those 75+, for both 2023-24 (reported vaccination) 
and 2024-25 (hypothesized vaccination). 

We assume that CDC revaccination guidelines are followed up closely, so 
that seniors vaccinated last year ***will not*** get revaccinated this year. 
**Hence the coverage from last year and this year should be considered as 
additive (i.e., targeting different individuals).**

Further, we also assume that high risk guidelines are followed closely. 
**Is it estimated that 50% of 60-74 yo have high-risk conditions that 
are eligible for RSV vaccines. Further, high-risk individuals aged 
60-74 yo have a 6.2-fold (95% CI, 4.0-9.5) risk of RSV hospitalization 
compared to their healthy age peers (CDC personal communication and 
[slide 104](https://www.cdc.gov/acip/downloads/slides-2024-06-26-28/11-RSV-Adult-Melgar-Roper-Britton-508.pdf)).**


##### Coverage assumptions

Vaccination will proceed seasonally, similarly to the flu vaccine, 
between Aug 2024 and June 2025. We will index the coverage of RSV 
interventions on a combination of this past year’s coverage and the 
flu vaccine 
[coverage](https://www.cdc.gov/rsvvaxview/dashboard/index.html) 
in a given state and relevant age group. Indexing on flu is meant 
to address the potential increase of RSV coverage in 2024-25, compared 
to 2023-24, and remedy the lack of state-specific coverage information 
for infants, while reflecting the propensity of different states to 
adopt health interventions. 
**Senior and infant immunization coverage curves will be provided for all 
projection weeks and target locations.**


##### Intervention effectiveness

This year, we have updated VE estimates for RSV products in light of 
real-world observational data published for the 2023-24 season (except 
for maternal vaccines, for which there is no real world effectiveness 
data). All VE estimates are against hospitalization. 

We assume that VE is 80% for infant monoclonals and 60% for maternal 
vaccines. Waning immunity for these products is at teams discretion; 
we refer to a recent modeling paper by 
[Hodgson et al](https://pubmed.ncbi.nlm.nih.gov/38476752/) describing 
waning curves from RCT data  (see Fig SM3.6 SM3.9 in Supp).

For senior vaccines, the VE in the first year of vaccination is set at 
75%. The VE in the second year is reduced due to waning, with the level 
of reduction depending on scenario. VE is reduced by 10% in the second 
year in optimistic scenarios A, C, with a second year VE assumed to be 
75 * .9 = 68%. VE is reduced by 50% in the second year in scenarios B 
and D, so that VE = 75*.5=38%. The pessimistic assumption of 50% 
reduction by the second year is based on the lower bound of VE estimates 
from a RCT assessing VE in the second season after vaccine receipt, 
[Ison at al.](https://pubmed.ncbi.nlm.nih.gov/38253338/).
The waning distribution is left at team’s discretion provided that the 
average VE level remains at 75% within one year of vaccination, and at 
38% or 68% on average within the second year of vaccine.

A few auxiliary references are provided below.

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

It is at teams’ discretion to proportionate VE values into protection against 
infection, protection against severe disease given infection, and any effect on 
transmission. However note that the current thinking and available data, 
[Wilkins et al](https://www.nature.com/articles/s41591-023-02316-5) suggests a 
limited protection against infection, if any. There is no data on transmission 
and the possible impact on these interventions on RSV shedding, so a small to 
moderate transmission effect cannot be ruled out.


##### Assumptions about duration of protection

Teams can refer to existing literature cited in the above section. As a 
general guideline, monoclonals and maternal vaccines are only expected to 
provide sizable protection within the first 6 months after receipt, while 
senior protection is expected to persist for 2 years. Within this timeframe, 
there can be waning of VE. We will explore waning uncertainty via our scenarios 
for seniors. Further, teams have discretion to explore waning for infant 
products, which would potentially interact with the scenario assumptions 
regarding early and late administration.


##### Other RSV-specific interventions

Consideration of non-specific RSV interventions such as a low level of 
residual masking is allowed.


##### Counterfactual scenario (scenario E)

In this scenario, we consider no change to the historic policy of RSV 
mitigation, which consists in the absence of senior vaccination (neither 
in 2023-24 nor 2024-25) and a limited coverage of palivizumab monoclonals 
to high-risk premature infants (~2% of the US birth cohort receives a partial 
or full dose,
[Ambrose et al](https://www.tandfonline.com/doi/full/10.4161/hv.32082)). The 
calibration data available from 2017-present takes into account the impact 
of palivizumab. Teams have discretion to consider this policy explicitly or 
ignore it given the small fraction of infants covered. We note that high risk 
premature infants <6mo who previously would have received palivizumab (the 
older treatment) will now receive the new monoclonal nirsevimab, with comparable 
effectiveness. 


### RSV Model Calibration

#### RSV-NET Dataset

Age- and state-specific data on laboratory-confirmed RSV hospitalization rates 
are available for 12 states and the US from RSV-NET spanning 2017-18 to present 
([RSV-NET CDC Webpage](https://www.cdc.gov/rsv/php/surveillance/rsv-net.html)). 
RSV-NET is an RSV hospitalization surveillance network that collects data on 
laboratory-confirmed RSV-associated hospitalizations through a network of acute 
care hospitals in a subset of states (13 states as of August 2024; WA joined for 
the 2024-25 season). Age-specific weekly rates per 100,000 population are 
reported in this system. 

The data has been standardized and posted on the [SMH RSV github](./target-data/) 
and will be updated weekly. **The target in this data is the weekly number of 
hospitalizations in each given state (inc_hosp variable), for all ages and by 
age group.** To obtain counts, we have converted RSV-NET weekly rates based 
on state population sizes. This method assumes that RSV-NET hospitals are 
representative of the whole state. To obtain national US counts, we have used the 
rates provided for the “overall RSV-NET network”. The data covers 2017-present. 
Reported age groups include: [0-6 months], [6-12 months], [1-2 yr], [2-4 yr], 
[5-17 yr], [18-49 yr], [50-64 yr], and [65-74] and 75+ years. The standardized 
dataset provided by SMH includes week- state- and age-specific RSV counts 
(the target), rates, and population sizes. 

The source of age distribution used for calibration (RSV-NET vs other 
estimates) should be provided in the abstract meta-data that is submitted 
with the projections.


#### Other RSV datasets available for calibration

A few auxiliary datasets have been posted in the GitHub repositority 
[auxiliary-data/ folder](./auxiliary-data/) including: 

- state-specific CDC surveillance from NVERSS (data available until end of
  April 2024)
- state-specific ED data from NSSP 

Given that the risk of RSV hospitalization changes substantially throughout 
the first year of life, and that timing of interventions differs for catch-up 
babies (who are older and less at risk) vs newborns (who are at highest risk), 
we recommend that teams consider the risk profile of infants by month (or 
2-month) of age. Detailed hospitalization risk estimates are available 
[here, Curns et al.](https://publications.aap.org/pediatrics/article/153/3/e2023062574/196566/Respiratory-Syncytial-Virus-Associated?autologincheck=redirected). 


### Targets

In this round, we will **require submission of 100-300 individual trajectories 
for each target** while submission of **quantiles is optional**. Targets will 
be based on the RSV-NET dataset. The required targets for trajectories **will 
be weekly RSV incident hospital admissions. We request hospitalization counts 
for the 12 RSV-NET states and nationally, for all ages, and for a set of minimal 
age groups.** A more resolved set of age groups is strongly encouraged (see 
below). Estimates of cumulative counts can be obtained from weekly trajectories 
and hence we do not require trajectories for cumulative counts. Similarly, peak 
targets (peak hospital admission magnitude and peak timing) can be reconstructed 
from weekly trajectories. Teams who wish to submit quantiles along with 
trajectories should provide quantiles for weekly and cumulative counts, as 
well as for hospital admission peak size and peak timing. 

#### Weekly targets

- Weekly *reported* all-age and age-specific state-level incident hospital 
  admissions, based on RSV-NET. This dataset is updated daily and covers 
  2017-2024. There should be no adjustment for reporting (=raw data from 
  RSV-NET dataset to be projected). A current and standardized version of 
  the weekly data has been posted [here](./target-data/)
- **Optional**, Weekly all-age and age-specific state-level incident hospital
- No case target
- No death target
- All targets should be numbers of individuals, rather than rates

#### Age target

##### Required

- Hospital admissions should be provided for the following age groups: 
  all ages,  <1 yr, 1-4, 5-64, **65-74, and 75+**. (Most of the RSV 
  burden on hospitalizations comes from the 0-1 and 6-74 and 75+ age 
  groups.)


##### Additional age details (optional)

- Weekly state-specific and national RSV hospitalizations among individuals 
  <1 yr, 1-4, 5-17, 18-49, 50-64, 65-74, 75+ and all ages


#### Optional targets (if submitting quantiles in addition to trajectories)

- Cumulative hospital admissions. Cumulative outcomes start at 0 at the start 
  of projections, on Nov 12, 2023
- Cumulative and incident infection. Cumulative outcomes start at 0 at the start 
  of projections, on Nov 12, 2023
- State-level peak hospital admissions
- State-level timing of peak hospital admission

### Timeline

- **Scenarios set (no changes after)**: *Friday, Oct 4, 2024*
- **Projections due**: *Tuesday, Oct 29, 2024*
- **Report finalized**: *No later than November 13, 2024*

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
  immunological, social, behavioral) should be considered in this round 
- We note that many studies have reported that RSV circulation was perturbed 
  during the COVID19 pandemic, as can be seen in the RSVnet data. Whether and 
  how to fit the COVID19 pandemic period is left at teams discretion

#### Projection Period

- **Sun July 28, 2024 to Sat June 7, 2025 (45 weeks)**
  - NO CALIBRATION TO DATA after July 28,2024

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
[viral surveillance dataset](./auxiliary-data/rsv/nrevss) 
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
| Scenario A. Optimistic senior waning and early infant interventions              | optSen_ealyrInf     | A-2024-09-20 |
| Scenario B. Pessimistic senior waning and early infant interventions             | pessSen_ealyrInf    | B-2024-09-20 |
| Scenario C. Optimistic senior waning and classic timing of infant interventions  | optSen_classicrInf  | C-2024-09-20 |
| Scenario D. Pessimistic senior waning and classic timing of infant interventions | pessSen_classicrInf | D-2024-09-20 | 
| Scenario E. Counterfactual                                                       | counter_fact        | E-2024-09-20 |

*   **Projection Due date**: Tuesday, Oct 29, 2024
*   **End date for fitting data**: July 27, 2024
*   **Start date for scenarios**: Sunday July 28, 2024 (first date of simulated transmission/outcomes)
*   **Simulation end date:** Saturday June 7, 2025 (45-week horizon)

*   Desire to release results by mid-November 2024

#### Other submission requirements

- Simulation trajectories: We ask that teams submit a sample of 100-300 
  simulations replicates. Simulations should be sampled in such a way that 
  they will be most likely to produce the uncertainty of the simulated process. 
  For some models, this may mean a random sample of simulations, for others 
  with larger numbers of simulations, it may require weighted sampling. 
  Trajectories will need to be paired across **age, horizon, and scenarios** 
  (e.g., for a given model, location, scenario and week, all age data for 
  simulation 1 corresponds to the sum of age-specific estimates for
   simulation 1).

- Geographic scope: state-level and national projections
  - 12 states or a subset of 12 states, US overall recommended. We note 
  that WA joined RSV-NET in 2024-25 and will not be considered here due 
  to lack of historic data for calibration.

- Results: 
  - Summary: Results must consist of a subset of weekly targets listed
    below; all are not required. 
  - Weeks follow epi-weeks (Sun-Sat) dated by the last day of the week. 
  - **Weekly Targets**: 
    - Weekly incident hospitalizations by location, all ages and 
    age-specific
    - Weekly indicent infection by location, all ages and age-specific
    (optional)

- Metadata: We will require a brief meta-data form, from all teams.

- Uncertainty: 
  - For trajectories (required submission): we require 100 to 300 
  trajectories.
  - For quantiles (optional submission) We ask for 0.01, 0.025, 0.05,
    every 5% to 0.95, 0.975, and 0.99. Teams are also encouraged to submit 
    0 (min value) and 1 (max) quantiles if possible. 

## Target data

The [target-data/](./target-data/) folder contains the RSV hospitalization data
(also called "truth data") standardized from the 
[Weekly Rates of Laboratory-Confirmed RSV Hospitalizations from the RSV-NET Surveillance System](https://data.cdc.gov/Public-Health-Surveillance/Weekly-Rates-of-Laboratory-Confirmed-RSV-Hospitali/29hc-w46k).

The weekly hospitalization number per location are going to be used as truth 
data in the hub.

## Auxiliary Data

The repository stores and updates additional data relevant to the RSV modeling 
efforts in the [auxiliary-data/](./auxiliary-data/) folder:

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

## Teams and models

- [CEPH Lab at Indiana University - MetaRSV](.model-metadata/CEPH-MetaRSV.yaml)
    -  Marco Ajelli (Indiana University Bloomington),
    Shreeya Mhade (Indiana University Bloomington),
    Paulo C. Ventura (Indiana University Bloomington),
    Maria Litvinova (Indiana University Bloomington),
    Snigdha Agrawal(Indiana University Bloomington)

- [Columbia University — RSV_SVIRS](./model-metadata/CU-RSV_SVIRS.yaml)
    - Teresa Yamana (CU), Sen Pei (CU)
 
- [Johns Hopkins University and University of North Carolina at Chapel Hill - flepiMoP](./model-metadata/JHU_UNC-flepiMop.yaml)
    - Shaun Truelove (JHU), Alison Hill (JHU),
    Justin Lessler (UNC), Sara Loo (JHU), 
    Joseph Lemaitre (UNC), Anjalika Nande (JHU),
    Anne Hebert (JHU), Madeleine Gastonguay (JHU),
    Sung-mok Jung (UNC), Vivek Murali (JHU)

- [MOBS Lab at Northeastern University - GLEAM RSV Model](./model-metadata/MOBS_NEU-GLEAM_RSV.yaml)
    - Alessandro Vespignani (Network Science Institute, NEU), 
    Matteo Chinazzi (The Roux Institute, NEU, Portland (ME)),
    Jessica T. Davis (Network Science Institute, NEU), 
    Clara Bay (Network Science Institute, NEU), 
    Guillaume St-Onge (Network Science Institute, NEU)

- [National Institutes of Health - RSV_MSIRS](./model-metadata/NIH-RSV_MSIRS.yaml)
    - Kaiyuan Sun (Fogarty International Center, NIH), 
    Cécile Viboud (Fogarty International Center, NIH)

- [National Institutes of Health - RSV_Phenomenological](./model-metadata/NIH-RSV_Phenomenological.yaml)
    - Kaiyuan Sun (Fogarty International Center, NIH), 
    Cécile Viboud (Fogarty International Center, NIH)

- [National Institutes of Health - RSV_WIN](./model-metadata/NIH-RSV_WIN.yaml)
    - Samantha Bents (Fogarty International Center, NIH), 
    Cécile Viboud (Fogarty International Center, NIH),
    Chelsea Hansen (Fogarty International Center, NIH)

- [Predictive Sciences - Package for Respiratory Disease Open-source Forecasting](./model-metadata/PSI-PROF.yaml)
    - James Turtle (Predictive Science Inc), 
    Michal Ben-Nun (Predictive Science Inc), 
    Pete Riley (Predictive Science Inc)

- [University of Notre Dame - FRED](./model-metadata/NotreDame-FRED.yaml)
    -  Sean Moore (UND), Alex Perkins (UND, Guido Espana (CDC Center for Forecasting and Analysis)

- [University of Southern California - SIkJalpha](./model-metadata/USC-SIkJalpha.yaml)
    -  Ajitesh Srivastava (USC), Majd Al Aawar (USC)

- [University of Texas at Austin - UT-ImmunoSEIRS](./model-metadata/UT-ImmunoSEIRS.yaml)
    -  Kaiming Bi (UTA), Shraddha Ramdas Bandekar (UTA), 
    Anass Bouchnita (The University of Texas at El Paso), 
    Spencer J. Fox (The University of Georgia),
    Lauren Ancel Meyers (UTA)

- [University of Virginia - EpiHiper Scenario Modeling for RSV](./model-metadata/UVA-EpiHiperRSV.yaml)
    - Jiangzhuo Chen (UVA), Stefan Hoops (UVA), Bryan Lewis (UVA),
    Srini Venkatramanan (UVA), Lacey Critchley (UVA), 
    Parantapa Bhattacharya (UVA), Dustin Machi (UVA), 
    Madhav Marathe (UVA)



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

