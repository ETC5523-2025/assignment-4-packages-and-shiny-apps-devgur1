#' Launch the Shiny App for ETC5523 A4
#'
#' @description
#' Opens the Shiny app packaged under inst/app.
#'
#' @export
#' @importFrom shiny shinyAppFile
run_app <- function() {
  needed <- c("bslib", "ggplot2", "dplyr", "tibble", "shiny")
  missing <- needed[!vapply(needed, requireNamespace, logical(1), quietly = TRUE)]
  if (length(missing)) {
    stop(
      "Please install missing packages before running the app: ",
      paste(missing, collapse = ", "), call. = FALSE
    )
  }
  app_dir <- system.file("app", package = "assignment4packagesdevgur1")
  if (app_dir == "") stop("App directory not found; try reinstalling the package.")
  shiny::shinyAppFile(file.path(app_dir, "app.R"))
}
