# Question 1: 
# Draw boxplots to compare top 10 male and female tennis players on the basis of age
# (instead of height). Notice the “outlier” female indicated by a single dot — who is
# that? Check back to where we entered this dataset using the tribble() function.

# Answer
library(tidyverse)

tennis = tribble(
  ~name, ~rank, ~age, ~height, ~weight, ~gender,
  #--------------|---|---|----|---|----|
  "Nadal", 1, 33, 1.85, 85, "M",
  "Djokovic", 2, 32, 1.88, 77, "M",
  "Federer", 3, 38, 1.85, 85, "M",
  "Medvedev", 4, 23, 1.98, 83, "M",
  "Theim", 5, 26, 1.85, 79, "M",
  "Tsitsipas", 6, 21, 1.93, 89, "M",
  "Zverev", 7, 22, 1.98, 90, "M",
  "Berrettini", 8, 23, 1.96, 95, "M",
  "Bautista Agut", 9, 31, 1.83, 75, "M",
  "Monfils", 10, 33, 1.93, 85, "M",
  "Barty", 1, 23, 1.66, 62, "F",

  "Pliskova", 2, 27, 1.86, 72, "F",
  "Halep", 3, 28, 1.68, 60, "F",
  "Osaka", 4, 22, 1.80, 69, "F",
  "Svitolina", 5, 25, 1.74, 60, "F",
  "Andreescu", 6, 19, 1.70, 60, "F",
  "Bencic", 7, 22, 1.75, 63, "F",
  "Kvitova", 8, 29, 1.82, 68, "F",
  "Williams", 9, 38, 1.75, 72, "F",
  "Bertens", 10, 28, 1.82, 74, "F"
)
print(tennis)
view(tennis)

ggplot(tennis, aes(x=age)) + geom_boxplot()


# Question: 2
# Try adding “coord_flip()” to the plotting command (so that the 𝑥-axis is now the
# vertical axis and the 𝑦-axis is now the horizontal axis).

# answer
ggplot(tennis, aes(y=age)) + geom_boxplot()



# Question: 3
# Draw boxplots to compare the body mass index (BMI) of male and female tennis
# players (see https://en.wikipedia.org/wiki/Body_mass_index). Are any of these
# players “underweight” or “overweight”?

