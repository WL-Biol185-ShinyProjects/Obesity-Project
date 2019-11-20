library(shiny)
library(shinydashboard)
library(leaflet)
library(ggplot2)
library(rgdal)
library(dbplyr)
library(tidyverse)
library(sp)

obesityData <- read.csv("Nutrition__Physical_Activity__and_Obesity_-_Behavioral_Risk_Factor_Surveillance_System.csv")

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