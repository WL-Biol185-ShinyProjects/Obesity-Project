View(obesityData)
library(tidyverse)
library(dplyr)

obesityData %>%
  filter(Question == "Percent of adults age 18 years and older who have obesity")
