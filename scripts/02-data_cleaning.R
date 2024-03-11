#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(arrow)
library(tidyr)

#### Clean data ####
raw_data <- read_csv("data/raw_data/ces2020.csv")

cleaned_data <-
  raw_data |>
  filter(votereg == 1) |>
  filter(CC20_410 == 1 | CC20_410 == 2) |>
  rename(birthyear = birthyr,
  ) |>
  mutate(
    voted_for = if_else(CC20_410 == 1, "Biden", "Trump"),
    generation = case_when(
      between(birthyear, 1928, 1945) ~ "Silent Generation",
      between(birthyear, 1946, 1964) ~ "Baby Boomer",
      between(birthyear, 1965, 1980) ~ "Generation X",
      between(birthyear, 1981, 1996) ~ "Millennial",
      between(birthyear, 1997, 2012) ~ "Generation Z"
    ),
    gender = if_else(gender == 1, "Male", "Female")
  ) |>
  select(-votereg, -CC20_410) |>
  drop_na()



#### Save data ####
write_csv(cleaned_data, "data/analysis_data/cleaned_data.csv")
write_parquet(cleaned_data, "data/analysis_data/cleaned_data.parquet")
