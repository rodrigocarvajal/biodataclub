library(shiny)

# module ui
sliderTextUI <- function(id){
  ns <- NS(id) 
  
  tagList(
    sliderInput(ns("slider"), "Slide Me", 0, 100, 1),
    textOutput(ns("number"))
  )
}

# module server
sliderText <- function(input, output, session){ 
  output$number <- renderText({
    input$slider
  })
}

ui <- fluidPage(
  sliderTextUI("one"),
  sliderTextUI("two")
)

server <- function(input, output){
  callModule(sliderText, "one")
  callModule(sliderText, "two")
  
}

shinyApp(ui = ui, server = server)