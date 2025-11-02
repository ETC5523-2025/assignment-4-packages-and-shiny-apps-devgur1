# Author: Dev Karan Gur
# Title: Bushfire Data Explorer App
# Description:
#   This Shiny app allows users to interactively explore Australian bushfire data.
#   Users can select metrics and year ranges to visualise changes in Fire Weather Index,
#   Temperature, and Rainfall over time.

library(shiny)
library(bslib)
library(dplyr)
library(ggplot2)

# Load dataset
data("a2_bushfire", package = "assignment4packagesdevgur1")

# Define UI
ui <- navbarPage(
  title = "Communicating with Data – Dev Karan Gur",
  theme = bs_theme(bootswatch = "flatly"),

  tabPanel("Bushfire Risk (A2)",
           sidebarLayout(
             sidebarPanel(
               helpText("Explore indicators that reflect bushfire risk."),
               selectInput("metric", "Metric:",
                           choices = c("FWI", "TX7x", "Rain_mm"),
                           selected = "FWI"),
               sliderInput("year_rng", "Year range:",
                           min = 1900, max = 2020,
                           value = c(1950, 2020), step = 1),
               hr(),
               tags$small(HTML("<b>Field meanings:</b><br>
                         FWI = Fire Weather Index<br>
                         TX7x = Max temperature (°C)<br>
                         Rain_mm = Annual rainfall (mm)"))
             ),
             mainPanel(
               plotOutput("trendPlot"),
               hr(),
               textOutput("descText")
             )
           )
  )
)

# Define server logic
server <- function(input, output, session) {

  # Filter dataset based on user input
  filtered_data <- reactive({
    a2_bushfire %>%
      filter(year >= input$year_rng[1], year <= input$year_rng[2])
  })

  # Create trend plot
  output$trendPlot <- renderPlot({
    ggplot(filtered_data(), aes(x = year, y = .data[[input$metric]])) +
      geom_line(color = "#0072B2", size = 1) +
      geom_smooth(method = "loess", se = FALSE, color = "#E69F00") +
      labs(
        x = "Year",
        y = input$metric,
        title = paste("Trend of", input$metric, "from", input$year_rng[1], "to", input$year_rng[2])
      ) +
      theme_minimal(base_size = 14)
  })

  # Description text
  output$descText <- renderText({
    metric <- input$metric
    paste(
      "This graph visualises changes in",
      metric, "over time. The smoothed line shows general long-term trends.",
      if (metric == "FWI") "Higher values indicate increased bushfire risk."
      else if (metric == "TX7x") "Higher values indicate hotter temperature extremes."
      else "Higher values indicate greater annual rainfall, which may reduce fire severity."
    )
  })
}

# Run the app
shinyApp(ui = ui, server = server)
