library(dplyr)
library(tibble)
setwd('2010')
files = list.files(pattern="*.csv", path = "./initial", full.names = TRUE) #full.names = T to get full path names. #get all of the file names in the directory. Using .txt as an argument so it knows to pick up text files.

# First apply read.csv, then rbind
handle_each <- function(x){
  year <- as.numeric(gsub("[^\\d]+", "", x, perl=TRUE)) #throw out everything BUT the digits.
  temp <- read.csv(x, skip = 4,header = FALSE,  col.names = nyccolumns)
  temp$SALE.YEAR <- year #make a new column to designate which year the information belongs to.
  return(temp)
}
before_2010 = do.call(rbind, lapply(files, handle_each))
write.csv(before_2010, file = 'before_2010.csv', row.names = F)

queens = read.csv('2009_queens - Queens.csv', skip = 3, stringsAsFactors = FALSE)
head(queens)
tbl_df(queens)
colnames(queens)
nyccolumns = colnames(queens)


