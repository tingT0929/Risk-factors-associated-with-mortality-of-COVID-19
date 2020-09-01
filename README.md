# Risk-factors-associated-with-mortality-of-COVID-19
Risk factors associated with mortality of COVID-19 in 2692 counties of the United States
## 1. Data 
### 1) Abstract
Our data source consists of cumulative confirmed cases and deaths from March 1 to April 15 which were collected from New York Times. The contributing factors related to adverse health were compiled from the County Health Rankings and Roadmaps program official website. These data were available in their offical websites. This enabled us to figure out the important adverse health factors associated to COVID-19 in the United States.

### 2) Availability
The data to reproduce our results are available

### 3) Description
The data incorporte 3 `.rda` iles.
- The cumulative confirmed cases between March 1 to April 15 were collected from the New York Times ("`cum_confirm.Rda`")
- The time-series cluster results for 2692 infected counties in the United States ("`cluster_data.Rda`")
- The adverse health factors, cluster results, and the deaths on April 15 were complied into a single Rda file ("`FIPScumdead.Rda`") 

### 4) Permissions
The data were orignially collected by the authors

----
## 2. Code
### 1) Abstract
The codes incorported all the scripts to reproduce the analysis in the paper. 

### 2) Reporducibility
- The different classes of counties were obtained by runing "`Clustering.R`"
- The singificant contributing factors related to increaning the mortiliay of COVID-19 were identified in different classes of counties by runing "`Varlm.R`"


----
## 3. Paper

- https://www.medrxiv.org/content/10.1101/2020.05.18.20105544v3