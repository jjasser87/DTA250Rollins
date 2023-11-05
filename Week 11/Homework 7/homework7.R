# DTA250 - Fall 2023
# Homework 7
# Gollum... Gollum...

# This homework is heavily dependent on the maps_solved.R file from Week 10.
# You will need to use the code from that file to complete this homework.

# Load the tidyverse package

# Load the maps package

# Load the us.cities dataset

# Question 1 ----

# Define a function that takes a state name and abbreviation as input
# and plots the cities in that state, with point size proportional to population
plot_state_cities <- function(state_name, state_abbr) {
    
    # Load the us.cities data
    # Filter the data to only include cities in the specified state
    # The column name for the state in this dataset is country.etc
    # Always check the column names of a dataset before using it
    # Select the name, lon, lat, and pop columns
    # Store the data in a variable named state_cities

    
    # Load the county data for the specified state
    # From that data select() the lon, lat, group, and subregion columns
    # Rename the long column to lon and the subregion column to county
    # Store the data in a variable named state_counties

    
    # Plot the data in state_cities using ggplot()
    # Use aes() to set the x-axis to lon and the y-axis to lat
    # Use geom_polygon() to plot the county data
    # Use geom_point() to plot the data
    # Inside geom_point() use aes() to set the size parameter to pop
    # Use scale_size_area() to set the size of the points
    # Use coord_quickmap() to set the coordinate system

    
}

# Example usage: plot cities in Florida
plot_state_cities("florida", "FL")


# Question 2 ----

# Rewrite the above function to plot the cities within a specific population range
# The function should take a state name, state abbreviation, and population range
# as input
# The population range should be a vector of length 2
# The first element of the vector should be the lower bound of the range
# The second element of the vector should be the upper bound of the range

# Define a function that takes a state name, state abbreviation, and population range as input
# and plots the cities in that state within the specified population range, with point size proportional to population
plot_state_cities_range <- function(state_name, state_abbr, pop_range) {
    
    # Load the us.cities data
    # Filter the data to only include cities in the specified state
    # The column name for the state in this dataset is country.etc
    # Always check the column names of a dataset before using it
    # Select the name, lon, lat, and pop columns
    # Filter the data to only include cities within the specified population range
    # Store the data in a variable named state_cities

    
    # Load the county data for the specified state
    # From that data select() the lon, lat, group, and subregion columns
    # Rename the long column to lon and the subregion column to county
    # Store the data in a variable named state_counties

    
    # Plot the data in state_cities using ggplot()
    # Use aes() to set the x-axis to lon and the y-axis to lat
    # Use geom_polygon() to plot the county data
    # Use geom_point() to plot the data
    # Inside geom_point() use aes() to set the size parameter to pop
    # Use scale_size_area() to set the size of the points
    # Use coord_quickmap() to set the coordinate system

    
}

# Example usage: plot cities in Florida with population between 100000 and 500000
plot_state_cities_range("florida", "FL", c(100000, 500000))