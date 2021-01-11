setwd( "C:/Users/amuta/Documents/R/R_studies/R_time_series_analysis")
getwd()

library(TSSS)

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

# 3.2 ピリオドグラム ####

# 離散時間フーリエ変換という手法によって高速にフーリエ変換に
# 類似した量を計算することができる.

period( HAKUSAN[,1], window=0)
period( Sunspot, window=0)
period( Temperature, window=0)
period( BLSALLFOOD, window=0)
period( WHARD, window=0)
period( MYE1F, window=0)

# 例　白色雑音の標本自己相関関数とピリオドグラム
r <- as.ts( rnorm(3200) ) 
plot(1:3200, r)

unicor(r,lag=50)
x <- period(r,window=0)
plot(log10(x$period), type="l", ylim=c(-4, 1), xaxt="n")
axis( side = 1, at = c(0, 320, 640, 960, 1280, 1600),
      labels = c(0.0, 0.1, 0.2, 0.3, 0.4, 0.5))

r1 <- r[1:800]
unicor(r1,lag=50)
x1 <- period( r1,window=0)
plot(log10(x1$period), type="l", ylim=c(-4, 1), xaxt="n")
axis( side = 1, at = c(0, 320, 640, 960, 1280, 1600),
      labels = c(0.0, 0.1, 0.2, 0.3, 0.4, 0.5))

r2 <- r[1:200]
unicor(r2,lag=50)
x2 <- period( r2,window=0)
plot(log10(x2$period), type="l", ylim=c(-4, 1), xaxt="n")
axis( side = 1, at = c(0, 320, 640, 960, 1280, 1600),
      labels = c(0.0, 0.1, 0.2, 0.3, 0.4, 0.5))
