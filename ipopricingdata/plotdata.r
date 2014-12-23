data <- read.csv('pricedata_cleaned.csv')

plot(data[,1], ylim=c(0, 4), type ='l')

for (i in seq(2,ncol(data),by=1)){
  lines(data[,i], type = 'l')
}

abline(a = 1, b = 0, untf = FALSE, col ='red')