#Lecture 12: R Nuts and Bolts
#Date: 09/16/2025

#Using AI for Code

## Install ellmer and chattr
install.packages(c("ellmer", "chattr"))

## Load both packages
library("ellmer")
library("chattr")

## Specify that you'll use the GitHub Copilot model
my_chat <- ellmer::chat_github()
chattr::chattr_use(my_chat)

## Load some packages for analysis
library("tidyverse")

## Load the penguins dataset to have something we can
## explore with
library("palmerpenguins")
glimpse(penguins)

## You can now either interact with the LLM through
## commands like this one:
my_chat$chat(
  "Explore the relationship between bill_length_mm and bill_depth_mm across species and island using ggplot2 color aesthetics and facets."
)
my_chat$chat("What do we know the variables in the penguins dataset?")
my_chat$chat(
  "Please provide me a more detailed description and code for exploring this dataset"
)

## or launch the chattr app
chattr::chattr_app()

## Edit the option to include at least 1 data frame.
## Then type the following prompt:
## Explore the relationship between bill_length_mm and bill_depth_mm across species and island using ggplot2 color aesthetics and facets.

## This was my answer by the gpt-4.1 model:
library(tidyverse)
penguins <- readr::read_csv(
  'https://raw.githubusercontent.com/allisonhorst/palmerpenguins/master/inst/extdata/penguins.csv'
)

ggplot(penguins, aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_point(na.rm = TRUE) +
  facet_wrap(~island) +
  theme_minimal()
## Notice how it used a "theme_minimal()" although I didn't ask for it!

## If you open the chattr chat again, you'll see
## your full chat history there too. Now you can
## use the option to also send your chat history
## when sending prompts to the LLM.

## Try:
## Now make the graph interactive using plotly.

## Here was my answer from the LLM:
library(tidyverse)
library(plotly)

penguins <- readr::read_csv(
  'https://raw.githubusercontent.com/allisonhorst/palmerpenguins/master/inst/extdata/penguins.csv'
)

p <- ggplot(
  penguins,
  aes(x = bill_length_mm, y = bill_depth_mm, color = species)
) +
  geom_point(na.rm = TRUE) +
  facet_wrap(~island) +
  theme_minimal()

ggplotly(p)

## --------------------------------------------------------------------------------------------

#global assignment x <<- 2

#Atomic vectors:

#logical: FALSE, TRUE, and NA
#integer (and doubles): these are known collectively as numeric vectors (or real numbers)
#complex: complex numbers
#character: the most complex type of atomic vector, because each element of a character vector is a string, and a string can contain an arbitrary amount of data
#raw: used to store fixed-length sequences of bytes. These are not commonly used directly in data analysis and I won’t cover them here.

#Lists, which are sometimes called recursive vectors because lists can contain other lists.

#create an empty vector
vector(mode = "numeric", length = 4)
vector(mode = "logical", length = 4)
vector(mode = "character", length = 4)

#creating a non-empty vector
c()

#numeric
#In R, numbers are doubles by default.
#To make an integer, place an L after the number:
typeof(4) #double
typeof(4L) #integer

Inf #infinity
