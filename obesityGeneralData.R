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

write.csv(obeseTotal, "obeseTotal.csv")
