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

colnames (obeseTotalState2018) [2] <- "Abbreviation"
colnames (obeseTotalState2018) [1] <- "Number"


usaState2018Merge <- left_join(obeseTotalState2018, stateCodes)

write.csv(usaState2018Merge, "usaState2018Merge.csv")


leaflet(usaStates)       %>%
  setView(-96, 37.8, 4)  %>%
  addTiles()             %>%
  addPolygons(stroke = FALSE, 
              smoothFactor = 0.3,
              fillOpacity  = 0.7,
              opacity = 1,
              dashArray = "3",
              weight = 2,
              color = "white",
              fillColor    = ~pal(usaState2018Merge$percentObese),
              label        = ~paste0(NAME, ": ", formatC(usaState2018Merge$percentObese)),
              highlightOptions = highlightOptions(color = "white",
                                                  fillOpacity = 2,
                                                  bringToFront = TRUE)) %>%
  addLegend("bottomright",
              pal          = pal, 
              values       = ~(usaState2018Merge$percentObese), 
              opacity      = 0.8, 
              title        = "Percent Obese",
              labFormat    = labelFormat(suffix = "%"))
