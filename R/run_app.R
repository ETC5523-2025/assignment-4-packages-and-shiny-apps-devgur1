#' Launch the Bushfire Data Explorer App
#'
#' @return A Shiny app object
#' @export
#' @examples
#' if (interactive()) {
#'   run_app()
#' }
run_app <- function() {
  shiny::shinyAppDir(system.file("app", package = "bushfiredataexplorer"))
}
