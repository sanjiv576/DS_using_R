
# builtin function to read csv file
# myData = read.csv("/Users/user/Desktop/info.csv")

# Using tidyverse librabry to read csv file

library (tidyverse)
# myData = read_csv("/Users/user/Desktop/info.csv")
# myData

coronaData = read_csv("/Users/user/Downloads/CovidLive.csv")
coronaData
view(coronaData)


# Directly opening internet files

library(tidyverse)
url = "https://raw.githubusercontent.com/fivethirtyeight/data/master/unisex-names/unisex_names_table.csv"
data = read_csv(url)
data

ggplot(data, aes(y=male_share)) +
  geom_boxplot()

view(arrange(data,gap))
summary(data)
nrow(distinct(data))
ncol(data)
dim(data)
# for practice

library(tidyverse)
flightUrl = ("https://raw.githubusercontent.com/fivethirtyeight/data/master/airline-safety/airline-safety.csv")
flightData = read_csv(flightUrl)

View(flightData)












