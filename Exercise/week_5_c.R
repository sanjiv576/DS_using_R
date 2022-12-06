library(tidyverse)

# install.packages("datarium")

data("marketing", package="datarium")
marketing = as_tibble(marketing)

marketing

view(marketing)


# Model is sales = a + b*youtube
model = lm(sales~youtube, data=marketing)

summary(model)


library(broom)
# augment --> finds each residual value 
fitted = augment(model)

fitted


# residual plot
ggplot(fitted, aes(x=.fitted,y=.resid)) +
  geom_point() +
  geom_hline(yintercept=0)




# Exercise

#install.packages("ggfortify") 
library(ggfortify)
model = lm(sales~youtube,data=marketing)

# better to use it suggests 
autoplot(model)

# compaing model

modelA = lm(sales~youtube,data=marketing)
summary(modelA)


# Exercise. Show that the Pearson correlation coefficient between sales and youtube is
# 𝑟 = 0.7822244. What is 𝑟 ? 
2
in this case?
x = select(marketing, sales)
y = select(marketing, youtube)
r = cor(x, y)
r
r*r

# or

# a = select(marketing$sales, marketing$youtube)
# resid = a*a


# (2) Consider the linear model “sales~youtube+facebook”.
modelB = lm(sales~youtube+facebook,data=marketing)
summary(modelB)

# Exercise. Consider the linear model “sales~facebook+newspaper”. Would you consider that
# this model is a “better” model than “sales~youtube”?

modelB = lm(sales~youtube,data=marketing)
summary(modelB)

modelC = lm(sales~facebook+newspaper,data=marketing)
summary(modelC)

