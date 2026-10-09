# =============================================================
# Tutorial 4: Text-as-data representations
# Digital Methods II - Text as Data
# =============================================================
#
# This script contains all code from Tutorial 4.
# Run the code line by line (Ctrl + Enter / Cmd + Enter) and
# compare the results with the tutorial.
#
# At the end, you will find the tasks from "Test your knowledge".
# Type your solutions into the empty slots.
#
# Make sure that you work in your R project and that the data
# (data_tvseries.csv) is saved in the subfolder "data".


# 1 Why do we need text-as-data representations? ---------------

# load packages
library(tidyverse)
library(quanteda)

# read in the data
data <- read.csv2("data/data_tvseries.csv", encoding = "UTF-8")

# create corpus (see Tutorial 3)
corpus_tv <- corpus(data, text_field = "Description")

# preprocessing (see Tutorial 3)
tokens_tv <- corpus_tv |>
  tokens(remove_punct = TRUE,
         remove_numbers = TRUE,
         remove_symbols = TRUE) |>
  tokens_tolower() |>
  tokens_remove(stopwords("english")) |>
  tokens_wordstem()


# 2 The document-feature matrix --------------------------------

## 2.1 What is a document-feature matrix? ----

# three short news headlines
headlines <- c(
  doc1 = "On the state of the German economy: Will we have another financial crisis in Germany in 2023?",
  doc2 = "The GDP is going down, unemployment is up: Crisis ahead in Germany?",
  doc3 = "German economy tumbles into crisis: Government under pressure"
)

# preprocessing & DFM
headlines |>
  tokens(remove_punct = TRUE, remove_numbers = TRUE) |>
  tokens_tolower() |>
  tokens_remove(stopwords("english")) |>
  tokens_wordstem() |>
  dfm()


## 2.2 Creating a DFM for our data ----

dfm_tv <- tokens_tv |>
  dfm()

dfm_tv


## 2.3 Inspecting a DFM ----

# number of documents, number of features, sparsity
ndoc(dfm_tv)
nfeat(dfm_tv)
sparsity(dfm_tv)

# names of the first features
featnames(dfm_tv) |>
  head(10)

# metadata (docvars) of the first documents
docvars(dfm_tv) |>
  select(Title, Parental.Rating) |>
  head(3)
