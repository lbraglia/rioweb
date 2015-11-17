library(shiny)
library(markdown)

available_formats <- c('xlsx', 'rda', 'dta', 'sav')

shinyUI(fluidPage(sidebarLayout(

    sidebarPanel(fileInput('infile', label = NULL),
                 selectInput('output_format', label = h3('Output format'), 
                             choices = available_formats),
                 downloadButton('download_data', 'Download')
                 ),
                 
    mainPanel(includeMarkdown("README.md"))

)))
