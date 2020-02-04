library(readr)
library(dplyr)
library(data.table)
library(ggplot2)
library(RColorBrewer)
library(plotly)
library(shiny)
library(shinydashboard)
library(shinyWidgets)


#load main csv
loadcolumns = 'icccciiiiicciDiccciiccc'
combined = read_csv("combined.csv", col_names = TRUE, col_types = loadcolumns)
combined = as.data.frame(combined, row.names = combined$Index)
rownames(combined) = combined$Index
combined$Index = NULL
colnames(combined) = tolower(colnames(combined))
colnames(combined) = gsub(' ','.',colnames(combined))

boroughnames = unique(combined$borough)
boroughnames = append(boroughnames,'Choose All')
nabenames = unique(combined$neighborhood)
nabenames = append(nabenames, 'Choose All')
typenames = unique(combined$type)
typenames = append(typenames, 'Choose All')
constructnames = unique(combined$construction)
constructnames = append(constructnames, 'Choose All')


#load condotx and buildtx

condotx=read.csv("condotx.csv")
prctblbduil=read.csv("prctblbduil.csv")
buildtx=read.csv("buildtx.csv")

# View(condotx)
#View(prctblbduil)
# View(buildtx)

#########BASIC FEATURES fracture#############
basics = combined %>% select(., main_address, building_address, borough, neighborhood, current.age, type, construction, year.built) %>%
 unique() %>% arrange(., main_address)





#####++++++CONDO Apartment Unit ANNUAL RETURN fracture++++++++#########

# condotx = combined[duplicated(combined$main_address) | duplicated(combined$main_address, fromLast = TRUE), ] %>%
#      filter(., type == 'Condo', !is.na(apt_no)) %>% arrange(., main_address, sale.price) %>% group_by(., main_address, sale.date) %>%
#      arrange(.,main_address, sale.date)
# 
#    #create txtable
#     condotx = as.data.table(condotx)
# 
#       setnames(condotx, old = c("sale.date", "sale.price", "sale.year"), new = c('purchase.date',"purchase.price","purchase.year"))
# 
#       condotx[, sell_date:=shift(purchase.date, 1, type='lead'), by=main_address]
#       condotx[, sell_price:=shift(purchase.price, 1, type='lead'), by=main_address]
#       condotx[, sale_year:=shift(purchase.year, 1, type='lead'), by=main_address]
# 
#     #fill na sell_price with 0s
#       condotx[is.na(sell_price), sell_price := 0]
# 
#     #revert back to data frame
#     condotx = as.data.frame(condotx)
#     condotx = condotx %>% filter(., sell_price != 0) %>%
#     mutate(., price_change = sell_price - purchase.price, days = as.numeric(sell_date - purchase.date), hldg_return = (price_change/purchase.price))
# 
#     #strip negative price change outliers
# 
#     plmin = quantile(condotx$price_change, 0.0005)
# 	condotx = condotx %>% filter(., price_change > plmin, days >= 60)
# 
# 
# 
# 		prctblcondo = condotx #make a copy of the price change table for future use. After merging, I lose granularity of neighborhood/borough and other fields.
# 
# 	condotx = condotx %>%filter(., days > 365) %>% mutate(., rtrn_factor = hldg_return + 1)
# 
# 	tmpdays = condotx %>% group_by(., main_address) %>% summarise(.,total_days = sum(days))
# 
#     tmpreturns = condotx %>% group_by(., main_address) %>% mutate(., prdrtrns = prod(rtrn_factor)) %>%
#     select(., main_address, prdrtrns) %>% unique()
# 
#     daysreturns = inner_join(tmpreturns,tmpdays, by = 'main_address')
# 
#     annualcondoreturns = daysreturns %>% mutate(., annual_return = round(((prdrtrns^(365/total_days))-1),3)) %>% arrange(., desc(annual_return))
#     annualcondoreturns$prdrtrns = NULL
# 
#     condotx = left_join(annualcondoreturns,basics, by = 'main_address')
# 
#     head(condotx)
#     
#     View(condotx)

# ################ ALL BUILDING TYPE ANNUALIZED RETURN ######################
# 
# buildtx = combined[duplicated(combined$building_address) | duplicated(combined$building_address, fromLast = TRUE), ] %>%
#      arrange(., building_address, sale.price) %>% group_by(., building_address, sale.date) %>%
#      arrange(.,building_address, sale.date)
# 
#    #create txtable
#     buildtx = as.data.table(buildtx)
# 
#       setnames(buildtx, old = c("sale.date", "sale.price", "sale.year"), new = c('purchase.date',"purchase.price","purchase.year"))
# 
#       buildtx[, sell_date:=shift(purchase.date, 1, type='lead'), by=building_address]
#       buildtx[, sell_price:=shift(purchase.price, 1, type='lead'), by=building_address]
#       buildtx[, sale_year:=shift(purchase.year, 1, type='lead'), by=building_address]
# 
#     #fill na sell_price with 0s
#       buildtx[is.na(sell_price), sell_price := 0]
# 
#     #revert back to data frame
#     buildtx = as.data.frame(buildtx)
#     buildtx = buildtx %>% filter(., sell_price != 0) %>%
#     mutate(., bprice_change = sell_price - purchase.price, bdays = as.numeric(sell_date - purchase.date), bhldg_return = (bprice_change/purchase.price))
# 
#     #strip negative price change outliers
# 
#     bplmin = quantile(buildtx$bprice_change, 0.0005)
# 	buildtx = buildtx %>% filter(., bprice_change > bplmin, bdays >= 60)
# 
# 		#make a copy of the price change table for future use.
# 
# 		prctblbduil = buildtx
# 
# 	buildtx = buildtx %>%filter(., bdays > 365) %>% mutate(., brtrn_factor = bhldg_return + 1)
# 
# 	btmpdays = buildtx %>% group_by(., building_address) %>% summarise(.,btotal_days = sum(bdays))
# 
#     btmpreturns = buildtx %>% group_by(., building_address) %>% mutate(., bprdrtrns = prod(brtrn_factor)) %>%
#     select(., building_address, bprdrtrns) %>% unique()
# 
#     bdaysreturns = inner_join(btmpreturns,btmpdays, by = 'building_address')
# 
#     annualbuildreturns = bdaysreturns %>% mutate(., bannual_return = round(((bprdrtrns^(365/btotal_days))-1),3)) %>% arrange(., desc(bannual_return))
#     annualbuildreturns$bprdrtrns = NULL
# 
#     buildtx = unique(left_join(annualbuildreturns,basics[,-1], by = 'building_address'))
# 
#     buildtx %>% arrange(., desc(bannual_return))

 
    
    
    
    