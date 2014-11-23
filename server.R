library(shiny)
library(datasets)

# Define server logic required to summarize and view the 
# selected dataset
shinyServer(function(input, output) {
  datasetInput <- reactive({
  ## Read outcome data 
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character") 
  
  
  ## Filter and simplify the column names 
  data <- data[c(2, 7, 11, 17, 23)] 
  names(data)[1] <- "name" 
  names(data)[2] <- "state" 
  names(data)[3] <- "heart attack" 
  names(data)[4] <- "heart failure" 
  names(data)[5] <- "pneumonia" 
  # Return the requested dataset
  # Grab only rows with our state value   
    df <- data[data$state==input$state, ] 
  # Sort the list for the outcome and return  
    df <- df[order(df[input$outcomename], decreasing = FALSE), ]

  })
  
  # Show the first 10 observations
  output$view <- renderTable({
    head(datasetInput(), 10)
  })
})