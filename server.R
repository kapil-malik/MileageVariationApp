# This is the server logic for Mileage Variation Application
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

#Load shiny and qplot library, and mtcars data
library(shiny)
library(ggplot2)
data(mtcars)

shinyServer(function(input, output) {
  
  #Filter the mtcars dataframe for transmission type
  df <- reactive({
    if(input$amFilter==0 || input$amFilter==1) {
      mtcars[mtcars$am==input$amFilter,]
    } else {
      mtcars
    }
  });
  
  #Create y axis vector (mileage)
  mileage <- reactive({
    df()$mpg
  });
  
  #Create x axis vector (predictor)
  predictor <- reactive({
    df()[,input$predictor]
  });
  
  #Output label
  output$label <- renderText({
    if (input$amFilter==2) {
      paste("Variation of mileage with ",input$predictor)
    } else if(input$amFilter==0) {
      paste("Variation of mileage with ",input$predictor,", filtered on automatic transmission")
    } else if(input$amFilter==1) {
      paste("Variation of mileage with ",input$predictor,", filtered on manual transmission")
    }
  })
  
  #Output plot
  output$plot <- renderPlot({
    
    # generate plot 
    qplot(predictor(), 
          mileage(),
          xlab=input$predictor,
          ylab="mpg",
          main=paste(input$predictor," vs mpg"))+geom_smooth(method='lm')    
  })
  
})