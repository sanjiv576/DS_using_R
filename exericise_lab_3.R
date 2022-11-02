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

