obesityIncomeTab <- list(
  
  fluidPage(
    
    titlePanel("Income & Obesity in the United States"),
    
    sidebarLayout(
      
      sidebarPanel(
        
        checkboxGroupInput(
          "incomeLevel", "Choose Income Level:",
          choices = list(
            "Less than $15,000"   = "Less than $15,000",
            "$15,000 - $24,999"   = "$15,000 - $24,999",
            "$25,000 - $34,999"   = "$25,000 - $34,999",
            "$35,000 - $49,999"   = "$35,000 - $49,999",
            "$50,000 - $74,999"   = "$50,000 - $74,999",
            "$75,000 or greater"  = "$75,000 or greater"
          ),
        ),
        textOutput("checkIncome"),
        
        selectInput(inputId = "location",
                    label = "Choose States:",
                    choices = list(
                      "AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", "GA",
                      "GU", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD",
                      "ME", "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE", "NH", "NJ",
                      "NM", "NV", "NY", "OH", "OK", "OR", "PA", "PR", "RI", "SC", "SD",
                      "TN", "TX", "US", "UT", "VA", "VI", "VT", "WA", "WI", "WV", "WY"
                    ),
                    selectize = TRUE,
                    multiple = TRUE,
                    selected = c("VA", "WA")
                    
        ), 
        
        textOutput("stateResult3")
        
      ),
      
      mainPanel(plotOutput("myIncomeGraph"), width = "100%")
      
    )
  )
)

library(tidyverse)
library(dplyr)

View(obesityData)

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


