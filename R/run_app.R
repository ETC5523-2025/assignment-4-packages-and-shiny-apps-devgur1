#' Launch the Shiny App
#'
#' Opens the interactive Bushfire Data Explorer in your browser.
#'
#' @return Invisibly returns \code{NULL}. Called for its side-effect of launching the app.
#' @examples
#' \dontrun{
#'   run_app()
#' }
#' @export
run_app <- function() {
  app_dir <- system.file("app", package = "bushfiredataexplorer")
  shiny::runApp(app_dir, launch.browser = TRUE)
}
