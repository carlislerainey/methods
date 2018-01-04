
#' ---
#' title: "An Example with the `parties` Data Set"
#' author: "Carlisle"
#' ---

# set working directory
setwd(here::here())

# load packages
library(tidyverse)
library(rio)

# load data
parties_df <- import("data/parties.rds") 

# quick look
glimpse(parties_df)

# scatterplot of eneg and enep by electoral system
ggplot(parties_df, aes(x = eneg, y = enep)) + 
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE) + 
  facet_wrap(~ electoral_system)
