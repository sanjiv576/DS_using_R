starwars
view(starwars)

# Question 1: Convert each of these commands (separately) into a dplyr pipe.
filter(starwars, species=="Droid")
arrange(starwars, desc(mass))


# Answer
starwars %>% 
  filter(species=="Droid")
  
starwars %>% 
  arrange(desc(mass))


# Question 2: Write a dplyr pipe to group the starwars dataset by species and count the number of
# characters of each species and the mean mass of each species.

# Answer

a = starwars %>% 
  group_by(species) %>% 
  summarise(total_number_species=n_distinct(name),
            mean_mass=mean(mass))

view(a)


# Question: 2

# Choose which football league
library(tidyverse)
myleague = "E0"

# Get data from www.football-data.co.uk

url = paste0("https://www.football-data.co.uk/example.csv")  

football = read_csv(url)

View(football)

colnames(football)

distinct(football, HomeTeam)

# (a) Pick your favourite team in this league, and filter out only those matches (rows) that
# your team is involved in (either as the home team or the away team).

# Answer
football %>% 
  filter(HomeTeam=="Chelsea")

# (b) Write a dplyr pipe to find the mean (average) number of Full Time Home Goals
# scored by each team over the league season.

# Answer
football %>%
  
  group_by(HomeTeam) %>% 
  summarise(total_goals= n_distinct(`Full time home goals`), mean_goals=mean(`Full time home goals`))
  
