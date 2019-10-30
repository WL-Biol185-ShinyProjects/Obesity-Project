#data manipulation for education
View(obesityData)
library(tidyverse)
library(dplyr)

#tidy table
obesityEducationData <- obesityData                                               %>%
  select(1,3,8,11,17,20)                                                          %>%
  filter(Education               != "N/A",
         YearStart               == "2018",
         Question                == 
                    "Percent of adults aged 18 years and older who have obesity")

colnames(obesityEducationData) [1] <- "year"
colnames(obesityEducationData) [2] <- "location"
colnames(obesityEducationData) [3] <- "question"
colnames(obesityEducationData) [4] <- "percent"
colnames(obesityEducationData) [5] <- "sampleSize"
colnames(obesityEducationData) [6] <- "educationLevel"

#calculations
obesityEducationData <- obesityEducationData %>%
  as_tibble()                                %>% 
  mutate(
  numberObese = sampleSize*(percent/100))

