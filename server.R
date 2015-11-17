library(shiny)
library(rio)
    
shinyServer(
    function(input, output){

        output$imported_input_file <- renderTable({

            input_file <- input$file
            
            if (is.null(inFile))
                return(NULL)
            else
                rio::import(input_file$datapath)
        })
    }
)
