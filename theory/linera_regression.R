library(tidyverse)
# Anscombe's quartet (first dataset)
x = anscombe[,4]
y = anscombe[,5]
ggplot(NULL,aes(x=x,y=y)) +
  geom_point()

x 
y


a = 2.0
b = 0.7
# observed value - estimated value
residuals = y-(a+b*x)
residuals
ggplot(NULL,aes(x=x,y=y)) +
  geom_point() +
  geom_abline(slope=b,intercept=a)




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




# Exercise of Corrleation Regression


# The “cars” dataset is also built in to R. It gives the speed (mph) of cars and the
# corresponding distances (dist) taken to stop (feet). These are all cars from the 1920s
# (see https://rdrr.io/r/datasets/cars.html).

library(tidyverse)
view(cars)
summary(cars)
x = cars$speed
y = cars$dist

colnames(cars)

# a) Plot a scatterplot of stopping distance vs speed. Add a title to your plot and label
# the horizontal and vertical axes.

ggplot(cars, aes(x=dist, y=speed)) + geom_point() + 
  labs(title = "Distance Vs Speed", 
         x = "Distance",
         y= "Speed")


# (b) Calculate the correlation coefficient between stopping distance and speed. How
# would you describe the relationship between the speed and stopping distance?


cor(x,y)

# since, it is strong positive 


# (c) Find the equation of the line of best fit.

b = sum((speed-mean(speed))*(dist-mean(dist)))/sum((speed-mean(speed))^2)
b
a = mean(dist)-b*mean(speed)
a


ggplot(NULL,aes(x=x,y=y)) +
  geom_point(shape=4,size=1) +
  geom_abline(intercept=a,slope=b) +
  geom_rect(aes(xmin=x,xmax=x+residuals,
                ymin=y,ymax=y+residuals),
            fill="green",alpha=0.5) +
  coord_fixed() +
  xlim(3,17) +
  ylim(3,12)


