setwd( "C:/Users/amuta/Documents/R/R_studies/R_for_Datascience")
getwd()

#本章で必要なパッケージ
library(nycflights13)
library(tidyverse)

#3.2 ####
# 練習問題4.
NA * 0 ## = NA これはInf * 0 = NaN だからである.
NA ^ 0 ## = 1  これはNAにどんな値が入っても1が返るからである

#3.3 ####
install.packages('nycflights13')
library(nycflights13)
library(tidyverse)

flights
arrange(flights, year, month, day)
arrange(flights, desc(arr_delay))

df <- tibble(x = c(5, 2, NA))
arrange(df, x)
arrange(df, desc(x))

#練習問題
#1.
arrange(df, desc(is.na(x)))

#2.
?flights

##dep_delay、arr_delay
##出発と到着の遅延（分単位）。負の時間は、早期の出発/到着を表します。

select(flights, dep_delay, arr_delay) %>% 
  arrange(desc(dep_delay + arr_delay))

arrange(flights, desc(dep_delay + arr_delay))
#この答えの最初のレコード

#3
select(flights, year, month, day, distance, air_time) %>% 
  arrange(desc(distance / air_time))

arrange(flights, desc(distance / air_time))
#この答えの最初のレコード

#4
arrange(flights, distance)
arrange(flights, desc(distance))



#3.4 select()で列を選ぶ ####

select(flights, year, month, day)

select(flights, year:day)

select(flights, -(year:day))

rename(flights, tail_num = tailnum) %>% 
  select(tail_num)

select(flights, time_hour, air_time, everything())

#練習問題
#1
select(flights, dep_time, dep_delay, arr_time, arr_delay)
select(flights, starts_with("dep"), starts_with("arr"))
select(flights, contains("dep"), contains("arr"), -(contains("sched")), -carrier)
       
#2
select(flights, dep_time, dep_time)

#3
?one_of()
select(flights, year) #実行可能
select(flights, "year") #実行可能

col_name <- c("year", "month")
select(flights, one_of(col_name))
#tidyverseのバージョンの問題か？
#one_of()関数を使わなくても正常に処理できている気がする.

#4
select(flights, contains("TIME"))



#3.5 mutate()で新しい変数を追加する.
