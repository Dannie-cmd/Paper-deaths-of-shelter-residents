#### Preamble ####
# Purpose: Downloads and saves the data from https://open.toronto.ca/dataset/deaths-of-shelter-residents/
# Author: Yuehan Dai
# Date: 27 September 2024
# Contact: dannie.dai@mail.utoronto.ca


# Load required library
library(opendatatoronto)
library(dplyr)

# Create the 'data/raw_data' directory if it doesn't exist
if (!dir.exists("data")) {
  dir.create("data")
}
if (!dir.exists("data/raw_data")) {
  dir.create("data/raw_data")
}

# Download the dataset
package <- show_package("deaths-of-shelter-residents")
resources <- list_package_resources(package)

# Select the CSV resource
data_url <- resources %>% filter(name == "Deaths of Shelter Residents") %>% pull(id)
data <- get_resource(data_url)

# Save the data
write.csv(data, "data/raw_data/shelter_resident_deaths.csv", row.names = FALSE)

# View the first few rows of the actual data
head(data)

