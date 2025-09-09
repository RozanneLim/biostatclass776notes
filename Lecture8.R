#Lecture 8: Managing data frames with Tidyverse

#tibbles are better versions of dataframes
#making a tibble 
chicago <- readRDS(here("data", "chicago.rds"))
str(as_tibble(chicago))
#Tibbles, by default, only print the first ten rows to screen, which helps b/c the data frame can be very large

#viewing the data
View()
as_tibble(chicago) %>%
    print(n = 5, width = Inf) #print allows you to specify the number of rows and columns 

#creating a tibble
tibble(
    a = 1:5,
    b = 6:10,
    c = 1,
    z = (a + b)^2 + c
)

#interesting column names need backticks
tibble(
    `two words` = 1:5,
    `12` = "numeric",
    `:)` = "smile",
)

#subsetting with [[ (name or position) or $ (name only)
df <- tibble(
    a = 1:5,
    b = 6:10,
    c = 1,
    z = (a + b)^2 + c
)

# Extract by name using $ or [[]]
df$z

df[["z"]]

#functions in dplyr package
select(): #return a subset of the columns of a data frame
filter(): #extract a subset of rows from a data frame based on logical conditions
arrange(): #reorder rows of a data frame
rename(): #rename variables in a data frame
mutate(): #add new variables/columns or transform existing variables
summarise() / summarize():  ##generate summary statistics of different variables in the data frame, possibly within strata
#%>%: #the “pipe” operator is used to connect multiple verb actions together into a pipeline.
#Note that the base R package now includes a pipe operator |> that has similar functionality.

#omitting variables using select()
select(chicago, -(city:dptp))

#example for select
subset <- select(chicago, city:dptp)
head(subset)

names(chicago)[1:3]

subset <- select(chicago, ends_with("2")) #ends_with selects all columns that ends with "2", can use starts_with too
str(subset)

#example for filter
filter(df, type == 'otter', & site == 'bay')

# %in% included in filter, alternative for using OR and == 

#arrange 
chicago <- arrange(chicago, date)

#rename
chicago <- rename(chicago, dewpoint = dptp, pm25 = pm25tmean2)
head(chicago[, 1:5], 3) #3 shows the number of observations to display 

#mutate
chicago <- mutate(
    chicago, 
    pm25detrend = pm25 - mean(pm25, na.rm = TRUE)
)
head(chicago)

#transmute function only keeps the new variables that you create
head(transmute(chicago,
    pm10detrend = pm10tmean2 - mean(pm10tmean2, na.rm = TRUE),
    o3detrend = o3tmean2 - mean(o3tmean2, na.rm = TRUE)
))

#group_by() function 
#used to generate summary statistics from the data frame within strata defined by a variable

#slice() function
#slice_sample() function of the dplyr package will allow you to see a sample of random rows in random order
#slice_head() function will show you the first n rows of a data frame
#slice_tail() function will show you the last n rows of a data frame



