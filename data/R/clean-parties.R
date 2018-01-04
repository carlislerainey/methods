
# load packages
library(tidyverse)
library(magrittr)
library(haven)
library(rio)
library(forcats)

# set working directory
setwd(here::here())

# read raw data
d <- read_dta("data/raw-data/Legislative_new.dta") %>%
  glimpse()

# delete cases following Clark and Golder's .do file
# note: I borrowed this code from an old replication script of mine, so it is 
#       not tidyversed
## no recognizable parties
d <- d[d$countrynumber != 163, ]
d <- d[d$countrynumber != 165, ]
d <- d[d$countrynumber != 197, ]
d <- d[d$countrynumber != 189, ]
d <- d[d$countrynumber != 146, ]
d <- d[d$countrynumber != 198, ]
d <- d[d$countrynumber != 167, ]
d <- d[!(d$countrynumber == 70 & d$year == 1958), ]
d <- d[!(d$countrynumber == 70 & d$year == 1960), ]
d <- d[!(d$countrynumber == 70 & d$year == 1962), ]
d <- d[!(d$countrynumber == 70 & d$year == 1964), ]
d <- d[!(d$countrynumber == 70 & d$year == 1966), ]
d <- d[!(d$countrynumber == 70 & d$year == 1968), ]
d <- d[!(d$countrynumber == 70 & d$year == 1970), ]
d <- d[!(d$countrynumber == 12 & d$year == 1963), ]
## drop fused votes
d <- d[d$countrynumber != 67, ]
d <- d[d$countrynumber != 76, ]
d <- d[!(d$countrynumber == 59 & d$year == 1957), ]
d <- d[!(d$countrynumber == 59 & d$year == 1971), ]
d <- d[!(d$countrynumber == 59 & d$year == 1985), ]
d <- d[!(d$countrynumber == 59 & d$year == 1989), ]
d <- d[!(d$countrynumber == 59 & d$year == 1993), ]
d <- d[!(d$countrynumber == 57 & d$year == 1990), ]
d <- d[!(d$countrynumber == 54 & d$year == 1966), ]
d <- d[!(d$countrynumber == 54 & d$year == 1970), ]
d <- d[!(d$countrynumber == 54 & d$year == 1974), ]
d <- d[!(d$countrynumber == 54 & d$year == 1986), ]
## drop countries with large "others"
d <- d[!(d$enep_others > 15 & d$enep_others < 100), ]
## drop countries with majoritarian uppers
d <- d[d$countrynumber != 132, ]
d <- d[d$countrynumber != 29, ]
d <- d[!(d$countrynumber == 87 & d$year == 1988), ]
d <- d[!(d$countrynumber == 87 & d$year == 1992), ]
d <- d[!(d$countrynumber == 87 & d$year == 1996), ]
d <- d[!(d$countrynumber == 116 & d$year == 1987), ]
d <- d[!(d$countrynumber == 116 & d$year == 1996), ]

# clean up data set
df <- d %>%
  # keep only variables of interest
  select(country, year, average_magnitude = avemag, eneg, enep = enep1, enlp = enpp1) %>%
  # create factor variable with electoral system
  mutate(electoral_system = cut(x = average_magnitude, 
                                breaks = c(-Inf, 1, 7, Inf),
                                labels = c(c("Single-Member District",
                                             "Small-Magnitude PR",
                                             "Large-Magnitude PR")))) %>%
  na.omit() %>%
  glimpse()

# write files
filepath <- "data/parties"
source("data/R/create-extensions.R")
for (i in 1:length(extensions)) {
  extension_i <- paste0(filepath, extensions[i])
  export(df, extension_i)
}
