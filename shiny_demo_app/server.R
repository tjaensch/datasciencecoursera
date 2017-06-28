library(ggplot2)

function(input, output) {
  
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
  }))
  
}