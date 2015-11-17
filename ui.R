library(shiny)
library(markdown)

available_formats <- c(
    'Comma separated'  = 'csv',
    'Excel (>=2007)'   = 'xlsx',
    'JSON'             = 'json',
    'R'                = 'rds',
    'SAS (csv + .sas)' = 'sas7bdat', # just to avoid changing it in the future
    'SPSS'             = 'sav',
    'Stata'            = 'dta',
    'Tab separated'    = 'tsv'
)

shinyUI(fluidPage(sidebarLayout(

    sidebarPanel(fileInput('infile', label = NULL),
                 selectInput('output_format',
                             label = h3('Output format'), 
                             choices = available_formats,
                             size = length(available_formats)),
                 downloadButton('download_data', 'Download')
                 ),
                 
    mainPanel(includeMarkdown("README.md"))

)))
