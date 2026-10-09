# =============================================================
# Tutorial 2: Regular expressions
# Digital Methods II - Text as Data
# =============================================================
#
# This script contains all code from Tutorial 2.
# Run the code line by line (Ctrl + Enter / Cmd + Enter) and
# compare the results with the tutorial.
#
# At the end, you will find the tasks from "Test your knowledge".
# Type your solutions into the empty slots.
#
# Make sure that you work in your R project and that the data
# (data_tvseries.csv) is saved in the subfolder "data".


# 1 Working with text in R: stringr ----------------------------

# load packages
library(tidyverse)

# three short example texts
example <- c("A crime drama set in London.",
             "A comedy about a family.",
             "Crime, crime, and more crime!")

# does the text contain "crime"?
str_detect(example, "crime")

# how often does "crime" occur?
str_count(example, "crime")

# 2 Regular expressions ----------------------------------------

## 2.1 Logical operators ----

# descriptions mentioning "drama" OR "crime"
data |>
  filter(str_detect(Description, "drama|crime")) |>
  nrow()

# descriptions mentioning "drama" AND "crime"
data |>
  filter(str_detect(Description, "drama") & str_detect(Description, "crime")) |>
  nrow()

## 2.2 Character classes ----

# only lowercase "drama"
data |>
  filter(str_detect(Description, "drama")) |>
  nrow()

# "drama" or "Drama"
data |>
  filter(str_detect(Description, "[Dd]rama")) |>
  nrow()

## 2.3 Quantifiers ----

# search for capital letters (at least two) which indicate abbreviations
data |>
  filter(str_detect(Title, "[A-Z]{2,}")) |>
  select(Title) |>
  head(3)



# Test your knowledge ------------------------------------------

## Task 1 (Easy) ----
# Use the TV series data.
# Can you identify the number of TV series whose description mentions London?

# Your solution:



## Task 2 (Medium) ----
# Use the TV series data.
# - Identify all TV series about superheroes, i.e., whose description contains
#   "superhero" or "superheroes" (upper- or lowercase).
# - In these descriptions, replace "superhero"/"superheroes" with
#   "fancy R programmers".
# How many series are about superheroes?
# What does the first description look like after your replacement?

# Your solution:



## Task 3 (Hard) ----
# Use the TV series data.
# In the variable Title, each title starts with a number, a dot, and a space:

data |>
  select(Title) |>
  head(5)

# We want to remove these characters with str_remove_all(), so that
# "1. Game of Thrones" becomes "Game of Thrones".
# How would you clean the data this way using regular expressions?
# Hint: Have a look at the box "More on regular expressions: Anchors"
# in Section 2.4.

# Your solution:


