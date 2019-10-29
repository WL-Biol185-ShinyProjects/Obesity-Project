View(obesityData)
library(tidyverse)
library(dplyr)

obesityGeneral <- filter(obesityData, Question == "Percent of adults aged 18 years and older who have obesity")
