# install.packages("nycflights13")

library(nycflights13)
library(tidyverse)
view(airlines)
group_by(flights, dep_delay)

# Challenge 1. Which airline has the highest number of delayed departures?

view(flights)
delayed_flights = flights %>% # start with the flights
  filter(dep_delay>0) %>% # find only the delays
  group_by(carrier) %>% # group by airline (carrier)
  summarise(num_delay=n()) # count the observations
delayed_flights

left_join(delayed_flights, airlines, by="carrier")



b = filter(flights, dep_delay > 0)
b
a = group_by(b, carrier)
a
summarise(a, num_delay=n())


flights %>% # start with the flights
  filter(dep_delay>0) %>% # find only the delays
  group_by(carrier) %>% # group by airline (carrier)
  summarise(num_delay=n()) %>% # count the observations
  left_join(airlines,by="carrier") %>% # join by common key
  filter(num_delay==max(num_delay)) %>% # find most delayed
  select(name)
  


view(flights)

# Challenge 2. On average, to which airport do flights arrive most early?

view(airports)


flights %>%
  group_by(dest) %>%
  summarise(mean_delay=mean(arr_delay, na.rm=TRUE)) %>%
  filter(mean_delay==min(mean_delay, na.rm=TRUE)) %>%
  left_join(airports,by=c("dest"="faa")) %>% 
  select(name)


colnames(flights)

# (a) Considering only flights from JFK to SEA, what was the average, min, and max air
# time of those flights?

# flights %>% 
#   filter(origin=="JFK", dest=="SEA") %>% 
#   group_by(arr_time) %>% 
#   summarise(mean_time=mean(arr_time, na.rm = TRUE))


seattle = select(filter(flights, flights$dest=="SEA"), origin, dest, air_time)
seattle

seattle %>% 
  group_by(origin) %>% 
  summarise(avgTime=mean(air_time, na.rm = T),
            minTime=min(air_time, na.rm = T),
            maxTime=max(air_time, na.rm=T)) %>% 
  filter(origin=="JFK")


#   (b) Which city was flown to with the highest average speed?    

flights %>% 
  group_by(origin) %>% 
  mutate(speed=distance/(air_time/60))

view(flights)
colnames(flights)



