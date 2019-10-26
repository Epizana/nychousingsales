library(dplyr)
library(tibble)
library(readr)
#setwd('2010')
files = list.files(pattern="*.csv", path = "./after", full.names = TRUE) #full.names = T to get full path names. #get all of the file names in the directory. Using .txt as an argument so it knows to pick up text files.

# First apply read.csv, then rbind
handle_each <- function(x){
  year <- as.numeric(gsub("[^\\d]+", "", x, perl=TRUE)) #throw out everything BUT the digits.
  temp <- read_csv(x, skip = 5, col_names = nyccolumns, col_types = 'ncccccccccccccccccccc')
  temp$SALE.YEAR <- year #make a new column to designate which year the information belongs to.
  return(temp)
}
after_2010 = do.call(rbind, lapply(files, handle_each))
write.csv(after_2010, file = 'after_2010.csv', row.names = F)

test = read.csv('after_2010.csv')

nyccolumns

dim(test)
head(test,50)
queens = read.csv('2015_queens - Queens.csv', skip = 4, stringsAsFactors = FALSE)
head(queens)
tbl_df(queens)
colnames(queens)
nyccolumns = colnames(queens)
length(nyccolumns)
#nyccolumns[22] = 'SALE.YEAR'
nyccolumns
