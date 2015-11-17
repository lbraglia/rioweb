library(rio)
library(shiny)
library(tools)
library(foreign)

make_sas <- function(x, file, filesnames){
    ## create the two files
    csv_file <- paste0(filesnames, '.csv')
    sas_file <- paste0(filesnames, '.sas')
    foreign::write.foreign(df = x,
                           datafile = csv_file,
                           codefile = sas_file,
                           package = 'SAS')
    ## now make the zip
    zip(zipfile = file, files = c(csv_file, sas_file))
}


shinyServer(
    function(input, output){

        output$download_data <- downloadHandler(
            filename = function() {
                name <- basename(file_path_sans_ext(input$infile$name))
                paste0(name, '.', {
                    # this block to get the real extension (handle sas)
                    if ('sas7bdat' == input$output_format)
                        'zip'
                    else
                        input$output_format
                })
            },
            content = function(file) {
                input_file <- input$infile
                input_file_format <- tools::file_ext(input_file$name)
                if (is.null(input_file))
                    return(NULL)
                else {
                    db <- rio::import(file = input_file$datapath,
                                      format = input_file_format)
                    if ('sas7bdat' != input$output_format)
                        rio::export(x = db,
                                    file = file,
                                    format = input$output_format)
                    else
                        make_sas(x = db,
                                 file = file,
                                 filesnames = basename(file_path_sans_ext(input$infile$name))
                                 )
                }
            }
        )
    }
)
