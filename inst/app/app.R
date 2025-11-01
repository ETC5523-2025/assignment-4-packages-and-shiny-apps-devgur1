
# Author: Dev Karan Gur

library(shiny)
library(bslib)
library(dplyr)
library(ggplot2)

ui <- navbarPage(
  title = "Communicating with Data — Dev Karan Gur",
  theme = bs_theme(bootswatch = "flatly"),

  tabPanel("Bushfire Risk (A2)",
           sidebarLayout(
             sidebarPanel(
               helpText("Explore indicators that reflect bushfire risk."),
               selectInput("metric", "Metric:",
                           choices = c("FWI", "TX7x", "Rain_mm"), selected = "FWI"),
               sliderInput("year_rng", "Year range:", min = 1900, max = 2020,
                           value = c(1950, 2020), step = 1),
               hr(),
               tags$small(HTML(
                 "<b>Field meanings</b><br>
           <b>FWI</b>: Fire Weather Index (higher = more dangerous fire weather).<br>
           <b>TX7x</b>: 7-day running mean of daily max temperature (heat extremes).<br>
           <b>Rain_mm</b>: Annual rainfall (lower = drier fuels)."
               ))
             ),
             mainPanel(
               h4("Trend"),
               plotOutput("bf_plot"),
               h4("Summary"),
               tableOutput("bf_tbl"),
               hr(),
               tags$small(HTML(
                 "<b>How to interpret:</b> Upward trends in FWI and TX7x suggest increased
           fire-weather intensity; rainfall shows variability and a soft decline."
               ))
             )
           )
  ),

  tabPanel("Media Communication (A1)",
           fluidRow(
             column(12,
                    h4("How medium shapes the message"),
                    tableOutput("a1_tbl"),
                    hr(),
                    tags$small(HTML(
                      "<b>Reading guide:</b> Compare <i>lede style</i> and <i>evidence mode</i>
           across print/blog/video to see how the same idea is framed differently."
                    ))
             )
           )
  )
)

server <- function(input, output, session) {
  # Load packaged datasets into this app's environment
  utils::data("a2_bushfire", package = "assignment4packagesdevgur1", envir = environment())
  utils::data("a1_media",     package = "assignment4packagesdevgur1", envir = environment())

  data_bf <- a2_bushfire
  data_a1 <- a1_media

  filtered_bf <- reactive({
    dplyr::filter(data_bf,
                  dplyr::between(year, input$year_rng[1], input$year_rng[2]))
  })

  output$bf_plot <- renderPlot({
    df <- filtered_bf()
    ggplot(df, aes(year, .data[[input$metric]])) +
      geom_line() +
      geom_smooth(se = FALSE, method = "loess", span = 0.3) +
      labs(title = paste(input$metric, "over time"), x = NULL, y = input$metric) +
      theme_minimal(base_size = 13)
  })

  output$bf_tbl <- renderTable({
    df <- filtered_bf()
    tibble::tibble(
      Metric = input$metric,
      Mean   = mean(df[[input$metric]], na.rm = TRUE),
      Median = median(df[[input$metric]], na.rm = TRUE),
      N      = nrow(df)
    )
  })

  output$a1_tbl <- renderTable(data_a1)
}

# Return a shiny.appobj:
shinyApp(ui, server)
