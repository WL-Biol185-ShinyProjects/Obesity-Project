library(shiny)
library(ggplot2)
library(tidyverse)

#source each individual R script for each tab 

source("obesityHeatMap.r")
source("obesityEducation.r")
source("obesityIncome.r")

function(input, output, session) {
  
  
  output$stateResult2 <- renderText({
    
    paste(input$state, collapse = ", ")
    
  })
  
  output$checkYear <- renderText({
    
    yearInput <- paste(input$yearInput, collapse = ", ")
    paste(yearInput)
  })
  
  output$myLineGraph <- renderPlot({
    obeseTotal                                %>%
      filter(
        yearNum     %in% input$yearInput,
        state       %in% input$state)         %>%     
      
      ggplot( aes(yearNum, percentObese, color=state)) + 
      geom_line()                                      + 
      xlab("Year")                                     + 
      ylab("Percent Obese")                
    
  })
  
  usaStates      <- rgdal::readOGR("states.geo.json")
  stateCodes     <- read.csv("states.csv")
  obeseTotal2018 <- filter(obeseTotal, year == "2018")
  
  obeseTotalState2018 <- obeseTotal2018 %>%
    filter(state %in% c(                 "AL", "AK", "AZ", "AR", "CA", "CO", 
                                         "CT", "DE", "DC", "FL", "GA", "HI", 
                                         "ID", "IL", "IN", "IA", "KS", "KY", 
                                         "LA", "ME", "MT", "NE", "NV", "NH", 
                                         "NJ", "NM", "NY", "NC", "ND", "OH", 
                                         "OK", "OR", "MD", "MA", "MI", "MN", 
                                         "MS", "MO", "PA", "RI", "SC", "SD", 
                                         "TN", "TX", "UT", "VT", "VA", "WA",
                                         "WV", "WI", "WY" ))
  
  colnames (obeseTotalState2018) [1] <- "Abbreviation"
  
  usaState2018Merge <- left_join(obeseTotalState2018, stateCodes)
  
  output$myHeatMap <- renderLeaflet({
    
pal <- colorNumeric("viridis", NULL)

      leaflet(usaStates)  
      #setView(-96, 37.8, 4) %>%
      #addTiles()            %>%
     # addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = 1,
               #   fillColor = ~pal(usaState2018Merge$percentObese),
               #   label = ~paste0(NAME, ": ", formatC(usaState2018Merge$percentObese, big.mark = ","))) %>%
                #  addLegend(pal = pal, values = ~(usaState2018Merge$percentObese), opacity = 0.7)
    
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
        geom_col(position = "dodge", alpha = 0.7)                  +
        xlab("States")                                             +
        ylab("% Obese")                                            +
        labs(fill = "Education Level")
    
  })
  
  output$stateResultDens <- renderText({
    
    paste(input$locationDens, collapse = ", ")
    
  })
  
  output$densPlotEdu <- renderPlot({
    
    
    obesityEducationTotals                 %>%
      filter(
        educationLevel %in% input$educationInputDens,
        location       %in% input$locationDens)                                    %>%
      ggplot(aes(obesePercent, fill = educationLevel)) + geom_density(alpha = 0.312) +
      ylab("Density")                                                   +
      xlab("% Obese")                                                   +
      labs(fill = "Education Level")
    
  })
    
  
  output$stateResult3 <- renderText({
    
    paste(input$includeLocation, collapse = ", ")
    
  })
  
  
  output$myIncomeGraph <- renderPlot({
    
    obesityIncomeTotals                           %>%
      filter(incomeLevel %in% input$incomeLevel)  %>%
      filter(location    %in% input$includeLocation)     %>%
      ggplot(aes(incomeLevel, obesePercent, fill = location)) + 
      geom_col(position = "dodge", alpha = 0.7)               + 
      xlab("Income Level")                                    + 
      ylab("% Obese")
    
  })
  

  
}
