
# load packages
library(tidyverse)
library(magrittr)
library(readxl)
library(rio)

# set working directory
setwd(here::here())

# load klarners raw data
# note: available at http://hdl.handle.net/1902.1/20403
raw_df <- read_excel("data/raw-data/Partisan_Balance_For_Use2011_06_09b.xlsx") %>%
  glimpse()

df <- raw_df %>%
  # create character vectors rather than dummies
  mutate(governor = ifelse(govparty_c == 0, "Republican", 
                           ifelse(govparty_c == 1, "Democrat", "Non-Major Party")),
         house = ifelse(hs_cont_alt == 0, "Republican", 
                        ifelse(hs_cont_alt == 1, "Democrat", "Split")),
         senate = ifelse(sen_cont_alt == 0, "Republican", 
                         ifelse(sen_cont_alt == 1, "Democrat", "Split"))) %>%
  # convert character vectors to ordered factors
  mutate(governor = factor(governor, levels = c("Democrat", 
                                                "Republican",
                                                "Non-Major Party")),
         house = factor(house, levels = c("Democrat", 
                                          "Republican",
                                          "Split")),
         senate = factor(senate, levels = c("Democrat", 
                                            "Republican",
                                            "Split"))) %>%
  # select variables of interest
  select(state, year, governor, house, senate) %>%
  # keep 1951-2011 for fewest missing
  filter(year >= 1951 & year <= 2011) %>%
  # drop Nebraska, which has no observations for house and senate
  filter(state != "Nebraska") %>%
  glimpse()

# write files
filepath <- "data/state-governments"
source("data/R/create-extensions.R")
for (i in 1:length(extensions)) {
  extension_i <- paste0(filepath, extensions[i])
  export(df, extension_i)
}






