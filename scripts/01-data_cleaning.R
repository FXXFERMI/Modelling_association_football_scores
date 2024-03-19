#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers to prepare for analysis. This includes filtering observations, recoding variables, and selecting relevant data.
# Author: Siqi Fei
# Date: 18 March 2024 
# Contact: fermi.fei@mail.utoronto.ca
# License: MIT
# Pre-requisites: The 'tidyverse' package, specifically for data manipulation and writing the cleaned data to a new CSV file.
# Any other information needed? Make sure the raw data file is located at 'data/raw_data/raw_data.csv' before running this script.

#### Workspace setup ####
library(tidyverse)
library(here)
#### Clean data ####
# Load the raw data from a CSV file.
raw_score <- read_csv("data/raw_data/Bundesliga_2023-2024.csv")

# Clean and prepare the data for analysis.
cleaned_score <- na.omit(raw_score)
cleaned_score <- select(cleaned_score, Home, Score_x, Touches_x)

#### Save data ####
write_csv(cleaned_score, "data/analysis_data/analysis_data.csv") 
