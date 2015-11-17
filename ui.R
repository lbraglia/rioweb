library(shiny)
library(markdown)

available_formats <- c('Comma separated' = 'csv',
                       'Tab separated'   = 'tsv',
                       'Excel (>=2007)'  = 'xlsx',
                       'R'               = 'rds',
                       'Stata'           = 'dta',
                       'SPSS'            = 'sav',
                       'JSON'            = 'json'
                       )

shinyUI(fluidPage(sidebarLayout(

    sidebarPanel(fileInput('infile', label = NULL),
                 selectInput('output_format', label = h3('Output format'), 
                             choices = available_formats),
                 downloadButton('download_data', 'Download')
                 ),
                 
    mainPanel(includeMarkdown("README.md"))

)))
