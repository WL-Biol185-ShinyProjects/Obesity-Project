
View(obesityData)


#data manipulation for income

obesityIncome2018 <- select(obesityGeneral2018)


library(tidyverse)
library(dplyr)
library(shiny)

#data manipulation for income

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
obesityIncomeData <- obesityIncome     %>%
  as_tibble()                          %>% 
  mutate(
    numberObese = sampleSize*(percent/100))


obesityIncomeData <- obesityIncome           %>%
  as_tibble()                                %>% 
  mutate(
    numberObese = sampleSize*(percent/100))


#converting variables into factors


obesityIncomeData$location <- as.factor(obesityIncomeData$location)
obesityIncomeData$year <- as.factor(obesityIncomeData$year)
obesityIncomeData$incomeLevel <- as.factor(obesityIncomeData$incomeLevel)

#calculations

obesityIncomeTotals <- obesityIncomeData                       %>%
  as_tibble()                                                  %>% 
  mutate(
    obesePercent = (numberObese/sampleSize)*100)

obesityIncomeTotals$location       <- as.factor(obesityIncomeTotals$location)
obesityIncomeTotals$year           <- as.factor(obesityIncomeTotals$year)
obesityIncomeTotals$educationLevel <- as.factor(obesityIncomeTotals$incomeLevel)


#ui stuff

obesityIncome <- list(
<<<<<<< HEAD

=======
  
>>>>>>> 406ff5bb9633ef7cf7736b2dae1e90af97241912
  titlePanel("Income & Obesity in the United States"),
  
  sidebarLayout(
    sidebarPanel(
      checkboxInput(
<<<<<<< HEAD
        inputId = "$15,000-$24,999",
=======
       inputId = "$15,000-$24,999",
>>>>>>> 406ff5bb9633ef7cf7736b2dae1e90af97241912
        label = "$15,000-$24,999",
        value = TRUE
      ),
      checkboxInput(
        inputId = "$25,000-$34,999",
        label = "$25,000-$34,999",
        value = TRUE
      ),    
      checkboxInput(
        inputId = "$35,000-$49,999",
        label = "$35,000-$49,999",
        value = TRUE
      ),     
      checkboxInput(
        inputId = "$50,000-$74,999",
<<<<<<< HEAD
        label = "$50,000-$74,999",
=======
       label = "$50,000-$74,999",
>>>>>>> 406ff5bb9633ef7cf7736b2dae1e90af97241912
        value = TRUE
      ),
      checkboxInput(
        inputId = "$75,000 or greater",
        label = "$75,000 or greater",
        value = TRUE
      ),
      
<<<<<<< HEAD
       selectizeInput(
=======
      selectizeInput(
>>>>>>> 406ff5bb9633ef7cf7736b2dae1e90af97241912
        inputId = "includeLocation",
        label = "States",
        choices = unique(obesityIncomeTotals$location),
        multiple = TRUE,
        selected = unique(obesityIncomeTotals$VA)
      ),
      
<<<<<<< HEAD

      mainPanel(
        plotOutput("myIncomeGraph"))
    )
  ),

      fluidRow(plotOutput("myIncomeGraph"))
  
)
=======
      mainPanel(
        plotOutput("myIncomeGraph")
      
    
    )
  )
)
)





>>>>>>> 406ff5bb9633ef7cf7736b2dae1e90af97241912
