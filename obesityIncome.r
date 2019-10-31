#data manipulation for income

obesityIncome2018 <- select(obesityGeneral2018)

View(obesityData)
library(tidyverse)
library(dplyr)

obesityIncome2018 <- obesityGeneral2018 %>% select(YearStart, LocationAbbr, Question, Data_Value, Sample_Size, Income)


#removing all data that have NA as value for Income

obesityIncomeData <- obesityIncome2018 %>% 
  filter(Income != "N/A")

#changing variable names

colnames(obesityIncomeData) [1] <- "year"
colnames(obesityIncomeData) [2] <- "location"
colnames(obesityIncomeData) [3] <- "question"
colnames(obesityIncomeData) [4] <- "percent"
colnames(obesityIncomeData) [5] <- "sampleSize"
colnames(obesityIncomeData) [6] <- "incomeLevel"

#calculations
obesityIncomeData <- obesityIncomeData       %>%
  as_tibble()                                %>% 
  mutate(
    numberObese = sampleSize*(percent/100))

