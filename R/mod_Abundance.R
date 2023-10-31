#' Abundance UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_Abundance_ui <- function(id){
  ns <- NS(id)
  tagList(
 
  )
}
    
#' Abundance Server Functions
#'
#' @noRd 
mod_Abundance_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_Abundance_ui("Abundance_1")
    
## To be copied in the server
# mod_Abundance_server("Abundance_1")
