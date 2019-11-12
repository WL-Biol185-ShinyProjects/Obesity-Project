View(obesityData)
library(tidyverse)
library(dplyr)
library(ggplot2)

obesityGeneral     <- filter(obesityData, Question == "Percent of adults aged 18 years and older who have obesity")

obesityGeneralYear <- filter(obesityGeneral, YearStart == c("2018", "2017"))


#filter table for 5 columns that we want
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
obesityGeneralYearsPercent$year  <- as.factor(obesityGeneralYearsPercent$year)

#creates obesity Total column that will allow me to make the line graph

obeseTotal <- obesityGeneralYearsPercent %>%
  group_by(state, year) %>%
  summarize(percentObese = sum(percent*Sample_Size)/(sum(Sample_Size)))



obeseTotal$yearNum <- as.numeric(as.character(obeseTotal$year))


ggplot(obeseTotal, aes(yearNum, percentObese, color=state)) + geom_line()





#View(obesityGeneralYearsPercent)
#interactive plots, plotOutput
#brush = brushOpts( id  = "you create this"

                  