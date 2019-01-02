###############################################################################
# SERVER.R                                                                    #
# this is the file that computes the content of the plots                     #
# calls rely on user input, which is accessed via input$___                   #       
###############################################################################

# https://www.reddit.com/r/dataisbeautiful/comments/a9ups9/cost_of_owning_a_sodastream_vs_buying_cans_of/

# load the libraries
library(tidyverse)

# don't change these variable names or everything will break
function(input, output) {
  
  # second output: the scatter plot
  output$scatter <- renderPlot({
    
    # let the user specify what type of sodawater they drink
    fixed_cost <- input$fixed_cost
    perunit_cost <- input$perunit_cost
    refill_cost <- input$refill_cost
    if (input$perunit_type == "1-liter bottle") {
      size = 1000
    } else if (input$perunit_type == "2-liter bottle") {
      size = 2000
    } else { # input$perunit_type == "12 oz can"
      size = 350
    }
    
    # calculate the lines and breakeven point (assumes SodaStream bottles are 2L)
    perunit_slope = (perunit_cost / size) * 2000
    refill_slope = refill_cost / 30
    breakeven_x = fixed_cost / (perunit_slope - refill_slope)
    breakeven_y = breakeven_x * perunit_slope
    plot_title = paste("You'll break even after making ",
                       as.character(ceiling(breakeven_x)),
                       " 2L bottles",
                       sep = "")
    df = data.frame(x = c(breakeven_x),
                    y = c(breakeven_y))
    
    # actual plot
    ggplot(data = df,
           aes(x = x,
               y = y)) +
      geom_abline(slope = refill_slope,
                  intercept = fixed_cost,
                  color = "red",
                  size = 1) +
      geom_abline(slope = perunit_slope,
                  intercept = 0,
                  color = "black",
                  size = 1) +
      geom_point(color = "blue",
                 size = 5) +
      xlim(0, 100) +
      ylim(0, 100) +
      labs(title = plot_title,
           x = "Number of 2L bottles",
           y = "Cost ($)")
  })
  
}