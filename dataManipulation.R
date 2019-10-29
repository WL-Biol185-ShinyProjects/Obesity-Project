View(obesityData)
library(tidyverse)
library(dplyr)

obesityGeneral <- filter(obesityData, Question == "Percent of adults age 18 years and older who have obesity")
