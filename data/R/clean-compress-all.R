
# set working directory
setwd(here::here())

# clean and compress all data sets
source("data/R/clean-anes.R")
source("data/R/clean-state-governments.R")
# source("data/R/compress-data.R")

# re-knit data-sources.Rmd
rmarkdown::render("data/data-sources.Rmd")
