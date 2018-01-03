
# load packages
library(tidyverse)
library(magrittr)
library(readxl)
library(rio)

# set working directory
setwd(here::here())

# create list of files with extensions
# note: in practice, this should be the final, cleaned data sets
#       but this is not true in general.
files_df <- data_frame(file = list.files(path = "data", pattern = "\\.")) %>%
  # create separate variables for the name of the data set and the file type.
  separate(col = file, 
           into = c("data_set", "file_type"), 
           sep = "\\.", 
           remove = FALSE) %>%
  filter(file_type != "Rmd") %>%
  filter(file_type != "pdf") %>%
  glimpse() 

# compress data (all file types)
zip("data/compressed-data/data.zip", files = paste0("data/", files_df$file))

# create separate zip files for each file type
file_types <- unique(files_df$file_type)
for (i in 1:length(file_types)) {
  files_df_i <- filter(files_df, file_type == file_types[i])
  zip(zipfile = paste0("data/compressed-data/data-", file_types[i], ".zip"), 
      files = paste0("data/", files_df_i$file))
}
