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
                  max = 50,
                  value = 18,
                  step = 1),
      
      sliderInput(inputId = "refill_cost",
                  label = "How much are 60 liters of refills?",
                  min = 0,
                  max = 50,
                  value = 15,
                  step = 1),
      
      selectInput(inputId = "perunit_type",
                  label = "What size was the soda water you used to buy?",
                  choices = c("1-liter bottle", "2-liter bottle", "12 oz can"),
                  selected = "1-liter bottle"),
      
      sliderInput(inputId = "perunit_cost",
                  label = "How much did you pay for a can or bottle of soda water?",
                  min = 0,
                  max = 5,
                  value = 2.5,
                  step = 0.1)
      
    ),
    
    mainPanel(
      
      plotOutput(outputId = "scatter", height = "400px")
      
    )
    
  )
)