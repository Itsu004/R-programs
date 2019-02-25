#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution
profitmonth <- revenue - expenses
tx <-rep(0.3,12)
profitaftrtx <- profitmonth - (profitmonth*tx)
profitmrgn <- profitaftrtx/revenue
mnpr <- mean(profitaftrtx)  
gdmnt <- rep(F,12)
for(i in 1:12){
  if(profitaftrtx[i]>mnpr){
    gdmnt[i]=T
  }
}
bstmnt <-max(profitaftrtx)
wrstmnt <-min(profitaftrtx)
?round()
