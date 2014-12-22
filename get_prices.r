
pricings <- read.csv('totalpricings_cleaned.csv')

prows <- nrow(pricings[3])

ticker = pricings[602,3]
offer_date = pricings[602,][1]

csv_url = paste('http://ichart.finance.yahoo.com/table.csv?s=', ticker, sep ="")

stockdata <- read.csv(csv_url)

# check to see if data is longer than 60 trading days, if not, get all
if (nrow(stockdata['Adj.Close']) > 59){
  hist_days = stockdata['Adj.Close'][nrow(stockdata['Adj.Close']):(nrow(stockdata['Adj.Close'])-60),1]
}else{
  hist_days = stockdata['Adj.Close']
}

df_hist_days <- as.data.frame(hist_days)
colnames(df_hist_days) <- ticker

write.csv(df_hist_days, file ='testwrite.csv', quote = FALSE)

