obesityHeatTab <- list(
  
  titlePanel("Obesity in the United States"   ),
  
  fluidRow(box(width = 12, background = "black", p("This is a map of the United States detailing obesity in 2018"))),
  
  fluidRow(leafletOutput("myHeatMap")),
  
  fluidRow(box(width = 12, background = "black", p("The plot below shows an overview of obesity in the United States from 2009-2018"))),
  
  sidebarPanel(
  checkboxGroupInput("yearInput", "Choose the Year:",
      choices = list(
        "2011"  = "2011",
        "2012"  = "2012",
        "2013"  = "2013",
        "2014"  = "2014",
        "2015"  = "2015",
        "2016"  = "2016",
        "2017"  = "2017",
        "2018"  = "2018")
    ),
    textOutput("checkYear"),
    
    selectInput(inputId = "state",
                label = "Choose States:",
                choices = list(
                  "AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", "GA",
                  "GU", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD",
                  "ME", "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE", "NH", "NJ",
                  "NM", "NV", "NY", "OH", "OK", "OR", "PA", "PR", "RI", "SC", "SD",
                  "TN", "TX", "US", "UT", "VA", "VI", "VT", "WA", "WI", "WV", "WY"
                ),
                selectize = TRUE,
                multiple  = TRUE
                
    ),
    textOutput("stateResult2"),
    mainPanel(plotOutput("myLineGraph"), width = "100%")
    )
    )

          




#data cleaning code for this this tab


library(tidyverse)
library(dplyr)

#filtering for specific question
obesityGeneral <- filter(obesityData, Question == "Percent of adults aged 18 years and older who have obesity")

#filtering for 2017 and 2018
obesityGeneralYear <- filter(obesityGeneral, YearStart == c("2018", "2017"))

#filter table for 5 columns that we want
obesityHeat <- obesityGeneralYear %>%
  select(1, 3, 8, 11, 17)
 
#renamed columns
colnames (obesityHeat) [1]  <- "year"
colnames (obesityHeat) [2]  <- "state"
colnames (obesityHeat) [3]  <- "question" 
colnames (obesityHeat) [4]  <- "percent" 
colnames (obesityHeat) [5]  <- "sampleSize"

obesityHeatPercent <- obesityHeat %>% #taking of N/A from percent column 
  filter(percent != "N/A")

obesityHeatPercent$state <- as.factor(obesityHeatPercent$state) #made state a factor
obesityHeatPercent$year <- as.factor(obesityHeatPercent$year)








