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
  
 
    
}