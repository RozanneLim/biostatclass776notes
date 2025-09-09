#Lecture 9: Tidyverse, Long and Wide Data
#Date: 09/09/2025

#show all functions from dplyr package
help(package = "dplyr")

#converting to long data
library("tidyverse")

relig_income %>%
  pivot_longer(
    -religion,
    names_to = "income",
    values_to = "respondents"
  ) %>%
  mutate(
    religion = factor(religion),
    income = factor(income)
  )

#converting to wide data
relig_income %>%
  pivot_longer(-religion, names_to = "income", values_to = "respondents") %>%
  mutate(religion = factor(religion), income = factor(income)) %>%
  group_by(income) %>%
  summarize(total_respondents = sum(respondents)) %>%
  pivot_wider(
    names_from = "income",
    values_from = "total_respondents"
  ) %>%
  knitr::kable()

#pivot_wider() are less commonly used, but is useful for creating a summmary table

#Wide format data tends to have different attributes or variables describing an observation placed in separate columns.
#Long format data tends to have different attributes encoded as levels of a single variable, followed by another column that contains tha values of the observation at those different levels.

#unite(): combine contents of two or more columns into a single column
gapminder %>%
  unite(
    col = "country_continent_year",
    country:year,
    sep = "_"
  )


#separate(): separate contents of a column into two or more columns
gapminder %>%
  unite(
    col = "country_continent_year",
    country:year,
    sep = "_"
  ) %>%
  separate(
    col = "country_continent_year",
    into = c("country", "continent", "year"),
    sep = "_"
  )
