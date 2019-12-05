obesityIncomeTab <- list(
  
  titlePanel("Income & Obesity in the United States"),
  fluidRow(box(
               width      = 12,
               background = "black",
               p("This bar graph shows the correlation between average state income and percent of obesity in the state populace.")
               )
           ),
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput(
          "incomeInput",
          "Choose Income Level:",
          choices = list(
            "Less than $15,000"   = "Less than $15,000",
            "$15,000 - $24,999"   = "$15,000 - $24,999",
            "$25,000 - $34,999"   = "$25,000 - $34,999",
            "$35,000 - $49,999"   = "$35,000 - $49,999",
            "$50,000 - $74,999"   = "$50,000 - $74,999",
            "$75,000 or greater"  = "$75,000 or greater"
            ),
          selected = c("$15,000 - $24,999", "$35,000 - $49,999", "$75,000 or greater")
          ),
        textOutput("checkIncome"),
        selectInput(inputId = "includeLocation",
                    label   = "Choose States:",
                    choices = list(
                      "AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", "GA",
                      "GU", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD",
                      "ME", "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE", "NH", "NJ",
                      "NM", "NV", "NY", "OH", "OK", "OR", "PA", "PR", "RI", "SC", "SD",
                      "TN", "TX", "US", "UT", "VA", "VI", "VT", "WA", "WI", "WV", "WY"
                      ),
                    selectize = TRUE,
                    multiple  = TRUE,
                    selected  = c("VA", "WA")
                    ),
        textOutput("stateResult3")
      ),
    mainPanel(plotOutput("myIncomeGraph"))
    ),
  
  fluidRow(box(
               width      = 12,
               background = "black",
               p("The graph below shows...")
               )
           ),
  
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput(
        "incomeInputDens", "Choose Income Level:",
        choices = list(
          "Less than $15,000"   = "Less than $15,000",
          "$15,000 - $24,999"   = "$15,000 - $24,999",
          "$25,000 - $34,999"   = "$25,000 - $34,999",
          "$35,000 - $49,999"   = "$35,000 - $49,999",
          "$50,000 - $74,999"   = "$50,000 - $74,999",
          "$75,000 or greater"  = "$75,000 or greater"
        ),
        selected = c(
                     "$15,000 - $24,999",
                     "$35,000 - $49,999",
                     "$75,000 or greater"
                     )
      ),
      selectInput(inputId = "includeLocationDens",
                  label = "Choose States:",
                  choices = list(
                    "AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DC", "DE", "FL", "GA",
                    "GU", "HI", "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD",
                    "ME", "MI", "MN", "MO", "MS", "MT", "NC", "ND", "NE", "NH", "NJ",
                    "NM", "NV", "NY", "OH", "OK", "OR", "PA", "PR", "RI", "SC", "SD",
                    "TN", "TX", "US", "UT", "VA", "VI", "VT", "WA", "WI", "WV", "WY"
                  ),
                  selectize = TRUE,
                  multiple = TRUE,
                  selected = c("VA", "WA")
      ),
      textOutput("stateResult3Dens")
    ),
    mainPanel(plotOutput("myIncomeDensity"))
  )
)
