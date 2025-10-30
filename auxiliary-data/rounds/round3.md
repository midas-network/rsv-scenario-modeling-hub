## Round 3: Projections for the 2025-26 season

The goal of this RSV round is to generate ensemble projections of RSV
hospitalizations for the 2025-26 season under different intervention scenarios.
Two questions of particular interest are (i) the potential impact of vaccine
waning among seniors now in their second or third year after vaccination and
(ii) the potential benefits of infant interventions at different coverage
levels. We will consider 5 scenarios in total, following a 2*2 table describing
the impact of infant products (first dimension; moderate vs high coverage of
long-acting infant monoclonals and maternal vaccines) and senior vaccination
(second dimension; optimistic vs pessimistic waning of senior vaccine immunity).
A 5th counterfactual scenario will consider no RSV mitigation strategies
implemented during the 2023-24,  2024-25, and 2025-26 seasons (during which
these new products came to market). Projections will be generated for a 45-week
period, running Sunday July 27, 2025 to Saturday June 6, 2026. 


The scenario structure is as follows:

<img src= "https://raw.githubusercontent.com/midas-network/rsv-scenario-modeling-hub/main/auxiliary-data/rounds/round3_viz/rsv_round3.png">

### 2025-26 RSV Round Summary

##### Timeline

- **Scenarios set (no changes after)**: Friday, Oct 31, 2025
- **Projections due**: Tuesday, Nov 11, 2025
- **Report finalized**: End of November 2025

##### Change from last round

- **New age breakdown**: 
    - 2025-26 Round: <1 yr, 1-4, **5-49**, **50-64**, 65+
    - 2024-25 Round: <1 yr, 1-4, 5-64, 65+
- **Senior vaccination expanded age**:
    - 2025-26 Round: **50+ yrs (50-74 high risk, all 75+)**
    - 2024-25 Round: 60+ yrs (60-74 high risk, all 75+)
    - 2023-24 Round: 60+ yrs (all 60+ yrs based on clinical recommendations)
- **Assumptions for VE against hospitalizations for maternal immunization**: 
    - 2025-26 Round:  **75%**
    - 2024-25 Round:  60%


### Assumptions regarding RSV interventions

Weekly cumulative age-specific coverage for senior vaccines, maternal vaccine, 
and monoclonals will be provided. Because of the shifting population denominator
of infants coming in and aging out of eligibility, and the issue with seniors 
not being recommended for revaccination, we will provide coverage as no. of 
doses and no. of eligible population per week, in addition to percent immunized.
**This year, we will consider state-specific differences in infant 
immunization.** State-specific coverage curves will use NIS data reported for 
2024-25 to establish a timeline and saturation point for vaccination nationally,
while geographic differences will be indexed on last year’s state specific
coverage reported to IIS. 

For infants, we will consider two coverage assumptions depending on whether 
immunization uptake is optimistic (sc A and B) or similar to last year in 
2024-25 (sc C and D). In contrast, coverage assumptions for seniors do not 
vary between scenarios.

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
monoclonal interventions in infants ≤ 7 months during the RSV season**, 
while explicit consideration of interventions in older high-risk babies 
(a small fraction of all US babies, see later) is at teams’ discretion. The 
timing of administration of long-acting monoclonals depends on the 
scenario modeled (Aug 15-Mar 30 or Oct 1-Mar 30). 
The process is as follows: 

  - Newborns: During the RSV campaign, a fraction of all newborns will receive 
    long-acting monoclonals at birth. Specifically, a fraction of children born 
    Oct 1 - Mar 30 receive a birth dose of monoclonals based on specified 
    weekly coverage.
  - Babies born before RSV season and <7 months on October 1:  During the RSV 
    campaign, a fraction of infants who were born prior to the start of the RSV 
    campaign and are aged 0-7 months at the start of the RSV campaign will 
    receive a dose of monoclonals. This administration takes place at an 
    accelerated pace during the first month of the campaign. Specifically, 
    babies born Apr 1 -Sep 30 receive a dose during Oct 1-31.
  - Note: Two monoclonals will be available for the 2025-26 season, including 
    nirsevimab and clorsevimab. The timing of administration and effectiveness of
    the two products is assumed to be the same. Teams have discretion to model 
    products separately or in combination. The provided immunization coverage 
    curves represent combined coverage for both products.


