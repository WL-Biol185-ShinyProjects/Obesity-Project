obesityIncome <- list(
  
  titlePanel("Obesity and Income in the United States"),
  fluidRow(plotOutput("myIncomeGraph"))
)

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

obesityIncomeTotals <- obesityIncomeData                       %>%
  as_tibble()                                                  %>% 
  mutate(
    obesePercent = (numberObese/sampleSize)*100)

#converting variables into factors

obesityIncomeData$location <- as.factor(obesityIncomeData$location)
obesityIncomeData$year <- as.factor(obesityIncomeData$year)
obesityIncomeData$educationLevel <- as.factor(obesityIncomeData$incomeLevel)


#server stuff
  
output$barPlotEdu <- renderPlot({
  incomes <- c("$15,000-$24,999",
               "$25,000-$34,999",
               "$35,000-$49,999",
               "$50,000-$74,999",
               "$75,000 or greater"
               )
  selectedIncome 
  
  
