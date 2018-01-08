
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

## progresa
source("data/R/clean-progresa.R")
rmarkdown::render("data/codebooks/progresa-codebook.Rmd", 
                  output_format = "all")
rmarkdown::render("data/examples/example-progresa.R")

## social-pressure
source("data/R/clean-social-pressure.R")
rmarkdown::render("data/codebooks/social-pressure-codebook.Rmd", 
                  output_format = "all")
rmarkdown::render("data/examples/example-social-pressure.R")

## state governments
source("data/R/clean-state-governments.R")

# compress data sets
# source("data/R/compress-data.R")

# re-knit data-sources.Rmd
rmarkdown::render("data/data-sources.Rmd")


