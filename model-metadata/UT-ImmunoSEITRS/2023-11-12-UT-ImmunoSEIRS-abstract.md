# Summary of Results
The results show the development of a RSV wave whose timing and magnitude is different depending on the location. In all projections, assumptions considered in scenario E (no interventions) caused to the highest level of hospitalizations. Scenario D (pessimistic infant and senior protection) was the one that caused most hospitalizations after E in all 12 states and the country. This suggests that the higher vaccination coverage with higher vaccine effectivess, does drive the vaccine based immunity and has a significant impact.  

# General Model Description
We develop a single virus compartmental model that explicitly tracks the immunity caused by natural infections and vaccination and its impact on the average chances of infection, hospitalization and death. The model is stratified according to seven age groups and considers that the hospitalization and mortality rate depends on each group susceptibility to severe disease with RSV. For each type of immune exposure (i.e., infection with RSV or receipt of vaccine or monoclonal antibodies), the model uses two state variables to track the resulting population-level average protection against infection and severe disease. These variables increase as individuals recover from infections or receive vaccines and monoclonal antibodies and then decrease according to waning (half-life) parameters specific to each exposure type. Immunity state variables modify overall rates of infection and risk of hospitalization/death with efficacies that can vary depending on the circulating virus and the age group of the exposed individual. The model was first fit to RSV hospitalization data from the 2022-2023 season to estimate the level of infection-acquired immunity at the end of the season. The model is validated for the historical season as well. The fitting period begins from August 2023 and the projections for each scenario are provided from the required date November 12, 2023. 

# Explanation of observed dynamics given model assumptions
The results do explain that under the no intervention scenario which is th baseline counter factual scenario, wherein no vaccination and monoclonal antibodies are considered, there are higher hospitalizations. In our model, in addition to protection offered by vaccination and monoclonal antibodies, there is higher baseline protection that previous infections offers which does have an impact on projections. In addition, immunity provided by vaccines wanes significantly faster than immunity gained through natural infections.

# Model calibration
We calibrated the model manually by ensuring that the peak number and timing of US and the 12 states hospitalizations is similar to the 2019-2020 season.

# Model Assumptions
## Immunity assumptions
### Number/type of immune classes considered
The model tracks the population-immunity levels in a continuous way. We consider three state variables corresponding to immunity gained from infection with RSV, vaccination and monoclonal antibodies. 

### Initial proportion of population with residual immunity from previous infections and previous seasonal vaccinations (by age, if available)
First, we consider that 33% have prior immunity from previous infections in the 2022-23 season. The immunity hence obtained at the end of this season is considered as the initial starting immunity for the 2023-24 season. The vaccines based protection based on vaccine effectiveness defined for pessimistic and optimistic scenarios are 40% and 60 % respectively. For the baseline scenario, vaccine acquired effectiveness is considered as 50%. The initial vaccine based immunity is zero and the immunity acquired due to monoclonal antibodies pertains to infants aged below 1 year, which is obtained through the 2022-23 season fit. All these are age specific immunity derived through natural infection, vaccination and monoclonal antibodies. 


### Waning immunity throughout the season (yes, no, differs for vaccination and natural infection)
We consider the immune waning against infection due to monoclonal therapy is 6 months and 24 months due to vaccination. We consider that the half-life time of immune waning is 2-9 months considering fast and slow waning due to immediate and older infections.

## Details on RSV Strain(s)
### Number of strains/subtypes included in model
No different RSV strains are considered in the model.

### Are interactions between strains/subtypes implicitly modeled?
N/A.

## Seasonality implementation
We incorporate humidity-based seasonality in our RSV model. We estimate the average absolute humidity (Grams of Water Vapor/CubicMeter (g/m-3)) across the 200 most populated core-based statistical areas (CBSA) and fit a cosine function to the resulting annual time series. We incorporate a seasonality parameter into the model. The magnitude of the seasonality impact on transmissibility and both infection rate and seasonality magnitude are fitted simultaneously.


## Initial Conditions
### Details on circulating strains at the start of the projection period
N/A

## Non-pharmaceutical interventions (NPIs)
We don't consider any NPIs.

## Age Group Variability
### No of age groups
Seven

### Age-stratification differences (susceptibility, vaccine effectiveness, waning)
We consider that age groups determine the chances of developing severe disease against infection. They also determine initial levels of immunity from infection, monoclonal antibodies and vaccination

## State-level Variability
### State-stratification details (prior immunity, vaccine coverage)
We do not consider any specific changes for each state. However, we did tune seasonality magnitude parameter for Utah. 

## Vaccine Effectiveness and Monoclonal Antibodies Effectiveness 
### VE against infection (by age, if relevant)
70% across all scenarios

### ME against infection (by age, if relevant)
71.5% across all scenarios

### VE against hospitalization(by age, if relevant)
70% in pessimistic scenario, 90% in optimistic scenario and 50% in baseline scenario

### ME against hospitalization(by age, if relevant)
60% in pessimistic scenario,  80% in optimistic scenario and 50% in baseline scenario

### VE against transmission (by age, if relevant)
N/A

### ME against transmission (by age, if relevant)
N/A


