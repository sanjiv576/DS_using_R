library(tidyverse)
# install.packages("ISLR")
library(ISLR)
credit = as_tibble(Credit)
credit

# scatter plot
ggplot(credit, aes(x=Income,y=Balance)) +
  geom_point()


# another way in bubble plot using colors 
ggplot(credit) + geom_point(aes(x=Income,y=Balance,colour=Student)) + scale_colour_discrete() +
  labs(title="Balance vs Income ",
       x = "Income ($000)",
       y = "Balance ($)")

# ranging from -100 to 250
ggplot(credit) + geom_point(aes(x=Income,y=Balance)) + scale_x_continuous(limits=c(-100,250))



# now in color
ggplot(credit) + geom_point(aes(x=Income, y=Balance, colour=Student)) +
  scale_x_continuous(limits=c(-100, 300)) + 
  labs(title ="Balance Vs Income",
       x="Income ($)",
       y="Balance($)")

# shortcut way to do in Assignment

d = ggplot(mpg, aes(fl))
d = d + geom_bar()

# coord_flip --> flips x into y and y into x Note: use in Assignment
d = d + coord_flip()
d



# in histogram

library(gapminder)

view(gapminder)
c = ggplot(gapminder, aes(x=lifeExp))
c = c + geom_histogram()
c


# in boxplot

f = ggplot(gapminder, aes(x=lifeExp, y=gdpPercap))
f = f + geom_boxplot()
f
