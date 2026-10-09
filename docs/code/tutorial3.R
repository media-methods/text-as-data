# =============================================================
# Tutorial 3: Preprocessing text
# Digital Methods II - Text as Data
# =============================================================
#
# This script contains all code from Tutorial 3.
# Run the code line by line (Ctrl + Enter / Cmd + Enter) and
# compare the results with the tutorial.
#
# At the end, you will find the tasks from "Test your knowledge".
# Type your solutions into the empty slots.
#
# Make sure that you work in your R project and that the data
# (data_tvseries.csv) is saved in the subfolder "data".


# 1 Preprocessing and the bag-of-words assumption --------------

# install (only once)
# install.packages("quanteda")

# load packages (every time you restart R)
library(tidyverse)
library(quanteda)

# 2 Example: Preprocessing the IMDb data -----------------------

# read in the data
data <- read.csv2("data/data_tvseries.csv", encoding = "UTF-8")

# create a corpus
corpus_tv <- corpus(data, text_field = "Description")

# docvars (metadata) of the first documents
docvars(corpus_tv) |>
  head(3)

# overview of the first texts (tokens, types)
summary(corpus_tv, n = 3)

# preprocessing
tokens_tv <- corpus_tv |>
  
  # tokenization & removing punctuation, numbers, symbols
  tokens(remove_punct = TRUE,
         remove_numbers = TRUE,
         remove_symbols = TRUE) |>
  
  # lowercasing
  tokens_tolower() |>
  
  # removing stopwords
  tokens_remove(stopwords("english")) |>
  
  # stemming
  tokens_wordstem()

# first text before preprocessing...
data$Description[1]

# ...and afterwards
tokens_tv[1]


# Test your knowledge ------------------------------------------

## Task 1 (Easy) ----
# Use the TV series data. Preprocess only the description of "Breaking Bad"
# (the second document) as in this tutorial.
# How many tokens does the description have before and after preprocessing?

# Your solution:



## Task 2 (Medium) ----
# Use the TV series data. In this tutorial, we first removed stopwords and
# then applied stemming. Repeat the preprocessing from this tutorial, but
# switch the order of these two steps: First apply stemming, then remove
# stopwords.
# Why does the order of preprocessing steps matter here?

# Your solution:

