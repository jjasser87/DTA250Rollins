install.packages("tidyverse")

# Load the tidyverse library
library(tidyverse)

# Load the midwest dataset
data(midwest)
data(mtcars)
data(iris)

# midwest dataset
?midwest # to see the structure of the dataset

# Use the filter() function to filter the midwest dataset to only include
# observations where the state column is equal to "IL"

il_filter = midwest %>%
  filter(state == "IL")


# There is a column called percollege in the midwest dataset
# Can you find the average of the percollege column for 
# the filtered dataset (il_filter)?
# Use the mean() function
  
il_filter_percollege <- mean(il_filter$percollege)
  
# Can you find the average of the percollege 
# column for the all states in the
# midwest dataset?
# Use the group_by() and summarize() functions. 
# (You don't need the filter()
# function anymore)
  
all_states_percollege <- midwest %>%
group_by(state) %>%
  summarize(average_college = mean(percollege, na.rm = T
                                   ))


# Can you find the average of the percollege column and the average of the
# percbelowpoverty column for the all states in the midwest dataset?
  
midwest_avg_stats <- midwest %>%
  group_by(state) %>%
  summarize(avg_percollege = mean(percollege, na.rm = TRUE),
            avg_percbelowpoverty = mean(percbelowpoverty, na.rm = TRUE))



  
# calculate the median population (popadults) for 
# each state. use the median() function

median_popadults <- median(midwest$popadults)

  

# Calculate the standard deviation for the percchildbelowpovert and 
# percbelowpoverty columns for each state. Use the sd() function

std_dev_percchildbelowpovert_percbelowpoverty <- midwest %>%
  group_by(state) %>%
  summarize(percchildbelowpovert = sd(percchildbelowpovert, na.rm = TRUE),
            percbelowpoverty = sd(percbelowpoverty, na.rm = TRUE))

  
# Iris dataset
?iris # to see the structure of the dataset

# Use the filter() function to filter the iris dataset 
# to only include observations
# where the Species column is equal to "setosa"

setosa_filter <- iris %>%
  filter(Species== "setosa")

# Can you find the average of the Sepal.Length 
# column for the filtered dataset (setosa_filter)?
# Use the mean() function

setosa_filter_avg_sepal_length <- mean(setosa_filter$Sepal.Length)

# Can you find the average of the Sepal.Width 
# column for each species in the iris dataset?
# Use the group_by() and summarize() functions.
sep_width_avg_by_species <- iris %>%
  group_by(Species)%>%
  summarise(avg_sepal_width = mean(Sepal.Width))


# Can you find the average of the Sepal.Length column 
# and the average of the
# Petal.Length column for each species in the iris dataset?
avg_sepal_length_petal_length_by_species <- iris %>%
  group_by(Species)%>%
  summarise(avg_sepal_length = mean(Sepal.Length),
            avg_petal_length = mean(Petal.Length))


# Mtcars dataset
?mtcars # to give you an idea of the columns in the mtcars dataset

# Filter the cars that has more than 100 horsepower
more_than_100_hp <- filter(mtcars, hp>100)

# Filter the cars that has more than 100 horsepower 
# and has more than 4 cylinders
more_than_100_hp_more_than_4_cyl <- filter(mtcars, cyl>4 & hp>100)

# Filter the cars that has more than 100 horsepower, 
#less than 20 miles per gallon
# and has more than 6 cylinders. 
#Arrange them by miles per gallon in descending order
filtered <- 

more_than_100_hp_less_than_20_mpg_more_than_6_cyl <- filter(mtcars, cyl>6 & hp>100 & mpg<20) %>% 
  arrange(desc(mpg))

# Calculate the average miles per gallon for each number of cylinders
avg_mpg_by_cyl <- mtcars %>%
  group_by(cyl) %>%
  summarise(average_mpg = mean(mpg))

# Calculate the average miles per gallon for 
# each number of cylinders and each number of gears
avg_mpg_by_cyl_gear <- mtcars %>%
  group_by(cyl, gear) %>%
  summarise(average_mpg = mean(mpg))

# Calculate the average miles per gallon for each number 
# of cylinders and each number of gears
# and each number of carburetors. Arrange them 
# by the number of cylinders in ascending order
avg_mpg_by_cyl_gear_carb <- mtcars %>%
  group_by(cyl, gear) %>%
  summarise(average_mpg = mean(mpg)) %>%
  arrange(cyl)


