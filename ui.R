###############################################################################
# UI.R                                                                        #
# this is the file that organizes everything we display                       #
# each call (ex. dashboardPage) sets up a chunk of the layout                 #       
###############################################################################

# load the libraries
library(shinydashboard)

# main outer call to build the page
bootstrapPage(
  
  # set up the dashboard
  dashboardPage(
    
    # title of dashbaord
    dashboardHeader(title = "Breaking Even with Sodastream"),
    
    # what should we write on the sidebar?
    dashboardSidebar(sidebarMenu(
      # this says "tab name" but it means "the name to write on the sidebar"
      # not to be confused with the actual tabs, which happen below
      menuItem("Breaking Even", tabName = "breakEven")
    )),
    
    # this is where all our plots go
    dashboardBody(
      
      # again, this confusingly says "tabs" when it's for the sidebar
      tabItems(
        
        # # first item on sidebar
        # tabItem(tabName = "partA", # reference the ID from above
        #         
        #         # slidder for histogram
        #         selectInput(inputId = "n_breaks",
        #                     label = "Number of bins in histogram (approximate):",
        #                     choices = c(10, 20, 35, 50),
        #                     selected = 20),
        #         
        #         # checkbox for rug
        #         checkboxInput(inputId = "individual_obs",
        #                       label = strong("Show individual observations"),
        #                       value = FALSE),
        #         
        #         # checkbox for density estimate
        #         checkboxInput(inputId = "density",
        #                       label = strong("Show density estimate"),
        #                       value = FALSE),
        #         
        #         # actual plot
        #         plotOutput(outputId = "histogram", height = "300px"),
        #         
        #         # Display this only if the density is shown
        #         conditionalPanel(condition = "input.density == true",
        #                          sliderInput(inputId = "bw_adjust",
        #                                      label = "Bandwidth adjustment:",
        #                                      min = 0.2, max = 2, value = 1, step = 0.2)
        #         )
        # ),
        
        # second item on sidebar
        tabItem(tabName = "breakEven",
                
                sliderInput(inputId = "point_size",
                            label = "Point size:",
                            min = 0.5, max = 5, value = 1, step = 0.5),
                                     
                # actual plot
                plotOutput(outputId = "scatter", height = "400px"))

                            )
                )
                
                

                
        )
      )
    )
  )
  
)
