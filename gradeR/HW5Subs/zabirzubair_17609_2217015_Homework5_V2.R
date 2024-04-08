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

il_filter <- midwest |>
  filter(state == "IL")

# There is a column called percollege in the midwest dataset
# Can you find the average of the percollege column for the filtered dataset (il_filter)?
# Use the mean() function
  
il_filter_percollege <- il_filter |>
  summarize(avg_percollege = mean(percollege))

print(il_filter_percollege)
  
# Can you find the average of the percollege column for the all states in the
# midwest dataset?
# Use the group_by() and summarize() functions. (You don't need the filter()
# function anymore)
  
all_states_percollege <- midwest |>
  group_by(state) |>
  summarize(avg_percollege = mean(percollege))

print(all_states_percollege)
# Can you find the average of the percollege column and the average of the
# percbelowpoverty column for the all states in the midwest dataset?
  
avg_percollege_percbelowpoverty <- midwest |>
  summarize (avg_percollege = mean(percollege),
             avg_perbelowpoverty = mean(percbelowpoverty))

print(avg_percollege_percbelowpoverty)
  
# calculate the median population (popadults) for each state. use the median() function

median_popadults <- midwest |>
  group_by(state) |>
  summarize(median_popadults = median(popadults))

print(median_popadults)

# Calculate the standard deviation for the percchildbelowpovert and 
# percbelowpoverty columns for each state. Use the sd() function

std_dev_percchildbelowpovert_percbelowpoverty <- midwest |>
  group_by(state) |>
  summarize(sd_percchildbelowpovert = sd(percchildbelowpovert),
            sd_percbelowpoverty = sd(percbelowpoverty))

print(std_dev_percchildbelowpovert_percbelowpoverty)
  
# Iris dataset
?iris # to see the structure of the dataset

# Use the filter() function to filter the iris dataset to only include observations
# where the Species column is equal to "setosa"

setosa_filter <- iris |>
  filter(Species == "setosa")

print(setosa_filter)

# Can you find the average of the Sepal.Length column for the filtered dataset (setosa_filter)?
# Use the mean() function

setosa_filter_avg_sepal_length <- setosa_filter |>
  summarize(avg_sepal_length = mean(Sepal.Length))

print(setosa_filter_avg_sepal_length)

# Can you find the average of the Sepal.Width column for each species in the iris dataset?
# Use the group_by() and summarize() functions.

sep_width_avg_by_species <- iris |>
  group_by(Species) |>
  summarize(avg_sepal_width = mean(Sepal.Width))

print(sep_width_avg_by_species)

# Can you find the average of the Sepal.Length column and the average of the
# Petal.Length column for each species in the iris dataset?
avg_sepal_length_petal_length_by_species <- iris |>
  group_by(Species) |>
  summarize(avg_sepal_length = mean(Sepal.Length),
            avg_petal_length = mean(Petal.Length))

print(avg_sepal_length_petal_length_by_species)

# Mtcars dataset
?mtcars # to give you an idea of the columns in the mtcars dataset

# Filter the cars that has more than 100 horsepower
more_than_100_hp <- mtcars |>
  filter(hp > 100)

print(more_than_100_hp)

# Filter the cars that has more than 100 horsepower and has more than 4 cylinders

more_than_100_hp_more_than_4_cyl <- mtcars |>
  filter(hp > 100, cyl > 4)

print(more_than_100_hp_more_than_4_cyl)

# Filter the cars that has more than 100 horsepower, less than 20 miles per gallon
# and has more than 6 cylinders. Arrange them by miles per gallon in descending order
more_than_100_hp_less_than_20_mpg_more_than_6_cyl <- mtcars |>
  filter(hp > 100, mpg < 20, cyl > 6) |>
  arrange(desc(mpg))

print(more_than_100_hp_less_than_20_mpg_more_than_6_cyl)

# Calculate the average miles per gallon for each number of cylinders

avg_mpg_by_cyl <- mtcars |>
  group_by(cyl) |>
  summarize(avg_mpg = mean(mpg))

print(avg_mpg_by_cyl)

# Calculate the average miles per gallon for each number of cylinders and each number of gears

avg_mpg_by_cyl_gear <- mtcars |>
  group_by(cyl, gear) |>
  summarize(avg_mpg = mean(mpg))

print(avg_mpg_by_cyl_gear)

# Calculate the average miles per gallon for each number of cylinders and each number of gears
# and each number of carburetors. Arrange them by the number of cylinders in ascending order

avg_mpg_by_cyl_gear_carb <- mtcars |>
  group_by(cyl, gear, carb) |>
  summarize(avg_mpg = mean(mpg)) |>
  arrange(cyl)

print(avg_mpg_by_cyl_gear_carb)
