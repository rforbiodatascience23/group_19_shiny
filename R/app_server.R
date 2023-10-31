#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  mod_abundance_server("Abundance")
  mod_DNA_expression_server("DNA_expression_1")
  # Your application server logic
}
is

