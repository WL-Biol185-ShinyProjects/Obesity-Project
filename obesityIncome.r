obesityIncomeTab <- tabItem 

#data manipulation for income

obesityIncome2018 <- select(obesityGeneral2018)

View(obesityData)
library(tidyverse)
library(dplyr)

obesityIncome2018 <- obesityGeneral2018 %>% select(YearStart, LocationAbbr, Question, Data_Value, Sample_Size, Income)


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
<<<<<<< HEAD
obesityIncomeData <- obesityIncomeData       %>%
=======
obesityIncome <- obesityIncomeData %>%
>>>>>>> 425c1b41acd8d4e521e08c4a29a0a2bf15ec1db3
  as_tibble()                                %>% 
  mutate(
    numberObese = sampleSize*(percent/100))

#turning states into factors

obesityIncomeData$state <- as.factor(obesityIncomeData$state)

summary(obesityIncomeData)
