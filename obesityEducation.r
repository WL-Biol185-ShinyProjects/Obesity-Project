ObesityEducationTab <- tabItem 

#data manipulation for education
View(obesityData)
library(tidyverse)
library(dplyr)

#tidy table
obesityEducation <- obesityData                                                   %>%
  select(1,3,8,11,17,20)                                                          %>%
  filter(Education               != "N/A",
         YearStart               == "2018",
         Question                == 
                    "Percent of adults aged 18 years and older who have obesity")

colnames(obesityEducation) [1] <- "year"
colnames(obesityEducation) [2] <- "location"
colnames(obesityEducation) [3] <- "question"
colnames(obesityEducation) [4] <- "percent"
colnames(obesityEducation) [5] <- "sampleSize"
colnames(obesityEducation) [6] <- "educationLevel"

#calculations
obesityEducationData <- obesityEducation     %>%
  as_tibble()                                %>% 
  mutate(
  numberObese = sampleSize*(percent/100))

obesityEducationData$location <- as.factor(obesityEducationData$location)
obesityEducationData$year <- as.factor(obesityEducationData$year)
obesityEducationData$educationLevel <- as.factor(obesityEducationData$educationLevel)


obesityEducationTotals <- obesityEducationData                       %>%
  as_tibble()                                                        %>% 
  mutate(
  obesePercent = (numberObese/sampleSize)*100)

View(obesityEducationTotals)


#server stuff
library(shiny)
library(ggplot2)
library(tidyverse)

function(input, output, session) {
  
output$barPlotEdu <- renderPlot({
  
  eduLevel <- c("College Graduate"                 ,
                "High School Graduate"             ,
                "Less Than High School"            ,
                "Some College or Technical School"
            )
  selectedEducation <- eduLevel[c(input$col, input$hs, input$lessHs, input$someCol)]

  obesityEducationTotals                 %>%
    filter(
      eduLevel %in% selectedEducation
    )                                   %>%
    ggplot(aes(location, obesePercent, fill = educationLevel)) +
    geom_col(position = "dodge", alpha = 0.5)                  +
    xlab("State")                                              +
    ylab("% Obese")
})

}

#ui stuff

library(shiny)

fluidPage(
  
  
  title = "Obesity & Education",
  titlePanel("Education & Obesity"),
  
  sidebarLayout(
    sidebarPanel(
      checkboxInput(
        inputId = "col",
        label = "College Graduate",
        value = TRUE
      ),
      checkboxInput(
        inputId = "hs",
        label = "High School Graduate",
        value = TRUE
      ),    
      checkboxInput(
        inputId = "lessHs",
        label = "Less Than High School",
        value = TRUE
      ),     
      checkboxInput(
        inputId = "someCol",
        label = "Some College or Technical School",
        value = TRUE
      ),     
    
    
    mainPanel(
      plotOutput("barPlotEdu")
    )
  )
 )
)

