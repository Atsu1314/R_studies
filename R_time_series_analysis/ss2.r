setwd( "C:/Users/amuta/Documents/R/R_studies/R_time_series_analysis")
getwd()

library(TSSS)

# 2.1 時系列の分布と定常性 ####

data( HAKUSAN )
par( mfrow=c(3,2), mar=c(2,2.5,3,1)+0.1 )
hist( HAKUSAN[,1], main="(a) 方向角速度" )
hist( HAKUSAN[,2], main="(b) 横揺れ",breaks=seq(-6,12,1.2) )
x <- as.ts( HAKUSAN[,1] )
y <- as.ts( HAKUSAN[,2] )
plot( x, lag(x,k=2), pch=20, main="(c) lag=2")
plot( y, lag(y,k=2), pch=20, main="(d) lag=2")
plot( x, lag(x,k=4), pch=20, main="(e) lag=4")
plot( x, lag(x,k=4), pch=20, main="(f) lag=4")

# 2.2 定常時系列の自己共分散関数 ####
data( Sunspot )

unicor( HAKUSAN[,1],lag=50 )
unicor( log( Sunspot ),lag=50 )
