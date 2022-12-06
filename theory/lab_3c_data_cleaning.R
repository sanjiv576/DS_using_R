
library(tidyverse)
# rvest - pronounced as 'Harvest', takes inspiration from web scraping library beautiful Soup which comes from Python
# rvest - helps to scrap the data from web page
library(rvest)

# strings are not glamours, high profile components of R , but they do play big role in data cleaning and data prepartaion
library(stringr)

# tidyr - used to remove duplication
library(tidyr)

# lubridate for manipulating date format
library(lubridate)
url = "http://espn.go.com/nfl/superbowl/history/winners" 
page = read_html(url)
page

sb_table = html_nodes(page, 'table') 
sb_table
sb = html_table(sb_table)[[1]]
sb
view(sb)


# now cleaning the data frame
sb = sb[c(-1,-2),]
view(sb)
names(sb) = c("number", "date", "site", "result")
sb = as_tibble(sb)
sb

# muta
mutate(sb,number=1:nrow(sb))

# changing date 
mutate(sb,date=mdy(date))


separate(sb,site,c("stadium","city",NA),sep='[()]')

separate(sb,result,c("winner","loser"),sep=', ')

# for separating using space
pattern = ' \\d+$' 
separate(sb,result,c("winner","loser"),sep=', ') %>%
  mutate(winnerscore=as.numeric(str_extract(winner,pattern))) %>% 
  mutate(winner=gsub(pattern,"",winner))


# Pipe
pattern = ' \\d+$'
sb %>%
  
# separating winning score fro m data frame
mutate(number=1:nrow(sb)) %>%
  mutate(date=mdy(date)) %>% 
  separate(site,c("stadium","city",NA),sep='[()]') %>% 
  separate(result,c("winner","loser"),sep=', ') %>% 
  mutate(winnerscore=as.numeric(str_extract(winner,pattern))) %>% 
  mutate(winner=gsub(pattern,"",winner))


# Exercises
# 
# (a) Complete the pipe above to separate the losing team from the losing score.

pattern = ' \\d+$'
sb %>%
  mutate(number=1:nrow(sb)) %>%
  mutate(date=mdy(date)) %>% 
  separate(site,c("stadium","city",NA),sep='[()]') %>% 
  separate(result,c("winner","loser"),sep=', ') %>% 
  mutate(loswerScore=as.numeric(str_extract(loser,pattern))) %>% 
  mutate(loser=gsub(pattern,"",loser))


# (b) Append to the pipe to plot a scatterplot of date vs margin of win (winner score minus loser score).

pattern = ' \\d+$'
sb %>%
  mutate(number=1:nrow(sb)) %>%
  mutate(date=mdy(date)) %>% 
  separate(site,c("stadium","city",NA),sep='[()]') %>% 
  separate(result,c("winner","loser"),sep=', ') %>% 
  mutate(loswerScore=as.numeric(str_extract(loser,pattern))) %>% 
  mutate(loser=gsub(pattern,"",loser)) %>% 
  mutate(winnerscore=as.numeric(str_extract(winner,pattern))) %>% 
  mutate(winner=gsub(pattern,"",winner)) %>% 
  mutate(gap=winnerscore-loswerScore) %>% 
  ggplot(aes(x=date, y=gap)) + geom_point()

