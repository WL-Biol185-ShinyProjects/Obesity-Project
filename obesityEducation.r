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

colnames(obesityEducationData) <- tolower(colnames(obesityEducationData))

