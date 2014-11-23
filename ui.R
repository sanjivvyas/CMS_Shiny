library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title.
  titlePanel("Best Hospitals "),
  
  # Sidebar with controls to select a dataset and specify the
  # number of observations to view. The helpText function is
  # also used to include clarifying text. Most notably, the
  # inclusion of a submitButton defers the rendering of output
  # until the user explicitly clicks the button (rather than
  # doing it immediately when inputs change). This is useful if
  # the computations required to render output are inordinately
  # time-consuming.
  sidebarLayout(
    sidebarPanel(
      selectInput("outcomename", "Choose an outcome:", 
                  choices = c("heart attack", "heart failure", "pneumonia")),
      
      selectInput("state", "Choose a state:", 
                  choices = c("AL","AK","AZ","AR","CA","CO","CT","DE","FL","GA","HI","ID","IL","IN","IA","KS","KY","LA","ME","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV","WI","WY")),
    
      
      helpText("Note: while the data view will show only the ten ",
               "observations, however the results are based",
               "on the full dataset.",
               "The data for this assignment come from the Hospital",
               "Compare web site (http://hospitalcompare.hhs.gov) ",
              "run by the U.S. Department of Health and Human Services.",
              "The purpose of the web site is to provide data and ",
              "information about the quality of care at over 4,000 ",
              "Medicare-certifed hospitals in the U.S. This dataset ",
              "essentially covers all major U.S. hospitals. This ",
              "dataset is used for a variety of purposes, including ",
              "determining whether hospitals should be fined for not ",
              "providing high quality care to patients (see http://goo.gl/jAXFX",
              "for some background on this particular topic).",

              "The Hospital Compare web site contains a lot of data and we",
              "will only look at a small subset for this assignment. ",

              "We are using outcome-of-care-measures.csv: Contains information",
              "about 30-day mortality and readmission rates for heart attacks, ",
              "heart failure, and pneumonia for over 4,000 hospitals.",
               
              "User should select an outcome and pick a state to see 10 best ",
              "hospitals for that outcome. Two other outcomes are also provided,
              for reference"),
      
      submitButton("Update View")
    ),
    
    # Show a summary of the dataset and an HTML table with the
    # requested number of observations. Note the use of the h4
    # function to provide an additional header above each output
    # section.
    mainPanel(
      
      h4("List of Best Hospitals for the Outcome in Selected State:"),
      tableOutput("view")
    )
  )
))