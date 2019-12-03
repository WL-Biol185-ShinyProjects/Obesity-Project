obesityHeatTab <- list(
  
  titlePanel("Obesity in the United States"),
  
  fluidRow(box(width = 12, background = "black", p("This is a map of the United States detailing obesity in 2018"))),
  
  fluidRow(leafletOutput("myHeatMap")),
  
  fluidRow(box(width = 12, background = "black", p("The plot below shows an overview of obesity in the United States from 2009-2018"))),
  
  sidebarLayout(
  
  sidebarPanel(
  checkboxGroupInput("yearInput", "Choose the Year:",
      choices = list(
        "2011"  = "2011",
        "2012"  = "2012",
        "2013"  = "2013",
        "2014"  = "2014",
        "2015"  = "2015",
        "2016"  = "2016",
        "2017"  = "2017",
        "2018"  = "2018"),
        selected = list("2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018"),
        inline = TRUE),

    
    selectInput(inputId = "state",
                label = "Choose States:",
                choices = list(
                  "AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", "GA",
                  "GU", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD",
                  "ME", "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE", "NH", "NJ",
                  "NM", "NV", "NY", "OH", "OK", "OR", "PA", "PR", "RI", "SC", "SD",
                  "TN", "TX", "US", "UT", "VA", "VI", "VT", "WA", "WI", "WV", "WY"
                ),
                selected = list(
                  "AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", "GA",
                  "GU", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD",
                  "ME", "MI", "MN", "WA", "WI", "WV", "WY"
                ),
                selectize = TRUE,
                multiple  = TRUE
                
    ),
    textOutput("stateResult2") 
    ),
    mainPanel(plotOutput("myLineGraph"))
  )
  ) 
    
    
    
 
          




#data cleaning code for this this tab


library(tidyverse)
library(dplyr)

obesityGeneral <- filter(obesityData, Question == "Percent of adults aged 18 years and older who have obesity")

obesityGeneralYears <- filter(obesityGeneral, YearStart == c("2018"))

obesityGeneralYears <- obesityGeneral %>%
  select(1, 3, 8, 11, 17)

#renamed columns
colnames (obesityGeneralYears) [1]  <- "year"
colnames (obesityGeneralYears) [2]  <- "state"
colnames (obesityGeneralYears) [3]  <- "question" 
colnames (obesityGeneralYears) [4]  <- "percent" 
colnames (obesityGeneralYears) [5]  <- "sampleSize"

obesityGeneralYearsPercent <- obesityGeneralYears %>% #taking of N/A from percent column 
  filter(percent != "N/A")

obesityGeneralYearsPercent$state <- as.factor(obesityGeneralYearsPercent$state) #made state a factor
obesityGeneralYearsPercent$year <- as.factor(obesityGeneralYearsPercent$year)

#create bar graph of increase in obesity 

obeseTotal <- obesityGeneralYearsPercent %>%
  group_by(state, year) %>%
  summarize(percentObese = sum(percent*sampleSize)/(sum(sampleSize)))

obeseTotal$yearNum <- as.numeric(as.character(obeseTotal$year))


ggplot(obeseTotal, aes(yearNum, percentObese, color=state)) + geom_line()



# create heatmap 
library(rgdal)
library(leaflet)
library(tidyverse)
library(dplyr)

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


pal <- colorNumeric("viridis", NULL)

leaflet(usaStates) %>%
  setView(-96, 37.8, 4) %>%
  addTiles() %>%
  addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = 1,
              fillColor = ~pal(usaState2018Merge$percentObese),
              label = ~paste0(NAME, ": ", formatC(usaState2018Merge$percentObese, big.mark = ","))) %>%
  addLegend(pal = pal, values = (usaState2018Merge$percentObese), opacity = 1.0)