b. *Maternal RSV vaccine.* Maternal vaccines were recommended in fall 2023 for 
women who are 32 through 36 weeks pregnant during the RSV vaccine campaign. We 
assume that a fraction of eligible women will get one dose of maternal RSV 
vaccine throughout the RSV campaign. Babies will be protected at birth 
(approximately one month after mom’s vaccination) and throughout the RSV season. 
Specifically, a fraction of 32-36 wk pregnant women will receive vaccination 
during Sep 1 -Jan 31 based on weekly maternal vaccine coverage.


c. *No double immunization:* We assume that long-acting monoclonals are 
administered to babies whose mothers have not received the RSV vaccine. CDC 
recommendations are that parents choose one of the existing intervention 
strategies. In other words, the coverage of long-acting monoclonals and 
maternal vaccines should be considered additive (i.e. these modes of 
immunization target different babies).


##### Older Individuals

Older individual RSV vaccine recommendations were
[updated for the 2025-26 season](https://www.cdc.gov/rsv/vaccines/older-adults.html). 
Current recommendations stipulate that 1) **Individuals vaccinated during prior 
seasons should not be revaccinated** 2) All unvaccinated seniors 75+ 
yrs are recommended for vaccination, and 3) All unvaccinated high-risk 
individuals 50-74 are recommended for vaccination. 

We recommend that teams consider vaccination in eligible individuals 50+ yrs. 
Target data are available from RSV-NET for fine age groups, including 50-64, 
65-74 and 75+. The exact implementation of targeting eligible 50+ yrs is left 
at teams’ discretion.  **This year, to align with new recommendations, we will 
request one more age breakdown, so that we can make projections for the 50-64 
and 65+ separately from the non-intervened age groups 5-49.** Vaccine curves 
will be provided separately for high-risk individuals 50-74 and those 75+, for 
both 2023-24 and 2024-25 (reported vaccination) and 2025-26 (vaccination for 
the projection period). 

We assume that CDC revaccination guidelines are followed up closely, so 
that seniors vaccinated last year ***will not*** get revaccinated this year. 
**Hence the coverage from the past two seasons and this year should be 
considered as additive (i.e., targeting different individuals).**


