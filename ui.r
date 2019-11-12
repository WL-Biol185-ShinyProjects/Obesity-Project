library(shiny)
View(obesityData)
library(shinydashboard)
<<<<<<< HEAD
library(leaflet)
library(ggplot2)
=======
>>>>>>> d599afe96b52b8c9a90a0d10f442ec35d6f760d7

#source each tab into the general ui.r
#trying to make this work :)

<<<<<<< HEAD
#source("obesityHeatMap.r"  )
#source("obesityEducation.r")
#source("obesityIncome.r"   )

myHeatMap <- ggplot(obeseTotal, aes(yearNum, percentObese, color=state)) + geom_line()
myHeatMap
=======
source("obesityHeatMap.r")
source("obesityEducation.r")
source("obesityIncome.r")
>>>>>>> d599afe96b52b8c9a90a0d10f442ec35d6f760d7

  dashboardPage(
    dashboardHeader(title="Obesity in America"),
    dashboardSidebar(
      sidebarMenu(
<<<<<<< HEAD
        menuItem("Obesity in America"           , tabName = "obesityHeat"     ),
        menuItem("Obesity and Education in 2018", tabName = "obesityEducation"),
        menuItem("Obesity and Income in 2018"   , tabName = "obesityIncome"   )
=======
        menuItem("Obesity in America"   , tabName = "obesityHeat"),
        menuItem("Obesity and Education", tabName = "obesityEducation"),
        menuItem("Obesity and Income"   , tabName = "obesityIncome")
>>>>>>> d599afe96b52b8c9a90a0d10f442ec35d6f760d7
      )
    ),
    dashboardBody(
      tabItems(
<<<<<<< HEAD
        
        tabItem(tabName = "obesityHeat",
                                             
                fluidRow(
                  box(width = 12, background = "black", p("The plot below shows an overview of obesity in the United States from 2009-2018")
                      ),
                  
                  fluidRow(plotOutput("myHeatMap"))
                  
                )),
        tabItem(tabName = "obesityEducation",
                                             obesityEducation),
        tabItem(tabName = "obesityIncome",
                                             obesityIncome)
      )
      )
      )
      )
  
=======
        tabItem(tabName = "obesityHeat"),
        tabItem(tabName = "obesityEducation"),
        tabItem(tabName = "obesityIncome")
      )
    )
  )

>>>>>>> d599afe96b52b8c9a90a0d10f442ec35d6f760d7




#Make header page
  #on headed page need heat map of % of adults 18+ with obesity
  #add desciption of why this is relevant

#2nd tab
  #Education- another heat map with % of education level on each one as a pin
  #box plot below of x axis=state and y= % obese, color code with education levels (drop down box for state and check box box for education level)

#3rd tab
  #Poverty level with same obesity heat map
  #bar graph x= income level (check box) and y=% obese, color by state (maybe drop down) 
