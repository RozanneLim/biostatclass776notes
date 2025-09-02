#Lecture 7: Reading and Writing Data
#Date: 09/02/2025

#relative vs absolute paths
setwd("../data")
setwd("/Users/bcaffo/data")

#locating files in the directory with here::here()
here::here("data", "filename.csv")

#reading data in base R
read.table()
read.csv()
readLines() #for text file
write.table() #for writing tabular data to text files (i.e. CSV) or connections
writeLines() #for writing character data line-by-line to a file or connection

#reading in data example with readr
df <- read.csv(here("data", "team_standings.csv"))
df

#reading in R code files
source()

#reading and writing R objects
.RData #stores multiple R objects
.Rda #short for R.Data, equivalent
.Rds #stores a single R object

#reading in data from files
load() #for .RData or .Rda files
readRDS() #for .Rds files
unserialize() #for raw vectors

#writing data to files
save() #for .RData or .Rda files
save.image() #saves the current workspace to a .RData file
saveRDS() #for saving a single objects
serialize() #for converting an R object into a binary format for outputting to a connection (or file)
