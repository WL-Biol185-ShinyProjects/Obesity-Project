library(tidyverse)
library(dplyr)

#data manipulation for income

obesityGeneral      <- filter(obesityData, Question == "Percent of adults aged 18 years and older who have obesity")

obesityGeneral2018  <- filter(obesityGeneral, YearStart == "2018")

obesityIncome2018   <- obesityGeneral2018 %>% select(YearStart, LocationAbbr, Question, Data_Value, Sample_Size, Income)


#removing all data that have NA as value for Income

obesityIncome <- obesityIncome2018 %>% 
  filter(Income != "N/A")

#changing variable names

colnames(obesityIncome) [1] <- "year"
colnames(obesityIncome) [2] <- "location"
colnames(obesityIncome) [3] <- "question"
colnames(obesityIncome) [4] <- "percent"
colnames(obesityIncome) [5] <- "sampleSize"
colnames(obesityIncome) [6] <- "incomeLevel"

#calculations

obesityIncomeData <- obesityIncome     %>%
  as_tibble()                          %>% 
  mutate(
    numberObese = sampleSize*(percent/100))

#converting variables into factors

obesityIncomeData$location         <- as.factor(obesityIncomeTotals$location)
obesityIncomeData$year             <- as.factor(obesityIncomeTotals$year)
obesityIncomeData$incomeLevel      <- as.factor(obesityIncomeTotals$incomeLevel)

#calculations

obesityIncomeTotals <- obesityIncomeData                       %>%
  as_tibble()                                                  %>% 
  mutate(
    obesePercent = (numberObese/sampleSize)*100)

write.csv(obesityIncomeTotals.csv)
