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

 
 # dplyr and Power of the Pipe (%>%) Operator.
 
 star %>% 
   group_by(classk) %>% 
   summarise(average_reading = mean(treadssk)) %>% 
   arrange(desc(average_reading))

 # An index column to star
 
 star_pivot <- star %>% 
   select(c(schidkn, tmathssk, treadssk)) %>% 
   mutate(index = row_number())

 star_pivot 

 # reshape the dataframe.
 
 star_long <- star_pivot %>% 
   pivot_longer(cols = c(tmathssk, treadssk), names_to = "test_type",
                values_to = "score")
 
 head(star_long)

 # Rename tmathssk and treadssk to math and reading.
 
 star_long <- star_long %>% 
   mutate(test_type = recode(test_type, 
                             tmathssk = "math",
                             treadssk = "reading"))
 
 head(star_long)

 distinct(star_long, test_type) # the distinct() confirms all rows in test_type have bee renamed.
 
 star_wide <- star_long %>% 
   pivot_wider(values_from = score,
               names_from = test_type)
 
 
  head(star_wide)

  # ggplot2
  
  ggplot(data = star,
         aes(x = treadssk)) +
    geom_histogram(bins = 25, fill = "pink")

  

  ggplot(data = star,
         aes(x = classk, y = treadssk))+
  geom_boxplot()
 
  
census_div <- read_csv("datasets/census/census-divisions.csv")
census_div

census <- read_csv("datasets/census/census.csv")
census


# combine the datasets census and cesus_div.

census_join <- cross_join(select(census_div, "postal_code", "region", "division"), # select the columns to join.
          census)

census_join

census_join <- census_join %>% 
  arrange(desc(population))

census_join

census_join[,c(2:7)]


census_join <- census_join %>% 
  mutate(density = population / land_area)

census_join

census_grouped <- census_join %>% 
  group_by(year)

tail(census_grouped)

censUs_year2015 <- census_grouped %>% 
  filter(year == 2015)

censUs_year2015

# plot the relationship between land and population.
ggplot(data = censUs_year2015,
       aes(x =land_area, y = population)) +
  geom_point()+
  xlab("Land Area")+
  ylab("Population")+
  ggtitle("Population vs Land Area")


# find the total population for each region in 2015.
# i want to get the total population for each region in 2015.


TotPopRegion <- censUs_year2015 %>%
  group_by(region) %>%
  summarise(total_population = sum(population))
  
  
TotPopRegion  
  
  
# create a table containing state names and populations for eah year 2010-2015.

census_states <- census_grouped %>%
  select(c(year, state, population)) %>% 
  mutate(ID = row_number())
  
census_states


# table for population of each year in individual column.

census_states_wide <- census_states %>%
  pivot_wider(names_from = "year", values_from = "population")

head(census_states_wide)
  
  