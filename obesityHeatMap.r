obesityHeatTab <- list(
  
  titlePanel("Obesity in the United States"),
  
  fluidRow(box(width = 12, background = "navy", p("This is a map of the United States detailing obesity in 2018"))),
  
  fluidRow(leafletOutput("myHeatMap")),
  
  fluidRow(box(width = 12, background = "navy", p("The plot below shows an overview of obesity in the United States from 2009-2018"))),
  
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

                selected = "AL",
                selectize = TRUE,
                multiple  = FALSE
                ),
  
    textOutput("stateResult2") 
    ),
    mainPanel(plotOutput("myLineGraph"))
  )
)
