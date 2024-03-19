#### Preamble ####
# Purpose: Models the relationship between voting preference and predictors such as gender and income using logistic regression, implemented with Bayesian methods via the rstanarm package.
# Author: Siqi Fei
# Date: 18 March 2024
# Author: Siqi Fei
# Date: 18 March 2024
# Contact: fermi.fei@mail.utoronto.ca
# License: MIT
# Pre-requisites: 'tidyverse' for data manipulation and 'rstanarm' for performing Bayesian regression.
# Any other information needed? Ensure the analysis_data.csv file is available in the 'data/analysis_data' directory and RStan is properly configured for use with rstanarm.
# To install the `rstanarm` package, if it doen't work via console or terminal, try to download directly from url to local and import the file to RStudio.

#### Workspace setup ####
library(tidyverse)
library(rstanarm)

#### Read data ####
# Reads the prepared analysis data from a CSV file.
analysis_data <- read_csv("data/analysis_data/analysis_data.csv")

### Model data ####
touch_score_poisson <-
  stan_glm(
    Score_x ~ Touches_x,
    data = analysis_data,
    family = poisson(link = "log"),
    seed = 853
  )

touch_score_neg_binomial <-
  stan_glm(
    Score_x ~ Touches_x,
    data = analysis_data,
    family = neg_binomial_2(link = "log"),
    seed = 853
  )


#### Save model ####
# Saves the fitted model object for future use.
saveRDS(
  touch_score_poisson,
  file = "models/poisson_scores.rds"
  )
saveRDS(
  touch_score_poisson,
  file = "models/neg_binomial_scores.rds"
  )