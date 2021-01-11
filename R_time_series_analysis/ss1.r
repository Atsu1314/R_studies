setwd( "C:/Users/amuta/Documents/R/R_studies/R_time_series_analysis")
getwd()

install.packages('TSSS')
library(TSSS)

# 1.1 時系列データ ####
data( HAKUSAN )
par( mar=c(2,2,3,1)+0.1 )
plot( HAKUSAN[,1], main="(a)" )

# 全データ読み込み
data( HAKUSAN )
data( Sunspot )
data( Temperature )
data( BLSALLFOOD )
data( WHARD )
data( MYE1F )
data( Nikkei225 )
data( Rainfall )
data( Haibara )

# 1.4 時系列データの前処理 ####

## 1.4.1 変数変換

data( WHARD )
log_WHARD <- log10( WHARD )
par( mfrow = c(2, 1), mar = c(2, 4, 1, 1)+0.1 )
plot( WHARD )
plot( log_WHARD )

## 1.4.2 変数（階差）

data( Nikkei225 )
plot( Nikkei225 )
plot( diff( log( Nikkei225 ) ) )

## 1.4.3 前期比, 前年同期比

data( WHARD )
plot( WHARD/lag( WHARD ) )
plot( WHARD/lag( WHARD,k=-12 ) )

## 1.4.4 移動平均

data( Temperature )
plot( Temperature,ylim=c(0,40) )
y <- Temperature

kfilter <- 2
ndata <- length( Temperature )
y[1:ndata] <- NA
for(i in 1:ndata) {
  i0 <- max(i - kfilter,1)
  i1 <- min(i + kfilter,ndata )
  y[i] <- mean( Temperature[i0:i1] )
}
plot( y,ylim = c(0,40))
