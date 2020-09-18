library(shiny)

sliderUI <- function(){
  sliderInput("slider", "Slide Me", 0, 100, 1)
}

ui <- fluidPage(
  sliderUI(),
  textOutput("num1"),
  sliderUI(),
  textOutput("num2")
)

server <- function(input, output, session){
  output$num1 <- renderText({
    input$slider
  })
  
  output$num2 <- renderText({
    input$slider
  })
  
}

shinyApp(ui = ui, server = server)