# =============================================================
# Tutorial 1: Reading in text
# Digital Methods II - Text as Data
# =============================================================
#
# This script contains all code from Tutorial 1.
# Run the code line by line (Ctrl + Enter / Cmd + Enter) and
# compare the results with the tutorial.
#
# At the end, you will find the tasks from "Test your knowledge".
# Type your solutions into the empty slots.
#
# Make sure that you work in your R project and that the data
# (data_tvseries.csv) is saved in the subfolder "data".


# 1 Reading text data into R -----------------------------------

## 1.1 Reading in texts ----

# install (only once)
# install.packages("tidyverse")

# load packages (every time you restart R)
library(tidyverse)

# read in the data
data <- read.csv2("data/data_tvseries.csv", encoding = "UTF-8")


# 2 Inspecting text data ---------------------------------------

# number of rows (documents) and columns (variables)
nrow(data)
ncol(data)

# first rows
data |>
  as_tibble() |>
  head()

# first description
data |>
  slice(1) |>
  pull(Description)

# length of descriptions (number of characters)
data |>
  mutate(length = str_length(Description)) |>
  summarise(min = min(length),
            mean = mean(length),
            max = max(length))


# 3 Encoding problems ------------------------------------------

## 3.1 What is encoding? ----

# example string
string <- "Arsène Lupin & Saga Norén"

# check encoding
Encoding(string)

# change encoding (for testing purposes)
Encoding(string) <- "latin1"
string

## 3.2 How can we fix encoding problems? ----

string |>
  str_replace_all(pattern = "Ã¨", replacement = "è") |>
  str_replace_all(pattern = "Ã©", replacement = "é")


# Test your knowledge ------------------------------------------

## Task 1 (Easy) ----
# Use the TV series data.
# How many TV series have an IMDb Rating of at least 9?

# Your solution:


