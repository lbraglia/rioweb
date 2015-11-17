library(shiny)
library(markdown)

available_formats <- c('dta', 'sav', 'xlsx')

shinyUI(fluidPage(
    titlePanel("rioweb"),
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
            tableOutput('imported_input_file')
        )
    ),
    fluidRow(
        includeMarkdown("NOTES.md")
    )
    
))

