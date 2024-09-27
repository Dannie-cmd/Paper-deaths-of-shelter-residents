#### Preamble ####
# Purpose: Cleans the raw marriage data into an analysis dataset
# Author: Yuehan Dai
# Date: 27 September 2024
# Contact: dannie.dai@mail.utoronto.ca

#### Workspace setup ####
library(opendatatoronto)
library(dplyr)
library(readr)

#### Download data ####
# Load the dataset from Open Data Toronto
dataset <- opendata::get_dataset("deaths-of-shelter-residents")

# Convert the dataset to a data frame
raw_data <- dataset$results

#### Clean data ####
cleaned_data <- raw_data %>%
  janitor::clean_names() %>%
  select(death_date, age_at_death, shelter_name, cause_of_death) %>%
  filter(!is.na(death_date)) %>%
  mutate(
    age_at_death = as.numeric(age_at_death)
  ) %>%
  rename(
    date_of_death = death_date,
    shelter = shelter_name,
    cause = cause_of_death
  ) %>%
  drop_na()

#### Save data ####
write_csv(cleaned_data, "outputs/data/deaths_of_shelter_residents_cleaned.csv")