introductionTab <- list(
  
  h1(strong("Welcome to our obesity project"), style = "color: #990000", align = "center"),
  br(),
  
  h2(strong("The impacts of the obesity epidemic touch on all aspects of life, including health, productivity, and economics. In many cases, obesity limits an individual’s mobility to the point of disability, drastically lowering their health related quality of life (2). In 2014, the cost of increased healthcare and lost productivity factored into an estimated global economic burden of 2 trillion dollars (5).")),
  br(),
  
  img(src = "obesity image.png", height = 200, width = 200),
  h3(strong("Obesity data compiled from the CDC (1) was used to visualize the relationships between obesity and education & income levels across the United States. Below outlines the specific relationships we found:")),
  
  h3("Obesity rates are lower in individuals who are college graduates than those who graduated from high school, but did not continue on to college (4)."),
  br(),
  h3("Low income individuals are also vulnerable to developing obesity, and orient towards prepackaged meals due to restricted time and inability to properly meal prep. Processed foods are most often purchased over healthier options due to a lack of time and resources (3)."),
  br(),
  h3("Education and financial success seem to be factors associated with weight gain and obesity."),
  br(),
  br(),
  
  #create links to references
  
  h2("References"),
    a("1. Centers for Disease Control and Prevention. (2019, October 10). Chronic Data. Retrieved from Nutrition, Physical Activity, and Obesity - Behavioral Risk Factor Surveillance System", href ="https://chronicdata.cdc.gov/Nutrition-Physical-Activity-and-Obesity/Nutrition-Physical-Activity-and-Obesity-Behavioral/hn4x-zwk7"),
  br(),

    a("2. Forhan, M., & Gill, S. (2013). Obesity, functional mobility and quality of life. Best Practice & Research Clinical Endocrinology & Metabolism, 27(2), 129–137.", href = "https://doi.org/10.1016/j.beem.2013.01.003"),
  br(),

   a("3. Horning, M., Fulkerson, J., Friend, S., & Story, M. (2017). Reasons Parents Buy Prepackaged, Processed Meals: It Is More Complicated Than “I Don’t Have Time.” Journal of Nutrition Education and Behavior, 49(1), 60–66.e1.", href = "https://doi.org/10.1016/j.jneb.2016.08.012"),
  br(),
   
   a("4. Ogden, C., Fakhouri, T., Carroll, M., Hales, C., Fryar, C., Li, X., & Freedman, D. (2017). Prevalence of Obesity Among Adults, by Household Income and Education—United States, 2011-2014.(Survey). Morbidity and Mortality Weekly Report, 66(50), 1369–1373.", href = "https://doi.org/10.15585/mmwr.mm6650a1"),
  br(),

   a("5. Tremmel, M., Gerdtham, U., Nilsson, P., Saha, S., & Tremmel, M. (2017). Economic Burden of Obesity: A Systematic Literature Review. International Journal of Environmental Research and Public Health, 14(4).", href = "https://doi.org/10.3390/ijerph14040435"),
  br()
  
  
)
