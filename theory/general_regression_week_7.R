library(tidyverse)
library(ISLR)
credit = as_tibble(Credit)
credit = select(credit,Balance,Limit,Income)
credit
summary(credit)

library(GGally)
ggscatmat(select(credit,Balance,Limit,Income))

ggplot(credit, aes(x=Limit,y=Balance)) + geom_point() + geom_smooth(method="lm",se=FALSE)
# here, Balance is the response, Limit is the predictor
model = lm(Balance~Limit, data=credit)
summary(model)
model$coefficients

# Exercise.
# Plot a scatterplot of “Balance~Income” and fit a linear model using lm(). 
# What is the corresponding 𝑅2 value? Is this better or worse than the 𝑅2 value for “Balance~Limit”?

ggplot(credit, aes(x=Income, y=Balance)) + geom_point() + geom_smooth(method = "lm", se=FALSE)
model = lm(Balance~Income, data = credit)
summary(model)

# Multiple R-squared value of Balance~Income is 0.215.
# we know, higher the Multiple R-squared value is better, since Multiple-R squared value by Balance~Income
# is smaller (i.e 0.215) than Balance~Limit (i.e 0.7425) so R2 value of Balance~Income is worse than Balance~Limit

model = lm(Balance~Limit+Income, data=credit) 
summary(model)


library(ggfortify)
autoplot(model)


# Exercise. 
# The credit card data set also has variables for credit rating and age.
# Compare the models “Balance~Rating”, “Balance~Age” and “Balance~Rating+Age” in terms of 𝑅2 value.

credit = as_tibble(Credit)
credit = select(credit,Balance,Limit,Income,Rating,Age)

credit
balance_rating_model = lm(Balance~Rating, data = credit)
summary(balance_rating_model)
# here, p-value of Balance~Rating is 2.2e-16

age_balance_model = lm(Balance~Age, data = credit)
summary(age_balance_model)
autoplot(age_balance_model)
# here, p-value of Balance~AGe is 0.9708

rating_balance_age = lm(Balance~Rating+Age, data = credit)
summary(rating_balance_age)
autoplot(rating_balance_age)
# here, p-value of Balance~Rating+Age is 2.2e-16
# Since, p-value of Balance~Age is higher than others p-value so, Balance~Age is better than others.
