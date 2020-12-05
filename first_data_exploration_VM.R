library(tidyverse)
library(here)

health_survey <- read_csv("~/group_project/raw_data/scottish_health_survey_general.csv")
alcohol_hospitals <- read_csv("~/group_project/raw_data/alcohol_related_hospital_stats.csv")

# General data
dim(health_survey)
names(health_survey)
head(health_survey)
#FeatureCode is one and it is Scotland code
unique(health_survey$FeatureCode)

#DataCode is years - will we use the last 5 years
unique(health_survey$DateCode)

#Measurement - CI level, mean, percent
unique(health_survey$Measurement)

#Units - percent, prop of fruit and vegetables? units of alcohol; 
#WEMWBS score - Scores range from 14 to 70 and higher scores 
#indicate greater positive mental wellbeing. 
unique(health_survey$Units)

#Shows mean for every year and gender and all
mean <- health_survey %>% 
  filter(Measurement == "Mean")

#Shows percent of something by gender or all among all number of people in that 
#health board?
percent <- health_survey %>% 
  filter(Measurement == "Percent")

# Specific data
names(alcohol_hospitals)

#FC, DC are the same as before
#but FC has more health board codes
unique(alcohol_hospitals$`Alcohol Condition`)

#Units, measurement and alcohol related are some the same
unique(alcohol_hospitals$Units)

#Lots of alcohol condition - should we concentrate at one?

#"Stays"                     "New Patients"             
#"Patients"                  "Average Stays Per Patient"
unique(alcohol_hospitals$`Alcohol Related Hospital Activity`)

unique(alcohol_hospitals$`Type Of Hospital`)
#There are 3 types - all, general, psychiatric

stays_per_patient <- alcohol_hospitals %>% 
  filter(Units == "Stays Per Patient")
#Shows how many days stayed one patient

patients <- alcohol_hospitals %>% 
  filter(Units == "New Patients" | Units == "Patients")
#New patients per the year?