

# starting and common lines of codes in each solution of the questions
library(tidyverse)
flights
colnames(flights)

# Questions: find all flights (rows) that : 
# (a) Departed between midnight and 6am (inclusive).



specificCol = select(flights, flight, carrier, dep_time)
filter(specificCol, (dep_time >= 100 & dep_time <= 600))

# (b) Had an arrival delay of two or more hours.

filter(flights, arr_delay >= 2)


# (c) Flew to Houston (IAH or HOU).

view(filter(flights, dest=="HOU"))

# (d) Were operated by United (UA), American (AA), or Delta (DL).

view(filter(flights, carrier=="AA"))

# (e) Arrived more than two hours late, but didn’t leave late.

view(filter(flights, arr_delay > (2*60), dep_delay==0)

# (f) Were delayed by at least an hour, but made up over 30 minutes in flight

filter(flights, arr_delay < 60 & arr_delay > 30)
