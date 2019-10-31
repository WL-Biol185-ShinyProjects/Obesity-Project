#data manipulation for education
View(obesityData)
library(tidyverse)
library(dplyr)

#tidy table
obesityEducation <- obesityData                                                   %>%
  select(1,3,8,11,17,20)                                                          %>%
  filter(Education               != "N/A",
         YearStart               == "2018",
         Question                == 
                    "Percent of adults aged 18 years and older who have obesity")

colnames(obesityEducation) [1] <- "year"
colnames(obesityEducation) [2] <- "location"
colnames(obesityEducation) [3] <- "question"
colnames(obesityEducation) [4] <- "percent"
colnames(obesityEducation) [5] <- "sampleSize"
colnames(obesityEducation) [6] <- "educationLevel"

#calculations
obesityEducationData <- obesityEducation     %>%
  as_tibble()                                %>% 
  mutate(
  numberObese = sampleSize*(percent/100))

obesityEducationData$location <- as.factor(obesityEducationData$location)
obesityEducationData$year <- as.factor(obesityEducationData$year)
obesityEducationData$educationLevel <- as.factor(obesityEducationData$educationLevel)

View(obesityEducationData)
