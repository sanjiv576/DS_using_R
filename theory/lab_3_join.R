

# We use types of JOIN statement only for merging data. 
# There are two types of JOIN statement i.e Mutating join  and Filtering join.

# Mutating join statement includes(inner_join, left_join, right_join, full_join)
# Filtering join includes semi_join, anti_join

# install.packages("dplyr")

library(dplyr)

data_1 = data.frame(ID=1:2, x1 = c("a1", "b1"), stringsAsFactors = FALSE)
data_1
data_2 = data.frame(ID=2:3, x2= c("a2", "b2"), stringsAsFactors = FALSE)
data_2

# inner_join --> shows common data
# outer_join ==> removes common data and show
inner_join(data_1, data_2, by="ID")

left_join(data_1, data_2, by="ID")
right_join(data_1, data_2, by="ID")

full_join(data_1, data_2, by="ID")



# ------------------- FILTERING JOIN STATEMENT ----------------------------
# Syntax:
# semi_join(x,y,by="..")

semi_join(data_1, data_2, by="ID")
semi_join(data_2, data_1, by="ID")

# Syntax:
# anti_join(x,y,by="..")

anti_join(data_1, data_2, by="ID")
anti_join(data_2, data_1, by="ID")
