library(lubridate)
wday(today(),label=TRUE)

dmy(01032020)
dmy(28022020)


dmy(01032020) - dmy(28022020)


# Exericse
# (a) Tyson Fury (born 12/08/1988) and Deontay Wilder (born 22/10/1985) boxed for the WBC Heavyweight title.
#Use lubridate to calculate how many days older Wilder is than Fury. Hint:
#   tyson = dmy("12/08/1988")


tyson_born_date=dmy(12081988)
deontay_born_date=dmy(22101985)
days_older=tyson_born_date-deontay_born_date
days_older

# alternate way to show in age
interval(tyson_born_date, deontay_born_date) %>% 
  as.numeric("years")
