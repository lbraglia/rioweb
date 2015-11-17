library(shiny)
library(rio)
library(tools)

shinyServer(
    function(input, output){

        output$imported_input_file <- {
            input_file <- input$infile
            input_file_format <- tools::file_ext(input_file$name)
            if (is.null(input_file))
                return(NULL)
            else
                import(file = input_file$datapath,
                       format = input_file_format)
        }

        output$downloadData <- downloadHandler(
            filename = function() {
                name <- basename(file_path_sans_ext(input$infile$name))
                paste0(name, '.', input$output_format)
            },
            content = function(file) {
                rio::export(x = output$imported_input_file,
                            file = file,
                            format = input$output_format)
            }
        )
        
    }
)
