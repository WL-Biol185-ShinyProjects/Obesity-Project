View(obesityData)
library(tidyverse)
library(dplyr)

#filtering for specific question
obesityGeneral <- filter(obesityData, Question == "Percent of adults aged 18 years and older who have obesity")

#filtering for 2017 and 2018
obesityGeneralYear <- filter(obesityGeneral, YearStart == c("2018", "2017"))

#filter table for 5 columns that we want
obesityHeat <- obesityGeneralYear %>%
  select(1, 3, 8, 11, 17)
 
#renamed columns
colnames (obesityHeat) [1]  <- "year"
colnames (obesityHeat) [2]  <- "state"
colnames (obesityHeat) [3]  <-  "question" 
colnames (obesityHeat) [4]  <- "percent" 
colnames (obesityHeat) [5]  <- "sampleSize"

obesityHeatPercent <- obesityHeat %>% #taking of N/A from percent column 
  filter(percent != "N/A")

obesityHeatPercent$state <- as.factor(obesityHeatPercent$state)

summary(obesityHeatPercent)
