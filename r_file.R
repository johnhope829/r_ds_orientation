library(tidyverse)

# Question 1

numbers = data.frame(number = seq(1,999))

factors <- numbers %>%
  filter(number %% 3 == 0 | number %% 5 == 0)

paste('question 1: ', sum(factors) )

# Question 2

x <- 0
y <- 1
z <- 0
fibonacci = list(1)

while (x < 4000000) {
  y = y + fibonacci[z-1]
  fibonacci.append(y)
  z = z + 1
  x = max(fibonacci)
}
#dberifb

even_fibonacci =
  paste('question 2: ', sum(even_fibonacci) )
  
