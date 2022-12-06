library(tidyverse)

starwars

colnames(starwars)

# Convert each of these commands (separately) into a dplyr pipe.
# filter(starwars, species=="Droid")
# arrange(starwars, desc(mass))

starwars %>% 
  filter(species == "Droid") %>% 
  arrange(desc(mass))


# Write a dplyr pipe to group the starwars dataset by species and count the number of
# characters of each species and the mean mass of each species.

a = starwars %>% 
  group_by(species) %>% 
  summarise(num_characters = n_distinct(name), mean_mass = mean(mass))

view(a)


url = paste0("https://www.football-data.co.uk/example.csv")  

football = read_csv(url)

View(football)

colnames(football)

distinct(football, HomeTeam)


# (a) Pick your favourite team in this league, and filter out only those matches (rows) that
# your team is involved in (either as the home team or the away team).

football %>% 
  filter(HomeTeam == "Man City")

# (b) Write a dplyr pipe to find the mean (average) number of Full Time Home Goals
# scored by each team over the league season.

football %>% 
  group_by(HomeTeam) %>%
  summarise(total_goals = n_distinct(`Full time home goals`), meaan_goal = mean(`Full time home goals`))





############## JOIN Statements questions and answers ##################

library(nycflights13)
library(tidyverse)


# Which airline has the highest number of delayed departures?

airlines
airports
flights

colnames(flights)

delayed_flights = flights %>% 
  filter(dep_delay > 0) %>% 
  group_by(carrier) %>% 
  summarise(num_delay = n())
  

delayed_flights

newData = left_join(airlines, delayed_flights, by="carrier") %>% 
  filter(num_delay == max(num_delay)) %>% 
  select(name)

newData


# On average, to which airport do flights arrive most early?

view(airports)
flights
colnames(airports)
colnames(flights)


# arr_flights = flights %>% 
#   filter(arr_time > 0) %>% 
#   group_by(carrier) %>% 
#   left_join(airports, by="carrier") 

flights %>% 
  group_by(dest) %>% 
  summarise(mean_delay = mean(arr_delay, na.rm = TRUE)) %>% 
  filter(mean_delay==min(mean_delay, na.rm=TRUE)) %>% 
  left_join(airports, by=c("dest"="faa")) %>% 
  select(name)


library(tidyverse)
summary(diamonds)

# (a) Write a dplyr pipe that produces a summary table showing for each cut of diamond
# the number of diamonds of that cut and the correlation coefficient of carat and price.

colnames(diamonds)

diamonds %>% 
  select(cut) %>% 
  summary()

# (b) Write a dplyr pipe to determine what color of diamond has the highest mean of price
# per carat among diamonds with Ideal cut.

diamonds %>% 
  filter(cut == "Ideal") %>% 
  group_by(color) %>% 
  mutate(price_per_carat = price/carat) %>% 
  summarise(mean_ppc = mean(price_per_carat)) %>% 
  filter(mean_ppc == max(mean_ppc)) %>% 
  select(color)
