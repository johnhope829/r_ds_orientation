library(tidyverse)

# Question 1

numbers = data.frame(number = seq(1,999))

factors <- numbers %>%
  filter(number %% 3 == 0 | number %% 5 == 0)

paste('question 1: ', sum(factors) )

# Question 2

x <- 0
y <- 1
z <- 2
fibonacci <- c(0,1)


while (x < 4000000) {
  y <- y + fibonacci[z-1]
  fibonacci <- c(fibonacci,y)
  z <- z + 1
  x <- max(fibonacci)
}

even_fibonacci <- fibonacci %% 2 == 0
even_fibonacci <- fibonacci[even_fibonacci]

paste('question 2: ', sum(even_fibonacci) )

# Question 3

num <- 600851475143 
x <- 2

while (x < sqrt(num)) {
  while (num %% x == 0) {
  num <- num / x
  }
x <- x + 1
}

num = as.integer(num)

paste('question 3: ', as.character(num) )

