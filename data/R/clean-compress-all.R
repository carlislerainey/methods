
# set working directory
setwd(here::here())

# clean and compress all data sets

## anes
source("data/R/clean-anes.R")

## parties
source("data/R/clean-parties.R")
rmarkdown::render("data/codebooks/parties-codebook.Rmd", 
                  output_format = "all")
rmarkdown::render("data/examples/example-parties.R")

## state governments
source("data/R/clean-state-governments.R")

# compress data sets
# source("data/R/compress-data.R")

# re-knit data-sources.Rmd
rmarkdown::render("data/data-sources.Rmd")


