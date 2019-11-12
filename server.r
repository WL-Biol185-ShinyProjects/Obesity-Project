library(shiny)
library(ggplot2)
library(tidyverse)

#source each individual R script for each tab 

source("obesityHeatMap.r")
source("obesityEducation.r")
#source("obesityIncome.r")

function(input, output, session) {
  
  output$myHeatMap <- renderPlot({
    
    ggplot(obeseTotal, aes(input$yearNum, percentObese, color=input$state)) + geom_line()
    
  })
  
 
  output$stateResult <- renderText({
    
    paste(input$location, collapse = ", ")
    
  })
  
  output$checkEdu <- renderText({
    
    educationInput <- paste(input$educationInput, collapse = ", ")
    paste(educationInput)
    
  })
  
  output$barPlotEdu <- renderPlot({
    
    
    obesityEducationTotals                 %>%
      filter(
        educationLevel %in% input$educationInput,
        location       %in% input$location)                                    %>%
      ggplot(aes(location, obesePercent, fill = educationLevel)) +
      geom_col(position = "dodge", alpha = 0.5)                  +
      xlab("State")                                              +
      ylab("% Obese")
    
  })
 
  
  
  output$obesityIncome <- renderPlot({
    
    incomeLevel <- c("$15,000-$24,999",
                     "$25,000-$34,999",
                     "$35,000-$49,999",
                     "$50,000-$74,999",
                     "$75,000 or greater"
                     )
    
    obesityIncomeTotals                            %>%
      filter( incomeLevel == input$incomeLevel )   %>%
      filter (location %in% input$includeLocation) %>%
      ggplot(aes_string("incomeLevel", "obesePercent", fill = "location")) + 
      geom_boxplot()                                                       + 
      xlab("Income Level")                                                 + 
      ylab("% Obese")
    
  })
  

}

