
# load packages
library(tidyverse)
library(magrittr)
library(readxl)
library(rio)
library(haven)
library(forcats)

# set working directory
setwd(here::here())

# load raw 2016 anes
raw_df <- read_dta("data/raw-data/anes_timeseries_2016.dta")

df <- raw_df %>%
  # choose variables of interest
  select(mode = V160501,
         age = V161267,
         sex = V161002,
         ideology = V161126,
         party_id = V161155,
         health = V161115,
         health_insurance = V161112,
         aca_opinion = V161113) %>%
  # recode variables
  mutate(mode = fct_recode(factor(mode), 
                           `FTF/CASI` = "1",
                           `Web` = "2"),
         age = ifelse(age == -9, NA, age),
         sex = fct_recode(factor(sex),
                          `Male` = "1",
                          `Female` = "2"),
         ideology = ifelse(ideology %in% c(-8, -9), NA, ideology),
         ideology = fct_recode(factor(ideology),
                               `Extremely Liberal` = "1",
                               `Liberal` = "2",
                               `Slightly Liberal` = "3",
                               `Extremely Conservative` = "7",
                               `Conservative` = "6",
                               `Slightly Conservative` = "5",
                               `Moderate` = "4",
                               `Not Sure` = "99"),
         party_id = ifelse(party_id %in% c(-8, -9), NA, party_id),
         party_id = fct_recode(factor(party_id),
                               `No Preference` = "0",
                               `Democrat` = "1",
                               `Republican` = "2",
                               `Independent` = "3",
                               `Other Party` = "5"),
         health = ifelse(health == -9, NA, health),
         health = fct_recode(factor(health),
                               `Excellent` = "1",
                               `Very Good` = "2",
                               `Good` = "3",
                               `Fair` = "4",
                               `Poor` = "5"),
         health_insurance = ifelse(health_insurance %in% c(-8, -9), NA, health_insurance),
         health_insurance = fct_recode(factor(health_insurance),
                             `Has Health Insurance` = "1",
                             `Does Not Have Health Insurance` = "2"),
         aca_opinion = ifelse(aca_opinion == -8, NA, aca_opinion),
         aca_opinion = fct_recode(factor(aca_opinion),
                             `Favor` = "1",
                             `Oppose` = "2",
                             `Neither Favor Nor Oppose` = "3")) %>%
  # only include ftf interviews
  filter(mode == "FTF/CASI") %>% select(-mode) %>%
  glimpse()

# write files
filepath <- "data/anes"
source("data/R/create-extensions.R")
for (i in 1:length(extensions)) {
  extension_i <- paste0(filepath, extensions[i])
  export(df, extension_i)
}
