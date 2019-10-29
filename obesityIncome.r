#data manipulation for income
View(obesityData)
library(tidyverse)
library(dplyr)

obesityIncome2018 <- obesityGeneral2018 %>% select(YearStart, LocationAbbr, Question, Data_Value, Sample_Size, Income)
