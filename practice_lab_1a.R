
library(tidyverse)
rank = c(1:5)
name = c("Sanjiv", "Sanju", "Santa", "Some", "Som")
height = c(34, 34,2,52,33)
weight = c(10, 20, 30, 40, 50)
gender = c(rep("M", 4), rep("F", 1))
gender
typeof(gender)
tennis = tibble(name, rank, height, weight, gender)
tennis[1,]
tennis[, "height"]
tennis$height
tennis
filter(tennis, height=="34")
typeof(tennis)
typeof(weight)
nrow(tennis)
ncol(tennis)
dim(tennis)
summary(tennis)


ggplot(tennis, aes(y=height, x=weight)) + geom_boxplot()

tennis %>%
  filter(gender=="M") %>%
  summarise(total_weight_num=n_distinct(weight),
            mean_weight=mean(weight))
  

colnames(tennis)


tennis_tribble = tribble(~rank, ~height, ~weight, ~name)
tennis_tribble
print(tennis_tribble)



W = tribble(
  ~person, ~age, ~weight, ~height,
  "Bob", 32, 128, 180,
  "Alice", 24, 86, 175,
  "Steve", 64, 95, 165
)
W


N = pivot_longer(W,-person,names_to="variable",values_to="value")
print(N)
typeof(N)


B = pivot_wider(N, names_from=variable, values_from=value)
print(B)
