library(shiny)

sliderTextUI <- function(sliderId, textId){
  tagList(
    sliderInput(sliderId, "Slide Me", 0, 100, 1),
    textOutput(textId)
  )
}

ui <- fluidPage(
  sliderTextUI("slider1", "num1"),
  sliderTextUI("slider2", "num2")
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