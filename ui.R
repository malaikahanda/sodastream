###############################################################################
# UI.R                                                                        #
# this is the file that organizes everything we display                       #
# each call (ex. dashboardPage) sets up a chunk of the layout                 #       
###############################################################################

ui <- fluidPage(
  
  titlePanel("SodaStream Calculator"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      sliderInput(inputId = "fixed_cost",
                  label = "How much did you spend on your SodaStream?",
                  min = 0,
                  max = 100,
                  value = 50,
                  step = 1),
      
      sliderInput(inputId = "perunit_cost",
                  label = "How much did you pay for a can or bottle of soda water?",
                  min = 0,
                  max = 5,
                  value = 2.5,
                  step = 0.1),
      
      selectInput(inputId = "perunit_type",
                  label = "What size was the soda water you used to buy?",
                  choices = c("1-liter bottle", "2-liter bottle", "750mL can"),
                  selected = "1-liter bottle")
      
    ),
    
    mainPanel(
      
      plotOutput(outputId = "scatter", height = "400px")
      
    )
    
  )
)