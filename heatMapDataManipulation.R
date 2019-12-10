stateCodes          <- read.csv("states.csv")

obeseTotal2018      <- filter(obeseTotal, year == "2018")

obeseTotalState2018 <- obeseTotal2018 %>%
  filter(state %in% c("AL", "AK", "AZ", "AR", "CA", "CO", 
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

write.csv(usaState2018Merge, "usaState2018Merge.csv")
