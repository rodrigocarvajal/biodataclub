library(shiny)

ui <- fluidPage(
  sliderInput("slider", "Slide Me", 0, 100, 1),
  textOutput("num")
)

server <- function(input, output, session){
  output$num <- renderText({
    input$slider
    })
}

shinyApp(ui = ui, server = server)