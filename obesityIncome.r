obesityIncomeTab <- list(

  titlePanel("Income & Obesity in the United States"),
  fluidRow(box(
               width      = 12,
               background = "navy",
               p("The bar graph below depicts the correlation between average state income and percent of obesity across various state populations.")
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
                    selected  = c("DC", "WA","MS")
                    ),
        textOutput("stateResult3")
      ),
    mainPanel(plotOutput("myIncomeGraph"))
    ),

  fluidRow(box(
               width      = 12, 
               background = "navy", 
               p("The density plot below depicts the frequency of each obesity percentage by income level.")
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
                  selected = c("DC", "WA", "MS")
      ),
      textOutput("stateResult3Dens")
    ),
    mainPanel(plotOutput("myIncomeDensity"))
  )
)
