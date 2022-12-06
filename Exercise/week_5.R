library(tidyverse)
x = anscombe[,1]
x
y = anscombe[,5]
summary(x)

sd(x)
summary(y)
sd(y)
cor(x,y)


ggplot(NULL,aes(x=x,y=y)) +
  geom_point()


x = anscombe[,2]
y = anscombe[,6]

sd(x)
summary(x)

sd(y)
summary(y)

cor(x,y)
ggplot(NULL, aes(x=x,y=y)) + geom_point()
# What do you notice about the summary statistics?
# We can find since, it is Anscombe's quartet which has similiar stastistics but different distribution in the graph.



# (3) Repeat these calculations for the third dataset from Anscombe’s quartet (columns 3
# and 7).

x = anscombe[-3,2]
y = anscombe[-3,6]
x
sd(x)
summary(x)

sd(y)
summary(y)

cor(x,y)
ggplot(NULL, aes(x=x, y=y)) + geom_point()







library(gapminder)
ggplot(gapminder, aes(x=gdpPercap, y=lifeExp)) +
  geom_point(aes(colour=continent))

x= select(gapminder, gdpPercap)
x

y = select(gapminder, lifeExp)
y

cor(x,y)

summary(x)
summary(y)

# ggplot(NULL, aes(x=x, y=y)) + geom_point()



newSet = gapminder %>%
  filter(year==2007) %>%
  group_by(continent) %>%
  summarise(num_countries=n_distinct(country),
            r=cor(gdpPercap,lifeExp)) %>% 
  ggplot(aes(x=gdpPercap, y=lifeExp)) + geom_point() 



gapminder %>% 
  filter(year==2007, continent=="Asia") %>% 
  ggplot(aes(x=gdpPercap, y=lifeExp)) + geom_point()


# does not work

xx = select(gapminder, lifeExp)
yy = select(gapminder, gdpPercap)  

xx
y

b = 0.1
a = mean(y)-b*mean(x)
residuals = (a+b*x)-y
ggplot(NULL,aes(x=x,y=y)) +
  geom_point(shape=4,size=1) +
  geom_abline(intercept=a,slope=b) +
  geom_rect(aes(xmin=x,xmax=x+residuals,
                ymin=y,ymax=y+residuals),
            fill="green",alpha=0.5) +
  coord_fixed() +
  xlim(3,17) +
  ylim(3,12)
SSR = sum(residuals^2)
SSR




# multivariate 

# install.packages("ISLR")

library(tidyverse)
library(ISLR)
credit = as_tibble(Credit)
credit = select(credit,Balance,Limit,Income)
summary(credit)


ggplot(credit, aes(x=Balance, y=Limit)) +
  geom_point()
cor(credit$Balance,credit$Limit)



# ----------------------------------
# install.packages("GGally")
library(GGally)
ggscatmat(select(credit,Balance,Limit,Income))







#------------------ week 5 lab 2
# install.packages("titanic")
library(titanic)
titanic = as_tibble(titanic_train)
titanic


titanic = select(titanic,Survived,Pclass,Name,Gender=Sex,Age,Fare)
titanic
summary(titanic)



titanic$Survived = as_factor(titanic$Survived)
titanic$Pclass = as_factor(titanic$Pclass)
titanic
summary(titanic)


ggscatmat(select(titanic, Survived,Pclass,Name,Gender, Age, Fare))

# Survived by Gender
ggplot(titanic, aes(x=Gender)) +
  geom_bar(aes(fill=Survived))


# Survived by Pclass
ggplot(titanic, aes(x=Pclass)) +
  geom_bar(aes(fill=Survived))

# Survived by Gender and Pclass
ggplot(titanic, aes(x=Gender)) +
  geom_bar(aes(fill=Survived)) +
  facet_wrap(~Pclass)


# Survived by Age and Gender (beware colours)
ggplot(titanic, aes(x=Age)) +
  geom_histogram(aes(fill=Survived),binwidth=5) +
  facet_wrap(~Gender)
