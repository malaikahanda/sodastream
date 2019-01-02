###############################################################################
# SERVER.R                                                                    #
# this is the file that computes the content of the plots                     #
# calls rely on user input, which is accessed via input$___                   #       
###############################################################################

# load the libraries
library(tidyverse)

# don't change these variable names or everything will break
function(input, output) {
  
  # second output: the scatter plot
  output$scatter <- renderPlot({
    
    # let the user specify what type of sodawater they drink
    fixed_cost <- input$fixed_cost
    perunit_cost <- input$perunit_cost
    if (input$perunit_type == "liter") {
      size = 1000
    } else if (input$perunit_type == "twoliter") {
      size = 2000
    } else { # input$perunit_type == "can"
      size = 750
    }
    
    # calculate the two lines
    
    
    # actual plot
    ggplot() +
      geom_line() +
      labs(title = "When will you break even?",
           x = "Number of drinks",
           y = "Price ($)")
  })
}