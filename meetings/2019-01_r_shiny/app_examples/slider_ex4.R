library(shiny)

sliderUI <- function(id){
  sliderInput(id, "Slide Me", 0, 100, 1)
}

ui <- fluidPage(
  sliderUI("slider1"),
  textOutput("num1"),
  sliderUI("slider2"),
  textOutput("num2")
)

server <- function(input, output, session){
  output$num1 <- renderText({
    input$slider1
  })
  
  output$num2 <- renderText({
    input$slider2
  })
  
}

shinyApp(ui = ui, server = server)