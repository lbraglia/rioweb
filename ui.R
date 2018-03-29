## -----
## ui.R
## -----

library(shiny)
library(markdown)

available_formats <- c(
    'Comma separated'   = 'csv',
    'Excel (>=2007)'    = 'xlsx',
    'JSON'              = 'json',
    'R'                 = 'rds',
    'SAS (sas7bdat)'    = 'sas7bdat',
    'SAS (.csv + .sas)' = 'sas_plus_csv',
    'SPSS'              = 'sav',
    'Stata'             = 'dta',
    'Tab separated'     = 'tsv'
)

shinyUI(fluidPage(sidebarLayout(

    sidebarPanel(fileInput('infile', label = NULL),
                 selectInput('output_format',
                             label = h3('Output format'), 
                             choices = available_formats,
                             selectize = FALSE,
                             size = length(available_formats)),
                 downloadButton('download_data', 'Download')
                 ),
                 
    mainPanel(includeMarkdown("README.md"))

)))
