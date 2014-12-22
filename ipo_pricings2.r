# get ipo pricing data from yahoo
library(XML)

setwd('/home/nicholas/Documents/ipopricing/ipopricingdata')

months12 <- c('jun12','jul12','aug12','sep12','oct12','nov12','dec12') #c('jan12','feb12','mar12','apr12','may12','jun12','jul12','aug12','sep12','oct12','nov12','dec12')
months13 <- c('apr13','may13','jun13','jul13','aug13','sep13','oct13','nov13','dec13' #'jan13','feb13','mar13','apr13','may13','jun13','jul13','aug13','sep13','oct13','nov13','dec13')
months14 <- c('jan14','feb14','mar14','apr14','may14','jun14')


for (month in months14){
  url = paste('http://biz.yahoo.com/ipo/prc_', month,'.html', sep ='')


#for (months in months12)

tables = readHTMLTable(url, header = T)

tablesdf = as.data.frame(tables[5])

# "/home/nicholas/Documents/ipopricing",
filename = paste(month, "pricing", ".csv", sep = "")

write.csv(tablesdf, file = filename, quote = FALSE)

Sys.sleep(2)
  
  }