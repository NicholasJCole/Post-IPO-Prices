
pricings <- read.csv('totalpricings_lessduds2.csv')

prows <- nrow(pricings[3])

ticker = pricings[603,3]
offer_date = pricings[603,][1]

# res <- try(stockdata <- read.csv(csv_url))
# if(inherits(res, "try-error")){
#   next
# }

}
#     if(exists("stockdf")==FALSE){
#         stockdf <- stockdata
#     }else{
#         stockdf <- cbind(stockdf, stockdata)
#         }


getstockdata <- function(ticker){
  csv_url = paste('http://ichart.finance.yahoo.com/table.csv?s=', ticker, sep ="")
  stockdata <- read.csv(csv_url) 
  return(stockdata)
}

getadjdata <- function(stockdata){
# check to see if data is longer than 60 trading days, if not, get all
    if (nrow(stockdata['Adj.Close']) > 59){
        hist_days = stockdata['Adj.Close'][nrow(stockdata['Adj.Close']):(nrow(stockdata['Adj.Close'])-60),1]
    }else{
        next
    }
return(hist_days)
}

gettotaldata <- function(ticker){
  stockdata <- getstockdata(ticker)
  hist_days <- getadjdata(stockdata)
  df_hist_days <- as.data.frame(hist_days)
  colnames(df_hist_days) <- ticker
  return(df_hist_days)
}

#df_hist_days <- gettotaldata(ticker)

#write.csv(df_hist_days, file ='testwrite1.csv', quote = FALSE)

readdf <- read.csv('pricedata.csv', header = TRUE)

remove(adjpricesdf)
for (tickernumber in c(397:611)){
  print(pricings[tickernumber,3])
  adjprices <- gettotaldata(pricings[tickernumber,3])
  if(exists("adjpricesdf")==FALSE){
    adjpricesdf <- cbind(readdf, adjprices)
  }else{
  adjpricesdf <- cbind(adjpricesdf, adjprices)
  }
  print(pricings[tickernumber,3])
  Sys.sleep(1)
  
}
write.csv(adjpricesdf, file = 'pricedata.csv', quote = FALSE)

