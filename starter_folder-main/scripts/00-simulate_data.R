#### Preamble ####
# Purpose: Simulata data
# Author: Yuehan Dai
# Date: 27 September 2024
# Contact: dannie.dai@mail.utoronto.ca

# Load required libraries
library(dplyr)
library(ggplot2)

# Set seed for reproducibility
set.seed(123)

# Create the 'data' directory if it doesn't exist
if (!dir.exists("data")) {
  dir.create("data")
}

# Simulate the dataset
n <- 1000  # Number of data points
years <- sample(2007:2023, n, replace = TRUE)
ages <- rnorm(n, mean = 50, sd = 15)
causes_of_death <- sample(c("Overdose", "Natural causes", "Accident", "Unknown"), n, replace = TRUE)

# Create a simulated data frame
simulated_data <- data.frame(
  year = years,
  age = round(ages),
  cause_of_death = causes_of_death
)

# View the first few rows of the simulated data
head(simulated_data)

# Save the simulated data
write.csv(simulated_data, "data/simulated_data.csv", row.names = FALSE)
