# install.packages("tidyverse")
# installed.packages()
# ggplot --> to make charts, graph
library(tidyverse)
data = mpg
view(data)
head(data)
#creating geometry graph , aes = aesthetic point (connect point between two x and y lines)
ggplot(data = mpg) +
   geom_point(mapping = aes(x=displ, y=hwy, colour=class, size=cyl))


