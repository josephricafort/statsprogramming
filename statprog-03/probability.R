library(nycflights13)
library(tidyverse)

flights <-  sample_n(flights, aes(x=origin, size=1000))
ggplot() +
  geom_boxplot(data=flights, aes(x=origin, y=dep_delay)) +
  scale_y_continuous(trans = 'log', breaks = 10^(0:3)) +
  theme_minimal()

library(bbplot)

set.seed(1)
x <- rnorm(100)
x
boxplot(x)
median(x)
quantile(x, 0.25)
quantile(x, 0.75)
max(x)
min(x)