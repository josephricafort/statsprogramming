# Link to full activity here: 
# https://s3.us-west-2.amazonaws.com/secure.notion-static.com/96954b01-a35a-4a20-ac7c-c2e6e4faaaa6/activity.pdf?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Content-Sha256=UNSIGNED-PAYLOAD&X-Amz-Credential=AKIAT73L2G45EIPT3X45%2F20221104%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20221104T134812Z&X-Amz-Expires=86400&X-Amz-Signature=e8cc95d6c3bef1a1551d5baabb5244c761b5ca2c280b32bf79ee1be6713ff04b&X-Amz-SignedHeaders=host&response-content-disposition=filename%3D%22activity.pdf%22&x-id=GetObject

# Activity
# Think of a random variable constructed by transforming with a certain non-liner function
# 𝑓 a categorical, binomial, Poisson or Gaussian random variable.
# • Take a sample of size 50, save it into a variable x.
# • You can calculate the mean of this sample using function mean(). Repeat the previous
# steps different times, for example 1000. Obtaining different means coming from different
# samples.
# • Visualize the means observed in the previous simulation.
# • If you only had sample x (the initial 50 observations), what would be a reasonable value
# can you think about a region where 𝔼[𝑌 ] is likely to be?
#   For example, the random variable obtained after transforming with the function 𝑠𝑖𝑛 a binomial
# distribution.

library(tidyverse)

set.seed(1)
rv_data <- tibble()
for(i in 1:1000){
  x <- sample(1:5, size = 50, prob = c(1/5, 2/5, 1/5, 2/5, 1/5), replace=TRUE)
  rv_data <- bind_rows(rv_data,
                       tibble(i = i, mean = mean(x)))
}
# replicate(1000, mean(sample(1:5, size = 50, prob = c(1/5, 2/5, 1/5, 2/5, 1/5), replace=TRUE)))

ggplot(data = rv_data, aes(x = mean)) +
  geom_histogram(binwidth = 0.1)

# The region where E[Y] be would more likely be at the mean or center
