#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(
  titlePanel("Car Explorer Demo App, June 28, 2017"),
  
  # Create a new Row in the UI for selectInputs
  fluidRow(
    column(4,
           selectInput("man",
                       "Make:",
                       c("All",
                         unique(as.character(mpg$manufacturer))))
    ),
    column(4,
           selectInput("class",
                       "Class:",
                       c("All",
                         unique(as.character(mpg$class))))
    ),
    column(4,
           selectInput("year",
                       "Year:",
                       c("All",
                         unique(as.character(mpg$year))))
    )
  ),
  # Create a new row for the table.
  fluidRow(
    DT::dataTableOutput("table")
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  # Filter data based on selections
  output$table <- DT::renderDataTable(DT::datatable({
    data <- mpg
    if (input$man != "All") {
      data <- data[data$manufacturer == input$man,]
    }
    if (input$class != "All") {
      data <- data[data$class == input$class,]
    }
    if (input$year != "All") {
      data <- data[data$year == input$year,]
    }
    data
  }))}

# Run the application 
shinyApp(ui = ui, server = server)

