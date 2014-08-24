# This is the user-interface definition of Mileage Variation Application
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Mileage Variation in Cars"),
  
  # Sidebar for providing configuration
  sidebarPanel(
    
    HTML("<em><strong>Mileage variation for cars in mtcars dataset<br/>
         For a selected predictor variable and a filter on transmission type.</strong></em>"),  
    
    HTML("<br/><br/>"),
    h4("Select predictor for mileage"),
    
    #Select predictor from cyl, hp, wt, gear, carb
    selectInput(inputId="predictor",
                label="",
                choices=c("Number of cylinders"="cyl",
                          "Gross Horsepower"="hp",
                          "Weight in lb/1000"="wt",
                          "Number of forward Gears"="gear",
                          "Number of Carburetors"="carb")),
    
    HTML("<br/>"),
    h4("Filter data by transmission type"),
    
    #Filter dataset by am=0,1 or both
    radioButtons(inputId="amFilter",
                 label="",
                 choices=c("Both"=2,"Automatic"=0,"Manual"=1)),
    
    submitButton(text="Submit")
  ),
  
  # Show a plot of the mileage variation with the selected predictor and filter
  mainPanel(
    h3(textOutput("label")),
    
    plotOutput("plot")
  )
))