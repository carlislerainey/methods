
# load packages
library(tidyverse)
library(magrittr)
library(readxl)
library(rio)
library(forcats)

# set working directory
setwd(here::here())

# load ggl's replication data from https://isps.yale.edu/research/data/d001
raw_df <- read_csv("data/raw-data/GerberGreenLarimer_APSR_2008_social_pressure.csv") 

# clean data
df <- raw_df %>%
  select(treatment, voted) %>%
  mutate(treatment = factor(treatment, levels = c("Control", 
                                                  "Civic Duty", 
                                                  "Hawthorne", 
                                                  "Self", 
                                                  "Neighbors"))) %>%
  group_by(treatment) %>%
  summarize(number_in_condition = n(), 
            number_that_voted = sum(voted == "Yes")) %>%
  rename(condition = treatment) %>%
  glimpse()

# write files
filepath <- "data/social-pressure"
source("data/R/create-extensions.R")
for (i in 1:length(extensions)) {
  extension_i <- paste0(filepath, extensions[i])
  export(df, extension_i)
}

