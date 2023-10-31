#' DNA_expression UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList


mod_DNA_expression_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      column(8, uiOutput(ns("DNA"))),
      column(4, numericInput(
        inputId = ns("DNA_len"),
        value = 6000,
        min = 3,
        max = 100000,
        step = 3,
        label = "Random DNA length"
      ),
      actionButton(
        inputId = ns("generate_dna"),
        label = "Generate random DNA", style = "margin-top: 18px;"
      ))
    ),
    verbatimTextOutput(outputId = ns("peptide")) |>
    tagAppendAttributes(style = "white-space: pre-wrap;")

  )
}
#' DNA_expression Server Functions
#'
#'@importfrom ggplot2 theme
#'@import Centraldogmabio
#' @noRd
mod_DNA_expression_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    dna <- reactiveVal()
    output$DNA <- renderUI({
      textAreaInput(
        inputId = ns("DNA"),
        label = "DNA sequence",
        placeholder = "Insert DNA sequence",
        value = dna(),
        height = 100,
        width = 600
      )
    })

  observeEvent(input$generate_dna, {
    dna(
      Centraldogmabio::generate_rand_DNA(input$DNA_len)
    )
  })
  output$peptide <- renderText({
    # Ensure input is not NULL and is longer than 2 characters
    if(is.null(dna())){
      NULL
    } else if(nchar(dna()) < 3){
      NULL
    } else{
      dna() |>
        toupper() |>
        Centraldogmabio::dna_to_rna() |>
        Centraldogmabio::generate_codon() |>
        Centraldogmabio::codon_to_aa()
    }
  })
  })
}

## To be copied in the UI
# mod_DNA_expression_ui("DNA_expression_1")

## To be copied in the server
# mod_DNA_expression_server("DNA_expression_1")
