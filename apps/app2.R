datasetInput <- reactive({
  switch(input$dataset,
    "rock" = rock,
    "pressure" = pressure,
    "cars" = cars)
})

output$caption <- renderText({
  input$caption
})

output$summary <- renderPrint({
  dataset <- datasetInput()
  summary(dataset)
})

output$view <- renderTable({
  head(datasetInput(), n = input$obs)
})

outputOptions(output, "view", suspendWhenHidden = FALSE)