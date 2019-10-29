library(shiny)
View(obesityData)

#source each tab into the general ui.r

source("obesityHeatMap.r")
source("obesityEducation.r")
source("obesityIncome.r")


#Make header page
  #on headed page need heat map of % of adults 15+ with obesity
  #add desciption of why this is relevant

#2nd tab
  #Education- another heat map with % of education level on each one as a pin
  #box plot below of x axis=state and y= % obese, color code with education levels (drop down box for state and check box box for education level)

#3rd tab
  #Poverty level with same obesity heat map
  #bar graph x= income level (check box) and y=% obese, color by state (maybe drop down) 