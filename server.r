library(shiny)
library(ggplot2)
library(tidyverse)

#source each individual R script for each tab 

source("obesityHeatMap.r")
source("obesityEducation.r")
source("obesityIncome.r")

function(input, output, session) {
  
  output$myHeatMap <- renderPlot({
    ggplot(obeseTotal, aes(yearNum, percentObese, color=state)) + geom_line()
  })
  
  output$barPlotEdu <- renderPlot({
    
    eduLevel <- c("College Graduate"                 ,
                  "High School Graduate"             ,
                  "Less Than High School"            ,
                  "Some College or Technical School"
    )
    selectedEducation <- eduLevel[c(input$col, input$hs, input$lessHs, input$someCol)]
    
    obesityEducationTotals                 %>%
      filter(
        eduLevel %in% selectedEducation
      )                                   %>%
      ggplot(aes(location, obesePercent, fill = educationLevel)) +
      geom_col(position = "dodge", alpha = 0.5)                  +
      xlab("State")                                              +
      ylab("% Obese")
  })
  
  
  #add Katherine's work here
  
 
    
}