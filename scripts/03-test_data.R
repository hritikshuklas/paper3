#### Preamble ####
# Purpose: Tests... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


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
