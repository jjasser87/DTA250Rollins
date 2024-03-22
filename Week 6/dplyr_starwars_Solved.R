# Load necessary libraries
library(tidyverse)

#TODO
# Load the Star Wars dataset to explore basic data manipulation verbs with dplyr.
data(starwars)


#TODO
# Use the dim() function to get the dimensions of the starwars dataset.
dim(starwars)


# Rows:
#   filter() chooses rows based on column values.
#   slice() chooses rows based on location.
#   arrange() changes the order of the rows.
# Columns:
#   select() changes whether or not a column is included.
#   rename() changes the name of columns.
#   mutate() changes the values of columns and creates new columns.
#   relocate() changes the order of the columns.
# Groups of rows:
#   summarise() collapses a group into a single row.

#TODO
# Use the filter() function to choose rows where skin_color is light
# and eye_color is brown

# Without pipeline
filter(starwars, skin_color == "light" & eye_color == "brown")

# With pipeline
# The pipeline takes the previous result and passes it as an input to the next
# operation
starwars %>%
  filter(skin_color == "light" & eye_color == "brown")

# The new pipeline
starwars |>
  filter(skin_color == "light" & eye_color == "brown")


#TODO
# Use the arrange() function to change the order of the rows by height and mass

starwars |>
  arrange(height, mass)


#TODO
# Use the arrange() function to change the order of the rows by height in
# descending order

starwars |>
  arrange(desc(height))


#TODO
# Use the slice() function to get characters from row numbers 5 through 10

starwars |>
  slice(5:10)


#TODO
# Use the slice_head() function to get the first 3 rows of the starwars dataset

starwars |>
  slice_head(n = 3)

starwars |>
  head(n=3)


#TODO
# Use the slice_tail() function to get the last 3 rows of the starwars dataset

starwars |>
  slice_tail(n=3)

#TODO
# Use the slice_sample() function to get a random sample of 5 rows from the 
# starwars dataset

starwars |>
  slice_sample(n=5)


#TODO
# Use the slice_sample() to get a proportionate random sample of 10% of the
# starwars dataset

starwars |>
  slice_sample(prop=0.1)


#TODO
# Use the filter() function to remove rows where height is NA
# Use the slice_max() function to get the top 3 tallest characters

starwars |>
  filter(!is.na(height)) |>
  slice_max(order_by = height, n=3)


#TODO
# Use the select() function to select the hair_color, skin_color, and eye_color
# columns

starwars |>
  select(hair_color, skin_color, eye_color)


#TODO
# Repeat the last TODO.
# However, this time, use the : operator to select the same columns

starwars |>
  select(hair_color:eye_color)


#TODO
# Use the select() function to select all columns except for hair_color,
# skin_color, and eye_color

starwars |>
  select(!c(hair_color:eye_color))

starwars |>
  select(-c(hair_color:eye_color))

#TODO
# Use the select() function to select the column homeworld.
# However, rename the column to planet.
# Notice that this will only change the name of the column in the output, not
# the original dataset.

starwars |>
  select(planet = homeworld)


#TODO
# Use the rename() function to rename the column homeworld to planet in the
# starwars dataset
# Notice that this will change the name of the column in the original dataset.

starwars |>
  rename(planet = homeworld) |>
  select(planet)

starwars <- starwars |>
  rename(planet = homeworld)


#TODO
# Use the mutate() function to create a new column called bmi.
# The bmi column should be calculated as mass / (height/100)^2
# Notice that this will only create the new column in the output, not the
# original dataset.

starwars |>
  mutate(bmi = mass / (height/100)^2) |>
  select(bmi, height, mass)




# TODO
# In order to create the bmi column in the original dataset, you need to use the
# <- operator to assign the output of the mutate() function to the starwars
# dataset.

starwars <- starwars |>
  mutate(bmi = mass / (height/100)^2)

starwars

#TODO
# We can't see the new bmi column in the starwars dataset because it's too wide.
# Use the relocate() function to move the bmi column to be before the height
# column. Use the .before argument to specify the column before which to place
# the bmi column.

starwars <- starwars |>
  relocate(bmi, .before = height)


#TODO
# Use the summarise() function to calculate the average height of the characters
# in the starwars dataset.
# remove the NA values from the height column before calculating the average.
# Use the na.rm argument to remove NA values.
# Call the new column avg_height.

starwars |>
  summarise(avg_height = mean(height, na.rm = TRUE))

starwars |>
  summarise(max_mass = max(mass, na.rm = TRUE))


#TODO
# Use the group_by() function to group the starwars dataset by species and sex
# Followed by the select() function to select the height and mass columns
# Followed by the summarise() function to calculate the average height and mass
# of the characters in each group. Make sure to remove NA values from the height
# and mass columns before calculating the average.

starwars |>
  group_by(species, sex) |>
  select(height, mass) |>
  summarise(avg_height = mean(height, na.rm = T), 
            avg_mass = mean(mass, na.rm = T))
