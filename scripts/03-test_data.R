#### Preamble ####
# Purpose: Tests cleaned data
# Author: Hritik Shukla
# Date: 12 March 2024 
# Contact: hritik.shukla@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(dplyr)

#### Test data ####
# Check if no entry contains NULL
# Returns TRUE  if no entries are NULL
#         FALSE if at least one entry is NULL
analysis_data = read.csv("data/analysis_data/cleaned_data.csv")

stopifnot(
  !(any(is.null(analysis_data))),
  !(any(is.na(analysis_data))),
  all(is.numeric(analysis_data$birthyear)),
  all(between(analysis_data$birthyear, 1928, 2012)),
  all(analysis_data$gender %in% c("Male", "Female")),
  all(analysis_data$generation %in% c("Silent Generation", "Baby Boomer", "Generation X", "Millennial", "Generation Z"))
)
