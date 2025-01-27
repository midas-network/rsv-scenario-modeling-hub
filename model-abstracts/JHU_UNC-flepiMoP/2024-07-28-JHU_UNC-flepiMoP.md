## Summary of Results
Projection results show a moderate reduction in burden averted due to vaccination, as expected. Timing of infant vaccination products only has an obvious effect in states where the seasons are typically early (e.g. Georgia).

## General Model Description
We build a mechanistic model of RSV transmission that captures state-specific seasonality, age-specific patterns of disease burden, impacts of COVID-19 on transmission, and models mechanisms and efficacy of therapeutics in a compartmental structure. Individuals are tracked based on current infection status, number of prior infections, immune state (e.g. protected by maternal immunity, vaccinated, or unprotected) and their current age. Broadly the model is an SIRS model structure with levels of prior infection. 

## Explanation of observed dynamics given model assumptions 
Protection from vaccination reduces hospitalisation burden of RSV, with the most optimistic scenario (early timing of infant products and high VE of senior vaccine) reducing the most burden. 

## Model Calibration

### General calibration approach
Calibration to historical hospitalization data and full RSVnet data set from 2015/16, simulating from 1980 - present. A burn in period allows the population oscillations to stabilise prior to the presence of data for fitting. We fit each age group, and fit each state separately. State-specific parameters fit include baseline reproduction number, COVID and Omicron-period reductions to transmission due to lockdowns, seasonal amplitude and offset, reported infection to hospitalisation ratios (IRHR) for each age group (<1 year, 1-4, 5-17, 18-49, 50-64 and 65+), and an age-specific (child 0-17 and adult >18) multiplicative increase in reporting in the post-COVID era (August 31 2022 - September 2025). 

### Was the model calibrated to 2023-24 data, and if so how? And how was the counterfactual scenario generated?
The model was calibrated to 2023-24 data but we omitted the infant age group from this due to incomplete vaccination data - ie only fit to 2023-24 data for ages >1. We rerun the counterfactual scenario with no vaccination in any age group. 

## Model Assumptions

### **Immunity assumptions** (describe protection against infection and severe disease, duration of immunity and waning distributions)

#### Immunity after natural infection
Three levels of prior immunity are modelled, such that natural infection confers some protection from infection. Those with 0 prior infections are fully susceptible to infection, those with 1 prior infection are 25% less susceptible, and those with 2 or more prior infections are 50% less susceptible relative to those with no prior infections. We include a recovered compartment following infection, with a waning rate of 1/90, or approximately a duration of protection of 3 months. 

#### Maternal immunity
We model vertival transmission of maternal antibodies from mother to child as a period wherein all babies born are fully protected from infection, with a waning rate of 1/60, or approximately an average duration of protection of 2 months. 

#### Immunity from maternal vaccines
We assume maternal antibodies transferred after maternal vaccination confer protection in the same way as maternally transferred antibodies from above - i.e., complete but temporary reduction in susceptibility to infection. In our parameterisation we assume all infants have 100% protection from infection right after birth as a result of maternal protection, we thus assume the measured vaccine efficacy for maternal vaccination are relative to this universal baseline protection. In addition, although VE values are reported as efficacies at preventing hospitalization, we assume the mechanism of this protection is completely due to a reduction in susceptibility to infection (as opposed to allowing infection but then reducing probability of hospitalization given infection), and that imperfect efficacy is completely due to waning (as opposed to leaky protection or failure of vaccine to take in some individuals). Thus, to parameterize the model, we translate desired VE values for nirsevimab and maternal vaccination into waning rates by assuming VE is measured at a fixed time after birth (and that vaccination is concurrent with birth). 

#### Immunity from nirsevimab
Protection due to Nirsevimab acts in the same way as maternal vaccines above, though these individuals can be vaccinated at any time (catch up doses), not just at birth. 

#### Immunity from senior vaccines
We assumed that the observed vaccine efficacy for prevention of RSV-associated hospitalizations in older adults was entirely due to a reduction in the probability of hospitalization among infected individuals, and not due to any reduction in susceptibility to infection. Thus, vaccinated individuals have a probability of progressing to severe disease multiplied by (1-VE).  

### **Seasonality implementation**
We model seasonality with a sinusoidal curve, and fit state-specific terms for seasonal amplitude and seasonal offset (timing).

### **Initial Conditions**
We run the model with a 30 year burn-in period from 1950-2023 to allow oscillations to stabilise. 

### **Age groups considered** (especially within under 1 yo, and whether within season aging is considered)
0-2m, 3-5m, 6-11m, 1-2, 3-4, 5-17, 18-49, 50-64, >65. Aging is a continuous process so within-season aging is considered. 

### **Geography**

#### State-stratification details (prior immunity, seasonality, severity/reporting)
All parameters are state-stratified and fit separately. These include seasonality, severity and reporting. 

#### Process to generate national projections (separate model fitted to US data vs aggregation of projection from RSVnet states)
State-specific fits and national projections are obtained by aggregating projection from RSVnet states and upscaling to age-specific US population. 

### **Other Model Assumptions**
