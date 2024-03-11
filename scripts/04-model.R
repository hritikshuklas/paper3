#### Preamble ####
# Purpose: Models... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(arrow)

#### Read data ####
analysis_data <- read_parquet("data/analysis_data/cleaned_data.parquet")

set.seed(853)
### Model data ####

analysis_data <- analysis_data |>
  mutate(
    voted_for = factor(
      voted_for,
      levels = c("Biden", "Trump")
    ),
    gender = as_factor(gender),
    generation = factor(
      generation,
      levels = c(
        "Silent Generation",
        "Baby Boomer",
        "Generation X",
        "Millennial",
        "Generation Z"
      )
    )
  )
generation_gender_model <-
  stan_glm(
    formula = voted_for ~ generation + gender,
    data = analysis_data,
    family = binomial(link="logit"),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 853
  )


#### Save model ####
saveRDS(
  generation_gender_model,
  file = "models/generation_gender_model.rds"
)


