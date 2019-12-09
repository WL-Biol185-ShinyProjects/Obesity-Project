library(shiny)
library(ggplot2)
library(tidyverse)

#call csv data files

obesityIncomeTotals    <- read.csv("obesityIncomeTotals.csv")
obesityEducationTotals <- read.csv("obesityEducationTotals.csv")
obeseTotal             <- read.csv("obeseTotal.csv")
usaState2018Merge      <- read.csv("usaState2018Merge.csv")
stateCodes             <- read.csv("states.csv")
usaStates              <- rgdal::readOGR("states.geo.json")

#source each individual R script for each tab 

#source("introductionPage.r")
source("obesityHeatMap.r")
source("obesityEducation.r")
source("obesityIncome.r")

function(input, output, session) {
  
  output$stateResult2 <- renderText(
    {
      paste(input$state, collapse = ", ")
    }
)
  
  output$checkYear <- renderText(
    {
      yearInput <- paste(input$yearInput, collapse = ", ")
      paste(yearInput)
    }
)

  output$myLineGraph <- renderPlot(
    {
      obeseTotal                        %>%
        filter(
          yearNum %in% input$yearInput,
          State   %in% input$State
          )                             %>%
        ggplot(aes(yearNum, percentObese, color = State)) + 
        geom_line()                                      + 
        xlab("Year")                                     + 
        ylab("% Obese")
      }
)

   output$myHeatMap  <- renderLeaflet(
     {
       pal <- colorNumeric("YlOrRd", NULL)
       leaflet(usaStates)       %>%
         setView(-96, 37.8, 4)  %>%
         addTiles()             %>%
         addPolygons(
                     stroke           = FALSE,
                     smoothFactor     = 0.3,
                     fillOpacity      = 0.7,
                     opacity          = 1,
                     dashArray        = "3",
                     weight           = 2,
                     color            = "white",
                     fillColor        = ~pal(usaState2018Merge$percentObese),
                     label            = ~paste0(NAME, ": ", formatC(usaState2018Merge$percentObese)),
                     highlightOptions = highlightOptions(
                                                        color        = "white",
                                                        fillOpacity  = 2,
                                                        bringToFront = TRUE)
                     )          %>%
         addLegend(
                   position  = "bottomright",
                   pal       = pal, 
                   values    = ~(usaState2018Merge$percentObese), 
                   opacity   = 0.8, 
                   title     = "Percent Obese",
                   labFormat = labelFormat(suffix = "%"))
       }
)

 output$stateResult <- renderText(
   {
     paste(input$location, collapse = ", ")
    }
)
  
 output$barPlotEdu <- renderPlot(
   {
     obesityEducationTotals                         %>%
       filter(
        educationLevel %in% input$educationInput,
        location       %in% input$location
        )                                           %>%
        ggplot(aes(location, obesePercent, fill = educationLevel)) +
        scale_fill_manual(values = c("#FFCC33", "#FF9933", "#FF3333", "#990000")) +
        geom_col(position = "dodge",
                 alpha    = 0.9)                                   +
        xlab("States")                                             +
        ylab("% Obese")                                            +
        labs(fill = "Education Level") + scale_color_gradient("Blue")
    }
)
  
  output$stateResultDens <- renderText(
    {
      paste(input$locationDens, collapse = ", ")
    }
)
  
  output$densPlotEdu <- renderPlot(
    {
      obesityEducationTotals                              %>%
        filter(
          educationLevel %in% input$educationInputDens,
          location       %in% input$locationDens)         %>%
      ggplot(aes(obesePercent, fill = educationLevel))                            +
        scale_fill_manual(values = c("#99CCFF", "#FF9933", "#FF3333", "#FFFFCC")) +
        geom_density(alpha = 0.6)                                                 +
      xlab("% Obese")                                                             +
      ylab("Density")                                                             +
      labs(fill = "Education Level")
    }
)
    
  output$stateResult3 <- renderText(
    {
      paste(input$includeLocation, collapse = ", ")
    }
)

  output$myIncomeGraph <- renderPlot(
    {
      obesityIncomeTotals                                  %>%
        filter(incomeLevel %in% input$incomeInput)         %>%
        filter(location    %in% input$includeLocation)     %>%
        ggplot(aes(incomeLevel, obesePercent, fill = location)) + 
        geom_col(position = "dodge", alpha = 0.7)               + 
        xlab("Income Level")                                    + 
        ylab("% Obese")                                         +
        labs(fill = "States")
    }
)
  
  output$stateResult3Dens <- renderText(
    {
      paste(input$includeLocationDens, collapse = ", ")
    }
)
  
  output$myIncomeDensity <- renderPlot(
    {
      obesityIncomeTotals                                  %>%
        filter(incomeLevel %in% input$incomeInputDens)     %>%
        filter(location    %in% input$includeLocationDens) %>%
        ggplot(aes(obesePercent, fill = incomeLevel))                               +
        geom_density(alpha = 0.312)                                                 +
        xlab("% Obese")                                                             +
        ylab("Density")                                                             +
        labs(fill = "Income Level")
    }
  )
  
  }
