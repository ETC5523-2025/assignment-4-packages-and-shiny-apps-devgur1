
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Exploring Australian Bushfire Data with R

<!-- badges: start -->

<!-- badges: end -->

**bushfiredataexplorer** is an R package that provides Australian
bushfire data and an interactive Shiny dashboard for visualising
fire-risk trends.  
It was created for *ETC5523: Communicating with Data* at Monash
University.

## Installation

We can install the development version of **bushfiredataexplorer**
from  
[GitHub](https://github.com/ETC5523-2025/assignment-4-packages-and-shiny-apps-devgur1)
with:

``` r
# install.packages("pak")
pak::pak("ETC5523-2025/assignment-4-packages-and-shiny-apps-devgur1")
# install.packages("remotes")
remotes::install_github("ETC5523-2025/assignment-4-packages-and-shiny-apps-devgur1")
```

Repo name: ETC5523-2025/assignment-4-packages-and-shiny-apps-devgur1

Package name: bushfiredataexplorer

After installation:

``` r
library(bushfiredataexplorer)
run_app()
```

This launches the Shiny app in the browser.

## Example

Here’s a quick example using the dataset included with the package:

``` r
library(bushfiredataexplorer)
data("a2_bushfire")

library(ggplot2)
ggplot(a2_bushfire, aes(year, FWI)) +
  geom_line(color = "#0072B2") +
  geom_smooth(method = "loess", se = FALSE, color = "#E69F00") +
  labs(title = "Fire Weather Index over time", x = "Year", y = "FWI")
```

<img src="man/figures/README-example-plot-1.png" width="100%" /> The
plot shows long-term changes in Fire Weather Index (FWI), a measure of
bushfire danger influenced by temperature, humidity, and wind speed.

## Documentation

Full documentation, data dictionary, and vignettes are available at:
<https://ETC5523-2025.github.io/assignment-4-packages-and-shiny-apps-devgur1/>
