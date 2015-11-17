library(shiny)
library(markdown)

available_formats <- c('', 'rda', 'dta', 'sav', 'xlsx')

shinyUI(fluidPage(
    titlePanel("rioweb"),
    sidebarLayout(
        sidebarPanel(
            fileInput('infile'),
            selectInput('output_format',
                        label = h3('Output format'),
                        choices = available_formats),
            downloadButton('downloadData', 'Download')
        )## ,
        
        ## mainPanel(tableOutput('imported_input_file') )
    ),
    fluidRow(includeMarkdown("NOTES.md") )
    
))

