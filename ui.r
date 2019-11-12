library(shiny)
library(shinydashboard)
library(leaflet)
library(ggplot2)

#source each tab into the general ui.r

#source("obesityHeatMap.r"  )
#source("obesityEducation.r")
#source("obesityIncome.r"   )

myHeatMap <- ggplot(obeseTotal, aes(yearNum, percentObese, color=state)) + geom_line()
myHeatMap

fluidPage(
  dashboardPage(
    dashboardHeader(title="Obesity in America"),
    dashboardSidebar(
      sidebarMenu(
        menuItem("Obesity in America"           , tabName = "obesityHeat"     ),
        menuItem("Obesity and Education in 2018", tabName = "obesityEducation"),
        menuItem("Obesity and Income in 2018"   , tabName = "obesityIncome"   )
      )
      ),
    
    
    
    #creating tabs in the app
    dashboardBody(
      
      tabItems(
        
        tabItem(tabName = "obesityHeat",
                                             obesityHeat),
        tabItem(tabName = "obesityEducation",
                                             obesityEducation),
        tabItem(tabName = "obesityIncome",
                                             obesityIncome)
      )
      )
      )
      )
  




#Make header page
  #on headed page need heat map of % of adults 18+ with obesity
  #add desciption of why this is relevant

#2nd tab
  #Education- another heat map with % of education level on each one as a pin
  #box plot below of x axis=state and y= % obese, color code with education levels (drop down box for state and check box box for education level)

#3rd tab
  #Poverty level with same obesity heat map
  #bar graph x= income level (check box) and y=% obese, color by state (maybe drop down) 
