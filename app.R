###############################################################################
# APP.R                                                                       #
# this is the file that weaves together the interface and the content         #
# followed the basic template suggested here:                                 #
# https://vimeo.com/rstudioinc/review/131218530/212d8a5a7a/#t=8m6s            #
###############################################################################

# load the libraries
library(shiny)
library(shinydashboard)
library(tidyverse)

# set up the user interface
# i am not 100% clear if i need this
# but since things work right now i'm not going to delete anything
ui <- fluidPage()

# set up the server
# same as above-- not sure if this is necessary
server <- function(input, output) {}

# combine the two into a shiny object
shinyApp(ui = ui,
         server = server)
