#data manipulation for income
<<<<<<< HEAD

obesityIncome2018 <- select(obesityGeneral2018)
=======
View(obesityData)
library(tidyverse)
library(dplyr)

obesityIncome2018 <- obesityGeneral2018 %>% select(YearStart, LocationAbbr, Question, Data_Value, Sample_Size, Income)
>>>>>>> 7f50bc10d06cb8b99d8d44627b467d2e3c5354fa
