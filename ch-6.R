1:50

?sqrt

require(stats) # for spline
require(graphics)
xx <- -9:9
plot(xx, sqrt(abs(xx)),  col = "red")
lines(spline(xx, sqrt(abs(xx)), n=101), col = "pink")

# Multiplication before addition
3 * 5 + 6 

# Division before subtraction
2 / 2 - 7


1 * 2 # This comment is possible

# This comment is preferred
2 * 1


# What is the absolute value of -100?
abs(-100)


# These aren't going to work!
ABS(-100)
Abs(-100)

# Convert to upper case
toupper('I love R')

# Is 3> 4?
3 > 4

# Assigning an object in R
my_first_object = abs(-100)


# Printing an object in R
my_first_object


my_second_object <- sqrt(abs(-5 ^ 2))
my_second_object

my_char <- 'Hello, world' 
my_other_char <- "We're able to code R!" 
my_num <- 3
my_other_num <- 3.21
my_int <- 12L 
my_logical <- FALSE
my_other_logical <- F

 
str(my_char)
str(my_num)
str(my_int)
str(my_logical)

# Is my_num equal to 5.5?
my_num == 5.5

# Number of characters in my_char
nchar(my_char)


my_other_num <- 2.2
my_num <- my_num/my_other_num
my_num


#install.packages('tidyverse')

?arrange

library(tidyverse)

?arrange

update.packages()


install.packages('installr')
library(installr)
updateR()

getwd()

file.exists("test-file.csv")

file.exists("test-folder/test-file.csv")

read_csv("datasets/star/districts.csv")

# assign the distrit data to a variable

district <- read_csv("datasets/star/districts.csv")

district
library(readxl)

star <-  read_xlsx("datasets/star/star.xlsx")
star

excel_sheets("datasets/star/star.xlsx")

read_excel("datasets/star/star.xlsx", range = cell_rows(1:10))

view(star)

glimpse(star)

library(psych)

describe(star)

?describe

star[2:3, 1:3] # second row through the third column.

star[2:3, 1:6]

star[, c(1,3)]

star$treadssk

is.vector(star$treadssk)

 my_vector <-  c(1, 2, 3, 4, 5)

 my_vector[c(1,4)]

 x <-  c(1, 2, 3, 4)
 x
 
 y <-  c(TRUE, FALSE, TRUE, FALSE)
 y
 
 z <-  x * y
 
 
 head(star)

 select(star, treadssk, tmathssk, schidkn) 

 select(star, -treadssk, -tmathssk, -schidkn) 

 select(star, -c(treadssk, tmathssk, schidkn)) 

 star <-  select(star, tmathssk:totexpk)
 star
 
 star <-  mutate(star, newcolumn = tmathssk + treadssk)
 star
 
 star <-  rename(star, ttl_score = newcolumn)
 star
 
 arrange(star, desc(classk), treadssk)

 filter(star, classk == "small.class") 

 filter(star, treadssk >= 500) 

 filter(star, classk == "small.class" & treadssk >= 500) 

 star_grouped <-  group_by(star, classk) 
 star_grouped 

 summarise(star_grouped, avg_math = mean(tmathssk)) 

 star <-  read_excel("datasets/star/star.xlsx")
 star
 
 districts <-  read_csv("datasets/star/districts.csv")
 districts
 
 # left outer join star on districts
 
 left_join(select(star, schidkn, tmathssk, treadssk), 
           districts )

 
 