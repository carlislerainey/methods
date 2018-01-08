
# load packages
library(tidyverse)
library(magrittr)
library(haven)
library(rio)
library(forcats)

# set working directory
setwd(here::here())

# read raw data
df_raw <- read_dta("data/raw-data/DeLaO_AJPS2013_rep_file.dta") %>%
  glimpse()

df <- df_raw %>%
  select(condition = treatment, 
         turnout = t2000) %>%
  mutate(condition = ifelse(condition == 1, "Early Implementation",
                            ifelse(condition == 0, "Late Implementation", NA))) %>%
  glimpse()

# write files
filepath <- "data/progresa"
source("data/R/create-extensions.R")
for (i in 1:length(extensions)) {
  extension_i <- paste0(filepath, extensions[i])
  export(df, extension_i)
}
                     