#### Preamble ####
# Purpose: Simulates Post-Election survey of voters
# Author: Hritik Shukla
# Date: 12 March 2024 
# Contact: hritik.shukla@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
set.seed(853)

num_obs <- 1000

#### Simulate data ####

us_political_preferences <- tibble(
  generation = sample(0:4, size = num_obs, replace = TRUE),
  gender = sample(0:1, size = num_obs, replace = TRUE),
  support_prob = ((generation + gender) / 2),
) |>
  mutate(
    supports_biden = if_else(runif(n = num_obs) < support_prob, "yes", "no"),
    generation = case_when(
      generation == 0 ~ "Silent Generation",
      generation == 1 ~ "Baby boomer",
      generation == 2 ~ "Generation X",
      generation == 3 ~ "Millenial",
      generation == 4 ~ "Generation Z"
    ),
    gender = if_else(gender == 0, "Male", "Female")
  ) |>
  select(-support_prob, supports_biden, gender, generation)



