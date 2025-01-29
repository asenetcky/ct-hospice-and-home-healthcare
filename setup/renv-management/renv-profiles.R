# setup a profile for github actions

## gha profile -  initially for styler
renv::activate(profile = "gha")
renv::install("styler", dependencies = TRUE, prompt = FALSE)
styler::style_dir()
renv::snapshot()

## default - use the init renv setup
renv::activate(profile = "development")

### using pak because it plays better with Pop!_OS for me
options(renv.config.pak.enabled = TRUE)

### purrr first then walk the rest
renv::install("purrr", prompt = FALSE, lock = TRUE, dependencies = TRUE)

c(
  "dplyr",
  "ggplot2",
  "tidyr",
  "vetiver",
  "plumber",
  "RSocrata",
  # "duckdb",
  "nanoparquet",
  "httr2",
  "devtools",
  "styler",
  "DBI",
  "odbc",
  "dbplyr",
  "fs",
  "tidygeocoder",
  "sf",
  "leaflet",
  "mapview",
  "stringr",
  "tigris",
  "glue",
  "lubridate"
) |>
  purrr::walk(
    \(pkg) renv::install(pkg, dependencies = TRUE)
  )

renv::snapshot()
