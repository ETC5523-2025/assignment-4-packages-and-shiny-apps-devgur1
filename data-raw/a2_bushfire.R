# Author: Dev Karan Gur

library(tibble)
set.seed(42)

years <- 1900:2020

a2_bushfire <- tibble(
  year = years,
  FWI = seq(10, 50, length.out = length(years)) + rnorm(length(years), 0, 2),
  TX7x = seq(30, 45, length.out = length(years)) + rnorm(length(years), 0, 1),
  Rain_mm = seq(600, 400, length.out = length(years)) + rnorm(length(years), 0, 20)
)

usethis::use_data(a2_bushfire, overwrite = TRUE)

