#DTA250 - Fall 2023
#JJ

# Visualizing Maps ----

#TODO
# Install the maps package


#TODO
# Load the maps package


#TODO
# Load the tidyverse package


#TODO
# Use the map_data() function to load the county data for Florida
# From that data select() the long, lat, group, and subregion columns
# Rename the long column to lon and the subregion column to county
# Store the data in a variable named fl_counties


#TODO
# Plot the data in fl_counties using ggplot()
# Use aes() to set the x-axis to lon, the y-axis to lat, and the group to county
# Use geom_polygon() to plot the data
# Use coord_quickmap() to set the coordinate system


#TODO
# Load the us.cities data
# Filter the data to only include cities in Florida
# Select the name, long, lat, and pop columns
# Rename the long column to lon
# Store the data in a variable named fl_cities


#TODO
# Plot the data in fl_cities using ggplot()
# Use aes() to set the x-axis to lon and the y-axis to lat
# Use geom_point() to plot the data
# Use coord_quickmap() to set the coordinate system


#TODO
# Plot the data in fl_cities using ggplot()
# Use aes() to set the x-axis to lon and the y-axis to lat
# Use geom_polygon() to plot the data
# Inside geom_polygon() use aes() to set the group parameter to group
# Inside the geom_polygon() function use fl_counties as your data source
# Set the fill parameter to NA and the color parameter to "grey50"
# Use geom_point() to plot the data from fl_cities
# Inside geom_point() use aes() to set the size parameter to pop
# Inside geom_point() use color to set the color parameter to "red"
# Use scale_size_area() to set the size of the points
# Use coord_quickmap() to set the coordinate system

