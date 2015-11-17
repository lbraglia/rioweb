library(shiny)

available_formats <- c('dta', 'sav')

shinyUI(fluidPage(
    titlePanel("File upload"),
    sidebarLayout(
        sidebarPanel(
            fileInput('file', 'Choose File'),
            ## tags$hr(),
            selectInput('output_format',
                        label = h3('Output format'),
                        choices = available_formats)
            ## tags$hr()
        ),
        mainPanel(
            ## tableOutput('contents')
        )
    )
))

