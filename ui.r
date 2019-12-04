library(shiny)
library(shinydashboard)
library(leaflet)
library(ggplot2)
library(rgdal)
library(dplyr)
library(tidyverse)
library(sp)

#call csv data files

obesityIncomeTotals <- read.csv("obesityIncomeTotals.csv")
obesityEducationTotals <- read.csv("obesityEducationTotals.csv")
obeseTotal <- read.csv("obeseTotal.csv")
usaState2018Merge <- read.csv("usaState2018Merge.csv")


#source each tab into the general ui.r

source("obesityHeatMap.r"  )
source("obesityEducation.r")
source("obesityIncome.r"  )

fluidPage(
  dashboardPage(
    dashboardHeader(title="Obesity in the USA"),
    dashboardSidebar(
      sidebarMenu(
        menuItem("Obesity in America"           , tabName = "obesityHeatTab"     ),
        menuItem("Obesity and Education in 2018", tabName = "obesityEducationTab"),
        menuItem("Obesity and Income in 2018"   , tabName = "obesityIncomeTab"   )
      )
      ),
    
    
    #creating tabs in the app
    dashboardBody(
      
         tabItems(
        
        tabItem(tabName = "obesityHeatTab",      obesityHeatTab),
        tabItem(tabName = "obesityEducationTab", obesityEducationTab),
        tabItem(tabName = "obesityIncomeTab",    obesityIncomeTab)
      )
      )
      )
      )
