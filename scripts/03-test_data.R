#### Preamble ####
# Purpose: Tests the integrity and consistency of analysis dataset.
# Author: Siqi Fei
# Date: 18 March 2024 
# Contact: fermi.fei@mail.utoronto.ca
# License: MIT
# Pre-requisites: The 'tidyverse' for data manipulation, 'testthat' for unit testing, and 'here' for path handling.
# Any other information needed? Ensure the 'analysis_data.csv' file exists within the 'data/analysis_data' directory.

#### Workspace setup ####
library(testthat)
library(tidyverse)
library(here)

analysis_data <- read_csv(here("data/analysis_data/analysis_data.csv"))

#### Test data ####

# Test that raw data has been loaded
test_that("Raw data is loaded", {
  expect_s3_class(analysis_data, "spec_tbl_df")
  expect_true(nrow(analysis_data) > 0)
})

# Test that there are no N/A values
test_that("No NA values in cleaned data", {
  expect_equal(sum(is.na(analysis_data)), 0)
})

# Test that only specified columns are present
test_that("Only specified columns are present", {
  expected_cols <- c("Home", "Score_x", "Touches_x")
  expect_equal(colnames(analysis_data), expected_cols)
})

# Test that the cleaned data has been saved
test_that("Cleaned data is saved", {
  expect_true(file.exists(here("data/analysis_data/analysis_data.csv")))
})

