library(shiny)
library(ggplot2)
library(tidyverse)

#source each individual R script for each tab 

source("obesityHeatMap.r")
source("obesityEducation.r")
source("obesityIncome.r")

function(input, output, session) {
  
  obesityHeatOutput     <- obesityHeatMap.r
  obesityEductionOutput <- obesityEducation.r
  obesityIncomeOutput   <- obesityIncome.r
  
  
    
}