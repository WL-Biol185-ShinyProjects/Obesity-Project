library(tidyverse)
library(dplyr)

write.csv(obeseTotal, "obeseTotal.csv")

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

obeseTotal <- obesityGeneralYearsPercent %>%
  group_by(state, year) %>%
  summarize(percentObese = sum(percent*sampleSize)/(sum(sampleSize)))


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


pal <- colorNumeric("YlOrRd", NULL)

leaflet(usaStates)      %>%
  setView(-96, 37.8, 4) %>%
  addTiles()            %>%
  addPolygons(stroke = FALSE, smoothFactor = 0.3, fillOpacity = 0.8,
              fillColor = ~pal(usaState2018Merge$percentObese),
              label = ~paste0(NAME, ": ", formatC(usaState2018Merge$percentObese), "%")) %>%
  addLegend(pal = pal, values = (usaState2018Merge$percentObese), opacity = 0.8)
