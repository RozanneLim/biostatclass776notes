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

#example of saving an R object and loading a saved R object
x <- 1:5
save(x, file = here("data", "x.Rda"))
saveRDS(x, file = here("data", "x.Rds"))
newx1 <- load(here("data", "x.Rda")) #prints the name of the object, not the values, add verbose = TRUE argument to see the values


#removing an object
rm(x)

#removing the saved R object
file.remove(here("data", "x.Rda"))

#other data types to read in packages
#DBI for relational databases
#haven for SPSS, Stata, and SAS data
#httr for web APIs
#readxl for .xls and .xlsx sheets
#googlesheets4 for Google Sheets
#googledrive for Google Drive files
#rvest for web scraping
#jsonlite for JSON
#xml2 for XML.

#readr functions
read_csv() #Reads comma-separated file
read_csv2() #Reads semicolon-separated file
read_tsv() #Reads tab-separated file
read_delim() #General function for reading delimited files
read_fwf() #Reads fixed width files
read_log() #Reads log files

#kable function with knitr (summary table in a table format)
kable()

#skipping comments in the file
read_csv(
  "The first line of metadata
  The second line of metadata
  x,y,z
  1,2,3",
  skip = 2
)

read_csv(
  "# A comment I want to skip
  x,y,z
  1,2,3",
  comment = "#"
)

#specifying column types explicitly
teams <- read_csv(
  here("data", "team_standings.csv"),
  col_types = "cc" #c stands for character, and there's two columns
)

#more specific column types using column_only function

logdates <- read_csv(
  here("data", "2016-07-19.csv.bz2"),
  col_types = cols_only(date = col_date()),
  n_max = 10
)
logdates

#reads a gzip-compressed CSV file containing download logs from the RStudio CRAN mirror
logs <- read_csv(here("data", "2016-07-19.csv.bz2"), n_max = 10)

#how much RAM available
benchmarkme::get_ram()
