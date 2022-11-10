library(tidyverse)
# install.packages("gapminder")  # run only once

library(gapminder)

# shows columns name only
names(gapminder)

# show dimensions i.e
dim(gapminder)

# shows dimensions without duplicate value
dim(distinct(gapminder))

# removes exponent in graph
options(scipen=1000)

# scatter plots Note: scalel_x_log10() --> gives gap in x coordinate
ggplot(gapminder, aes(x=gdpPercap, y=lifeExp)) + geom_point(aes(colour=continent)) + scale_x_log10()



# Intermediate variables
A = filter(gapminder, continent=="Europe", year=="2007")
view(A)
B = select(A, -continent, -year)
view(B)

# bubble plot  Note: aplha---> shows black opacity
ggplot(B, aes(x=gdpPercap, y=lifeExp, size=pop)) + geom_point(alpha=0.6)


# Nested function calls
ggplot(select(filter(gapminder, continent=="Europe", year==2007),
              -continent,-year),aes(x=gdpPercap,y=lifeExp, size=pop)) +
  geom_point(alpha=0.5)


# Pipes ---> executes the code line by line until it finds its symbol in the end of the statement
# Note: shortcut to get pipe symbol--> Command + Shift + m, use pipe symbol in each line to execute line by line
# NOte: to get all shortcut ---> Alt + Shift + k
# Note: geom_point() --> draws point graph
gapminder %>% 
  filter(continent=="Europe", year=="2007") %>% 
  select(-continent, -year)  %>% 
    ggplot(aes(x=gdpPercap, y=lifeExp, size=pop)) + geom_point(alpha=0.5)


# Summarize ---> mean of the population in the year 1952
gapminder %>% 
  filter(year==1952) %>% 
  summarise(num_counteries=n_distinct(country), 
            mean_pop=mean(pop))

# get median of the population in the year 2007
gapminder %>% 
  filter(year==2007) %>% 
  summarise(total_num_countries=n_distinct(country), 
            median_population=median(pop))


# group_by  --> gets specific data like age of batch 30 B Computing here, we group_by(course=="Computing")
# Note: geom_line() --> draws line graph, n_distinct(country) ---> count number of countries without duplication
gapminder %>%
  group_by(year) %>%
  summarise(num_countries=n_distinct(country),
            mean_population=mean(pop)) %>% 
  ggplot(aes(x=year, y=mean_population)) + geom_line()

gapminder %>%
  group_by(continent) %>%
  summarise(num_countries=n_distinct(country),
            mean_population=mean(pop))
