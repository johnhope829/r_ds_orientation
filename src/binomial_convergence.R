library(tidyverse)
library(gridExtra)
library(grid)

# binomial distributions, with increasing n
binomial1 <- data_frame(
  values = rbinom(1000,1,0.5)
)

binomial2 <- data_frame(
  values = rbinom(1000,10,0.5)
)

binomial3 <- data_frame(
  values = rbinom(1000,100,0.5)
)

binomial4 <- data_frame(
  values = rbinom(1000,1000,0.5)
)

binomial5 <- data_frame(
  values = rbinom(1000,10000,0.5)
)

binomial6 <- data_frame(
  values = rbinom(1000,100000,0.5)
)

# plot distributions
binomial_plot1 <- ggplot(binomial1, aes(x = values)) +
  geom_histogram(bins = 15, color = 'black', fill = 'lightblue') +
  labs(x = 'Value', y = 'Count', title = 'n = 1') +
  theme_minimal()

binomial_plot2 <- ggplot(binomial2, aes(x = values)) +
  geom_histogram(bins = 15, color = 'black', fill = 'lightblue') +
  labs(x = 'Value', y = 'Count', title = 'n = 10') +
  theme_minimal()

binomial_plot3 <- ggplot(binomial3, aes(x = values)) +
  geom_histogram(bins = 15, color = 'black', fill = 'lightblue') +
  labs(x = 'Value', y = 'Count', title = 'n = 100') +
  theme_minimal()

binomial_plot4 <- ggplot(binomial4, aes(x = values)) +
  geom_histogram(bins = 15, color = 'black', fill = 'lightblue') +
  labs(x = 'Value', y = 'Count', title = 'n = 1000') +
  theme_minimal()

binomial_plot5 <- ggplot(binomial5, aes(x = values)) +
  geom_histogram(bins = 15, color = 'black', fill = 'lightblue') +
  labs(x = 'Value', y = 'Count', title = 'n = 10000') +
  theme_minimal()

binomial_plot6 <- ggplot(binomial6, aes(x = values)) +
  geom_histogram(bins = 15, color = 'black', fill = 'lightblue') +
  labs(x = 'Value', y = 'Count', title = 'n = 100000') +
  theme_minimal()


plot_final <- grid.arrange(binomial_plot1, 
             binomial_plot2, 
             binomial_plot3,
             binomial_plot4,
             binomial_plot5,
             binomial_plot6,
             ncol=2, 
             top = textGrob('Binomial Distributions')
             )


