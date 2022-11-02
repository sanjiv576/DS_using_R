#------------------------- LAB 3 SECTION C ---------------------------

# install.packages("nycflights13")

library(tidyverse)
library(nycflights13)

# dim ---> shows data in rows and columns i.e matrix form
dim(flights)
flights

view(flights)

# extracting columns
names(flights)
select(flights, year, month, day)
select(flights, year:day)
select(flights, -year)
select(flights, -(year:day))

select(flights, dep_delay, arr_delay)

# alternate way
select(flights, starts_with("sched"))
select(flights, ends_with("delay"))
select(flights, contains("arr"))
select(flights, matches(".*_.*_.*")) # regular expression matching
select(flights, last_col())



# show no duplication data
dim(flights)
dim(distinct(flights))
distinct(select(flights, month, day))
distinct(flights, month, day) # does the same as line above because above has no duplication data


sat = pull(flights,sched_arr_time)
sat
summary(sat)
typeof(sat)

# rename columns
rename(flights, dis=distance, tail_num=tailnum)

# add columns
# mutate ---> add new columns and also store the data
addedCol = mutate(flights, gain=arr_delay-dep_delay, speed=distance/(air_time/60))
dim(flights)
dim(addedCol)

# transmute ---> only joins the data to show but does not store joined data
transmute(flights, gain=arr_delay-dep_delay, gain_per_hour=gain /(air_time/60))
transmute(flights, distance_residual=distance-mean(distance))


# slicing the row
slice(flights, 87:96) # particular 10 rows
# _n ---> means count the number in R
top_n(flights, 20)


# filter the data
filter(flights, month==1, day==1)


# get random data


set.seed(123)
sample_n(flights, 20)
0.001*nrow(flights) # how many rows expected if 0.1% of the rows
sample_frac(flights, 0.001)


# arrange the data
arrange(flights, year, month, day)
arrange(flights, desc(arr_delay)) # descending order

