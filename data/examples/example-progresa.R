
#' ---
#' title: "An Example with the `progresa` Data Set"
#' author: "Carlisle"
#' ---

# set working directory
setwd(here::here())

# load packages
library(tidyverse)
library(rio)

# load data
progresa_df <- import("data/progresa.rds")

# quick look at data
glimpse(progresa_df)

# histogram
ggplot(progresa_df, aes(x = turnout, y = ..density..)) + 
  geom_histogram() +
  facet_wrap(~ condition) +
  scale_x_continuous(labels = scales::percent)

# table of avg. and median
smry_df <- group_by(progresa_df, condition) %>%
  summarize(avg = mean(turnout, na.rm = TRUE),
            median = median(turnout, na.rm = TRUE))
smry_df

# box and whiskers plot
ggplot(progresa_df, aes(x = condition, y = turnout)) + 
  geom_boxplot()
