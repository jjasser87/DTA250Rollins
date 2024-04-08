# Load the tidyverse
library(tidyverse)

# Read the following dataset
df <- read.csv("https://raw.githubusercontent.com/JaySquare87/DTA395-1Rollins/main/Midterm/songs_normalize.csv", header = TRUE, sep = ",")

# Question 1 ----
# 5 points

# Extract the 5th row of the "popularity" column using brackets []
popularity_5th <- df[5,6]

# Extract rows 5 to 10 and 20 to 22 of the following columns:
# "danceability", "energy", "key", and "loudness" using brackets []
rows_5_to_10_20_to_22 <- df[c(5:10,20:22),c(7:10)]

# Multiply popularity_5th by rows_5_to_10_20_to_22
result <- popularity_5th * rows_5_to_10_20_to_22

# What is the class of popularity_5th?
class_popularity_5th <- class(popularity_5th)

# The class of popularity_5th can also be considered numeric.
# Anser TRUE or FALSE in the variable below
class_popularity_5th_is_numeric <- TRUE

# Question 2 ----
# 10 points

# Create a scatter plot of the "danceability" and "energy" columns of the dataset. 
# Use the ggplot() function to create the plot.
# Set the data parameter to the "df" dataset.
# Set the mapping parameter to aes() function to specify the x-axis and y-axisvariables. 
# Inside the aes() function, set the x parameter to the "danceability" column of the dataset
# and the y parameter to the "energy" column of the dataset. 
# Add a + sign after the ggplot() function. 
# Use the geom_point() function to add a scatter plot to the ggplot() function. 
# Add a + sign after the geom_point() function.
# Add a geom_smooth() layer to the ggplot() function to add a linear regression line to the scatter plot.
# Set the method parameter to "lm" to specify the linear regression method.
# Add a + sign after the geom_smooth() function.
# Add a facet_wrap() function to the ggplot() function to add a facet to the scatter plot.
# Set the formula parameter to "~ key" to specify the facet variable.
# Add a + sign after the facet_wrap() function.
# Use the labs() function to add a title to the ggplot() function. 
# Inside the labs() function, set the title parameter to "Scatter Plot of Danceability and Energy". 
# Set the x parameter to "Danceability".
# Set the y parameter to "Energy".

library(ggplot2)

plot <- ggplot(df, aes(x = danceability, y = energy)) +
  geom_point() +  
  geom_smooth(method = "lm") +  
  facet_wrap(~ Species) +
  labs(title = "Scatter Plot of Danceability and Energy",  
       x = "Danceability",
       y = "Energy")

plot

# Question 3 ----
# 5 points

# Create a function that will take two parameters, dance and energy.
# The function should calculate the average of both parameters.
# If the calculated average is greater than 0.5, the function should return "High".
# If the calculated average is less than or equal to 0.5, the function should return "Low".
# you should call the function average_dance_energy() with two entries from the df dataset.
# example: average_dance_energy(df$danceability[1], df$energy[1])

average_dance_energy <- function(dance, energy){
  if(mean(dance, energy) > 0.5) {
    print("High")
  } else {
    print("Low")
  }
}
  

test1 <- average_dance_energy(df$danceability[1], df$energy[1])

test2 <- average_dance_energy(df$danceability[169], df$energy[169])

# Question 4 ----
# 10 points

# Select the following columns from the dataset: 
# "artist", popularity", "danceability", and "energy"
# Use the select() function to select the columns.
# Filter and get all the rows that has an energy of 0.5 or greater.
# Use the filter() function to filter the dataset.
# group by the "artist" column and calculate the average of the 
# "popularity", "danceability", and "energy" columns.
# Use the group_by() and summarize() functions to group by the "artist" column and calculate the average of the specified columns.
# Finally, arrange the dataset in descending order of the "popularity" column.

q4df <- df %>% 
  select(artist, popularity, danceability, energy) %>%
  filter(energy > .5) %>%
  group_by(artist) %>%
  summarize(avg_popularity <- mean(popularity, ra.rm = TRUE)
            ,mean(danceability, ra.rm = TRUE)
            ,mean(energy, ra.rm = TRUE)) %>%
  arrange(desc(avg_popularity))
  

q4df # to check your answer

# Write in the name as a character of the artist with the highest average popularity in the following variable
most_popular_artist <- q4df$artist[1]
