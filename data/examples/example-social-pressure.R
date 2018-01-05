
#' ---
#' title: "An Example with the `social-pressure` Data Set"
#' author: "Carlisle"
#' ---

# set working directory
setwd(here::here())

# load packages
library(tidyverse)
library(rio)

# load data
sp_df <- import("data/social-pressure.rds") 

# quick look
glimpse(sp_df)

# calculate proportion of each treatment that voted
sp_df$proportion <- sp_df$number_that_voted/sp_df$number_in_condition

# print result
sp_df

# scatterplot of eneg and enep by electoral system
ggplot(sp_df, aes(x = proportion, y = condition)) + 
  geom_point()
