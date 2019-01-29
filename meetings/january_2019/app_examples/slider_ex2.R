library(shiny)

sliderUI <- function(){
  sliderInput("slider", "Slide Me", 0, 100, 1)
}

ui <- fluidPage(
  sliderUI(),
  textOutput("num")
)

server <- function(input, output, session){
  output$num <- renderText({
    input$slider
  })
}

shinyApp(ui = ui, server = server)