Further, we also assume that high risk guidelines are followed closely. 
**Is it estimated that 50% of 60-74 yo have high-risk conditions that 
are eligible for RSV vaccines. Further, high-risk individuals aged 
60-74 yo have a 6.2-fold (95% CI, 4.0-9.5) risk of RSV hospitalization 
compared to their healthy age peers (CDC personal communication and 
[slide 104](https://www.cdc.gov/acip/downloads/slides-2024-06-26-28/11-RSV-Adult-Melgar-Roper-Britton-508.pdf)).**


##### Intervention effectiveness

This year, we have updated VE estimates for maternal vaccines in light of 
recent real-world observational data. VE estimates for nirsevimab and senior 
vaccines remain as in last year’s scenarios. **All VE estimates are against 
hospitalization.**

We assume that VE is **80%** for infant monoclonals and **75%** for maternal 
vaccines based on 
[recent CDC data](https://www.cdc.gov/acip/downloads/slides-2025-06-25-26/03-MacNeil-Mat-Peds-RSV-508.pdf). 
Waning immunity for these products is at teams discretion; 
we refer to a recent modeling paper by 
[Hodgson et al](https://pubmed.ncbi.nlm.nih.gov/38476752/) describing 
waning curves from RCT data  (see Fig SM3.6 SM3.9 in Supp).

For senior vaccines, the VE in the first year of vaccination is set at 
**75%**, which is an intermediate value between estimates from a recent 
[meta-analysis](https://www.cdc.gov/acip/downloads/slides-2025-04-15-16/04-Ortega-Sanchez-Adult-RSV-508.pdf) and 
[real-world data from the 2023-24 and 2024-25 seasons in the US](https://jamanetwork.com/journals/jama/article-abstract/2838490).
The VE in the second and third years is reduced due to waning, with the level 
of reduction depending on scenario. VE is reduced by 10% each year in optimistic 
scenarios A, C, with VE assumed to be  75% the first year, 75\*.9=68% in the 
second year and 75\*.9\*.9=61% in the third year. In pessimistic scenarios B 
and D, VE is halved each year, so that VE = 75% the first year,  75\*.5=38% in 
the second year and 75\*.5\*.5=19% in the third year.
The pessimistic assumption of 50% reduction by the second year is based on the 
lower bound of VE estimates from a RCT assessing VE in the second season after 
vaccine receipt, see [Ison at al.](https://pubmed.ncbi.nlm.nih.gov/38253338/) 
and an observational case-control study assessing VE as a function of time since
immunization, [Surie at al.](https://jamanetwork.com/journals/jama/fullarticle/2838490) 
(VE declined from 69% in 1st year to 48% in 2nd year, a 30% relative decline in 
VE). The waning distribution is left at team’s discretion provided that the 
average VE level remains at the prescribed level each year after vaccination. 
For models that consider an effect of the vaccine against infection, the waning 
of VE against infection is at teams discretion, provided that the resulting VE 
against hospitalization follows the prescribed decline.


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
guideline, monoclonals and maternal vaccines are only expected to provide 
sizable protection within the first 6 months after receipt, while senior 
protection is expected to persist for multiple years. Within this timeframe, 
there can be waning of VE. We will explore waning uncertainty via our scenarios 
for seniors. Teams have discretion to explore waning for infant products.


##### Other RSV-specific interventions

Consideration of non-specific RSV interventions such as a low level of 
residual masking is allowed.


##### Counterfactual scenario (scenario E)

In this scenario, we consider no change to the historic policy of RSV 
mitigation, namely no senior vaccination (none in 2023-24, 2024-25, or 2025-26) 
and a limited coverage of palivizumab monoclonals to high-risk premature infants 
(~2% of the US birth cohort receives a partial or full dose,
[Ambrose et al](https://www.tandfonline.com/doi/full/10.4161/hv.32082)). The 
calibration data available from 2017-2023 takes into account the impact of 
palivizumab. Teams have discretion to consider this policy explicitly or ignore 
it given the small fraction of infants covered. We note that high risk premature 
infants <6mo who previously would have received palivizumab (the older 
treatment) will now receive the new long-acting monoclonals, with comparable 
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

The data has been standardized and posted on the [SMH RSV github](https://github.com/midas-network/rsv-scenario-modeling-hub/tree/main/target-data/) 
and is updated weekly. **The target in this data is the weekly number of 
hospitalizations in each given state (`inc_hosp` variable), for all ages and by 
age group.** To obtain counts, we have converted RSV-NET weekly rates based on 
state population sizes. This method assumes that RSV-NET hospitals are 
representative of the whole state. To obtain national US counts, we have used 
the rates provided for the “overall RSV-NET network”. The data covers 
2017-present. Reported age groups include: [0-6 months], [6-12 months], 
[1-2 yr], [2-4 yr], [5-17 yr], [18-49 yr], [50-64 yr], and [65-74] and 
75+ years. The standardized dataset provided by SMH includes week- state- and 
age-specific RSV counts (the target), rates, and population sizes. 

The source of age distribution used for calibration (RSV-NET vs other estimates) 
should be provided in the abstract meta-data that is submitted with the 
projections.


#### Other RSV datasets available for calibration

A few auxiliary datasets, updated weekly (except POPHIVE), are available in the
[auxiliary-data/rsv folder](https://github.com/midas-network/rsv-scenario-modeling-hub/tree/main/auxiliary-data/rsv) including: 

- National and region-specific CDC surveillance from 
  [NREVSS](https://github.com/midas-network/rsv-scenario-modeling-hub/tree/main/auxiliary-data/rsv#the-national-respiratory-and-enteric-virus-surveillance-system-nrevss)
- State-specific and national ED data with demographic information 
  (national only) 
- Data on trends in RSV testing is available from 
  [POPHIVE](https://github.com/midas-network/rsv-scenario-modeling-hub/tree/main/auxiliary-data/rsv#pophive).


Given that the risk of RSV hospitalization changes substantially throughout the 
first year of life, and that timing of interventions differs for catch-up babies 
(who are older and less at risk) vs newborns (who are at highest risk), we 
recommend that teams consider the risk profile of infants by month (or 2-month) 
of age. Detailed hospitalization risk estimates are available
[here, Curns et al.](https://publications.aap.org/pediatrics/article/153/3/e2023062574/196566/Respiratory-Syncytial-Virus-Associated?autologincheck=redirected). 


### Targets

In this round, we will **require submission of 300-600 individual trajectories 
for each target** while submission of **quantiles is optional**. Targets will 
be based on the RSV-NET dataset. The required targets for trajectories **will 
be weekly RSV incident hospital admissions. We request hospitalization counts 
for the 12 RSV-NET states and nationally, for all ages, and for a set of minimal 
age groups.** A more resolved set of age groups is strongly encouraged (see 
below). Estimates of cumulative counts can be obtained from weekly trajectories 
and hence we do not require trajectories for cumulative counts. Similarly, peak 
targets (peak hospital admission magnitude and peak timing) can be reconstructed 
from weekly trajectories. Teams who wish to submit quantiles along with 
trajectories should provide quantiles for weekly and cumulative counts, as well 
as for hospital admission peak size and peak timing.

#### Weekly targets

- Weekly *reported* all-age and age-specific state-level incident hospital 
  admissions, based on RSV-NET. This dataset is updated daily and covers 
  2017-2025. There should be no adjustment for reporting (=raw data from 
  RSV-NET dataset to be projected). A current and standardized version of 
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
  of projections, on July 27, 2025
- Cumulative and Incident infection. Cumulative outcomes start at 0 at the start 
  of projections, on July 27, 2025
- State-level peak hospital admissions
- State-level timing of peak hospital admission

### Timeline

- **Scenarios set (no changes after)**: *Friday, Oct 31, 2025*
- **Projections due**: *Tuesday, Nov 11, 2025*
- **Report finalized**: *End of November 2025*

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

- **Sun July 27, 2025 to Sat June 6, 2026 (45 weeks)**
  - NO CALIBRATION TO DATA after July 27,2025

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
| Scenario A. Optimistic senior waning and high coverage of infant interventions      | optSenWan_highInfCov  | A-2025-10-31 |
| Scenario B. Pessimistic senior waning and high coverage of infant interventions     | pessSenWan_highInfCov | B-2025-10-31 |
| Scenario C. Optimistic senior waning and moderate coverage of infant interventions  | optSenWan_modInfCov   | C-2025-10-31 |
| Scenario D. Pessimistic senior waning and moderate coverage of infant interventions | pessSenWan_modInfCov  | D-2025-10-31 | 
| Scenario E. Counterfactual                                                          | counterfactual        | E-2025-10-31 |

*   **Projection Due date**: Tuesday, Nov 11, 2025
*   **End date for fitting data**: Saturday July 26, 2025
*   **Start date for scenarios**: Sunday July 27, 2025 (first date of simulated transmission/outcomes)
*   **Simulation end date:** Saturday June 6, 2026 (45-week horizon)

*   Desire to release results by end November 2025

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
  that WA joined RSV-NET in 2024-25 as a 13th participating state. 
  **Projections for WA are optional.**

- Results: 
  - Summary: Results must consist of a subset of weekly targets listed
    below; all are not required. 
  - Weeks follow epi-weeks (Sun-Sat) dated by the last day of the week. 
  - **Weekly Targets**: 
    - Weekly incident hospitalizations by location, all ages and 
    age-specific
    - Weekly incident infection by location, all ages and age-specific
    (optional)

- Metadata: We will require a brief meta-data form, from all teams.

- Uncertainty: 
  - For trajectories (required submission): we require 300 to 600 
    trajectories, paired.
  - For quantiles (optional submission) We ask for 0.01, 0.025, 0.05,
    every 5% to 0.95, 0.975, and 0.99. 

