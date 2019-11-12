
ObesityEducation <- list(
  
  mainPanel
)

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
<<<<<<< HEAD
function(input, output, session) {
  
  output$stateResult <- renderText({
    
    paste(input$location, collapse = ", ")
    
  })
  
  output$checkEdu <- renderText({
    
    educationInput <- paste(input$educationInput, collapse = ", ")
    paste(educationInput)
    
  })
  
  output$barPlotEdu <- renderPlot({
    
    
    obesityEducationTotals                 %>%
      filter(
        educationLevel %in% input$educationInput,
        location       %in% input$location)                                    %>%
      ggplot(aes(location, obesePercent, fill = educationLevel)) +
      geom_col(position = "dodge", alpha = 0.5)                  +
      xlab("State")                                              +
      ylab("% Obese")
    
  })
  
}
=======
library(shiny)
library(ggplot2)
library(tidyverse)

#function(input, output, session) {
  
#output$barPlotEdu <- renderPlot({
  
  # eduLevel <- c("College Graduate"                 ,
     #           "High School Graduate"             ,
    #            "Less Than High School"            ,
   #             "Some College or Technical School"
    #        )
  #selectedEducation <- eduLevel[c(input$col, input$hs, input$lessHs, input$someCol)]

  #obesityEducationTotals                 %>%
  #  filter(
   #   eduLevel %in% selectedEducation
  #  )                                   %>%
   # ggplot(aes(location, obesePercent, fill = educationLevel)) +
  #  geom_col(position = "dodge", alpha = 0.5)                  +
   # xlab("State")                                              +
  #  ylab("% Obese")
#})

#}
>>>>>>> 406ff5bb9633ef7cf7736b2dae1e90af97241912

#ui stuff

library(shiny)

#fluidPage(
  
  
<<<<<<< HEAD
  title = "Obesity & Education",
  
  titlePanel("Education & Obesity"),
  sidebarPanel(
    checkboxGroupInput(
      "educationInput", "Choose Education Level:",
      choices = list(
        "College Graduate"     = "College graduate",
        "Highschool Graduate"  = "High school graduate",
        "Less than Highschool" = "Less than high school",
        "Technical School"     = "Some college or technical school"
      )
    ),
    textOutput("checkEdu"),
    
    selectInput(inputId = "location",
                label = "Choose States:",
                choices = list(
                  "AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", "GA",
                  "GU", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD",
                  "ME", "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE", "NH", "NJ",
                  "NM", "NV", "NY", "OH", "OK", "OR", "PA", "PR", "RI", "SC", "SD",
                  "TN", "TX", "US", "UT", "VA", "VI", "VT", "WA", "WI", "WV", "WY"
                ),
                selectize = TRUE,
                multiple = TRUE
                
    ),
    textOutput("stateResult"),
    mainPanel(plotOutput("barPlotEdu")
    )
  )
)
=======
 # title = "Obesity & Education",
  #titlePanel("Education & Obesity"),
  
#  sidebarLayout(
#    sidebarPanel(
 #     checkboxInput(
#       inputId = "col",
 #       label = "College Graduate",
  #      value = TRUE
  #    ),
   #   checkboxInput(
    #    inputId = "hs",
     #   label = "High School Graduate",
      #  value = TRUE
      #),    
      #checkboxInput(
       # inputId = "lessHs",
      #  label = "Less Than High School",
       # value = TRUE
    #  ),     
     # checkboxInput(
      #  inputId = "someCol",
       # label = "Some College or Technical School",
      #  value = TRUE
    #  ),     
    
    
 #   mainPanel(
 #     plotOutput("barPlotEdu")
 #   )
#  )
# )
#)
>>>>>>> 406ff5bb9633ef7cf7736b2dae1e90af97241912

