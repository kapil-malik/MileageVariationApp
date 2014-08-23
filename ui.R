# This is the user-interface definition of Mileage Variation Application
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Mileage variation in mtcars dataset"),
  
  # Sidebar for providing configuration
  sidebarPanel(
    
    h1("Configuration"),
    
    #Select predictor from cyl, hp, wt, gear, carb
    h3("Select predictor for mileage"),
    
    selectInput(inputId="predictor",
                label="Predictor field",
                choices=c("Number of cylinders"="cyl",
                          "Gross Horsepower"="hp",
                          "Weight in lb/1000"="wt",
                          "Number of forward Gears"="gear",
                          "Number of Carburetors"="carb")),
    
    #Filter dataset by am=0,1 or both
    h3("Filter by transmission type"),
    
    radioButtons(inputId="amFilter",
                 label="Transmission type",
                 choices=c("Both"=2,"Automatic"=0,"Manual"=1)),
    
    submitButton(text="Submit")
  ),
  
  # Show a plot of the mileage variation with the selected predictor and filter
  mainPanel(
    h3(textOutput("label")),
    
    plotOutput("plot")
  )
))