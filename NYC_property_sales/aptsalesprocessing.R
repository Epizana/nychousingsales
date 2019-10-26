library(readr)

aptsales = read_csv('aptsales.csv', col_names = TRUE, col_types = 'icccfiiccciiiiiiifciDiifficcc')
head(test)
aptsales = as.data.frame(aptsales, row.names = aptsales$Index)
head(aptsales)
#rownames(aptsales) = aptsales$Index
