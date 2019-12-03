obesityEducationTab <- list(
  
  titlePanel("Education & Obesity in the United States"),
  
  fluidRow(box(width = 12, background = "black", p("The graph below shows..."))),
  
   sidebarLayout(
    sidebarPanel(
    checkboxGroupInput(
      "educationInput", "Choose Education Level:",
      choices = list(
        "College Graduate"     = "College graduate",
        "Highschool Graduate"  = "High school graduate",
        "Less than Highschool" = "Less than high school",
        "Technical School"     = "Some college or technical school"
      ),
      selected = c("College graduate", "High school graduate", "Less than high school")
    ),
    
    selectInput(inputId = "location",
                label = "Choose States:",
                choices = list(
                  "AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", "GA",
                  "GU", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD",
                  "ME", "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE", "NH", "NJ",
                  "NM", "NV", "NY", "OH", "OK", "OR", "PA", "PR", "RI", "SC", "SD",
                  "TN", "TX", "US", "UT", "VA", "VI", "VT", "WA", "WI", "WV", "WY"
                ),
                selected = c("NY", "VA"),
                selectize = TRUE,
                multiple = TRUE
    ),
    textOutput("stateResult")
    ),
    mainPanel(plotOutput("barPlotEdu")
    )
  ),

  fluidRow(box(width = 12, background = "black", p("The graph below shows..."))),
   
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput(
        "educationInputDens", "Choose Education Level:",
        choices = list(
          "College Graduate"     = "College graduate",
          "Highschool Graduate"  = "High school graduate",
          "Less than Highschool" = "Less than high school",
          "Technical School"     = "Some college or technical school"
        ),
        selected = c("College graduate", "High school graduate", "Less than high school")
      ),
      
      selectInput(inputId = "locationDens",
                  label = "Choose States:",
                  choices = list(
                    "AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", "GA",
                    "GU", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD",
                    "ME", "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE", "NH", "NJ",
                    "NM", "NV", "NY", "OH", "OK", "OR", "PA", "PR", "RI", "SC", "SD",
                    "TN", "TX", "US", "UT", "VA", "VI", "VT", "WA", "WI", "WV", "WY"
                  ),
                  selected = c("NY", "CA", "VA", "DC"),
                  selectize = TRUE,
                  multiple = TRUE
      ),
      textOutput("stateResultDens")
    ),
    mainPanel(plotOutput("densPlotEdu")
    )
  )
)
