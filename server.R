## --------
## server.R
## --------

library(rio)
library(shiny)
library(tools)

shinyServer(
    function(input, output){

        output$download_data <- downloadHandler(
            filename = function() {
                name <- basename(file_path_sans_ext(input$infile$name))
                paste0(name, '.', input$output_format)
            },
            content = function(file) {
                input_file <- input$infile
                input_file_format <- tools::file_ext(input_file$name)
                if (is.null(input_file))
                    return(NULL)
                else {
                    db <- rio::import(file = input_file$datapath,
                                      format = input_file_format)
                    rio::export(x = db,
                                file = file,
                                format = input$output_format)
                }
            }
        )
    }
)
