library(tidyverse)
library(gridExtra)
library(grid)

# poisson distribution
poisson <- data_frame(
  values = rpois(10000, lambda = 5)
  )

# binomial distribution
binomial <- data_frame(
  values = rbinom(10000,10,0.5)
)

# uniform distribution
uniform <- data_frame(
  values = runif(10000,0,1)
)

# plot distributions

poisson_plot <- ggplot(poisson, aes(x = values)) +
  geom_histogram(bins = 20, color = 'black', fill = 'lightblue') +
  labs(x = 'Value', y = 'Count', title = 'Poisson Distribution (Lambda = 5)') +
  theme_minimal()

binomial_plot <- ggplot(binomial, aes(x = values)) +
  geom_histogram(bins = 15, binwidth = 1, color = 'black', fill = 'lightblue') +
  labs(x = 'Value', y = 'Count', title = 'Binomial Distribution (n = 10, p = 0.5)') +
  theme_minimal()

uniform_plot <- ggplot(uniform, aes(x = values)) +
  geom_histogram(bins = 20, binwidth = 0.05, color = 'black', fill = 'lightblue') +
  labs(x = 'Value', y = 'Count', title = 'Uniform Distribution') +
  scale_x_continuous(limits = c(0,1)) +
  theme_minimal()

plot_final <- grid.arrange(poisson_plot, 
                           binomial_plot, 
                           uniform_plot, 
                           ncol=2, 
                           top = textGrob('Probability Distributions')
                           )