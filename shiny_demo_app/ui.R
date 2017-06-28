# Load ggplot2 package which provides 'mpg' dataset.
library(ggplot2)

fluidPage(
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
