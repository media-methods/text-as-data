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

## 2 Creating a DFM for our data ----

# create a dfm
dfm_tv <- tokens_tv |>
  dfm()

#inspect
dfm_tv


## 3 Inspecting a DFM ----

# number of features
nfeat(dfm_tv)

#sparsity
sparsity(dfm_tv)

# names of the first features
featnames(dfm_tv) |>
  head(5)

