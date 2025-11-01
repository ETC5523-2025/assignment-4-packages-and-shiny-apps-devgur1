# assignment4packagesdevgur1


<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- badges: start -->

<!-- badges: end -->

The goal of this package is to provide an interactive way to explore and
communicate insights from the Australian Bushfire dataset used in
earlier assignments for ETC5523. It combines data, analysis functions,
and a Shiny dashboard to help users visualise bushfire trends and
understand key relationships between fire weather, temperature
anomalies, and geographic regions.

## Features

- Contains the dataset a2_bushfire as an .rda object

- Includes preprocessing and cleaning scripts inside data-raw/

- Provides a Shiny app (inst/app/app.R) for interactive visualisation

- Includes documentation generated with roxygen2

- Fully installable as an R package and deployable with pkgdown

## Installation

You can install the development version of assignment4packagesdevgur1
from [GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("ETC5523-2025/assignment-4-packages-and-shiny-apps-devgur1")
#> ℹ Loading metadata database
#> ✔ Loading metadata database ... done
#> 
#> 
#> ℹ No downloads are needed
#> ✔ 1 pkg + 29 deps: kept 27 [4.4s]
```

After installation, you can load the package and launch the app:

``` r
library(assignment4packagesdevgur1)
run_app()
#> Loading required package: shiny
#> 
#> Attaching package: 'bslib'
#> The following object is masked from 'package:utils':
#> 
#>     page
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
```

<div style="width: 100% ; height: 400px ; text-align: center; box-sizing: border-box; -moz-box-sizing: border-box; -webkit-box-sizing: border-box;" class="muted well">Shiny applications not supported in static R Markdown documents</div>

This will open the Shiny app in your browser.

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(assignment4packagesdevgur1)

# Load the bushfire dataset
data("a2_bushfire")

# Display summary
summary(a2_bushfire)
#>       year           FWI              TX7x          Rain_mm     
#>  Min.   :1900   Min.   : 9.204   Min.   :28.53   Min.   :373.5  
#>  1st Qu.:1930   1st Qu.:20.096   1st Qu.:33.66   1st Qu.:448.6  
#>  Median :1960   Median :30.236   Median :37.54   Median :500.8  
#>  Mean   :1960   Mean   :30.034   Mean   :37.41   Mean   :499.4  
#>  3rd Qu.:1990   3rd Qu.:39.692   3rd Qu.:41.44   3rd Qu.:556.2  
#>  Max.   :2020   Max.   :54.404   Max.   :46.00   Max.   :636.0
```

## The Shiny App

The interactive dashboard allows you to:

- Select regions or years to explore bushfire data

- Visualise key trends in temperature, rainfall, and fire severity

- Interpret results through descriptive text panels

To run it directly:

``` r
assignment4packagesdevgur1::run_app()
```

<div style="width: 100% ; height: 400px ; text-align: center; box-sizing: border-box; -moz-box-sizing: border-box; -webkit-box-sizing: border-box;" class="muted well">Shiny applications not supported in static R Markdown documents</div>

## pkgdown Site

A complete documentation website (functions, data, vignette, and app
details) is available at:
https://ETC5523-2025.github.io/assignment-4-packages-and-shiny-apps-devgur1

## License

This package is licensed under the MIT License.

## Author

Dev Karan Gur Monash University – ETC5523: Communicating with Data
Semester 2, 2025
