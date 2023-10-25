#DTA250 - Fall 2023
#JJ

# Visualizing Maps ----

#TODO
# Install the maps package
install.packages("maps")

#TODO
# Load the maps package
library(maps)

#TODO
# Load the tidyverse package
library(tidyverse)

#TODO
# Use the map_data() function to load the county data for Florida
# From that data select() the long, lat, group, and subregion columns
# Rename the long column to lon and the subregion column to county
# Store the data in a variable named fl_counties
fl_counties <- map_data("county", "florida") |>
  select(lon = long, lat, group, county = subregion)

#TODO
# Plot the data in fl_counties using ggplot()
# Use aes() to set the x-axis to lon, the y-axis to lat, and the group to county
# Use geom_polygon() to plot the data
# Use coord_quickmap() to set the coordinate system
ggplot(data = fl_counties, aes(x = lon, y = lat, group = county)) +
  geom_polygon() +
  coord_quickmap()

#TODO
# Load the us.cities data
# Filter the data to only include cities in Florida
# Select the name, long, lat, and pop columns
# Rename the long column to lon
# Store the data in a variable named fl_cities
fl_cities <- us.cities |>
  filter(country.etc == "FL") |>
  select(name, lon = long, lat, pop)

#TODO
# Plot the data in fl_cities using ggplot()
# Use aes() to set the x-axis to lon and the y-axis to lat
# Use geom_point() to plot the data
# Use coord_quickmap() to set the coordinate system
ggplot(data = fl_cities, aes(lon, lat)) +
  geom_point() +
  coord_quickmap()

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
ggplot(data = fl_cities, aes(x = lon, y = lat)) +
  geom_polygon(aes(group = group), fl_counties, fill = NA, color = "grey50") +
  geom_point(aes(size = pop), color = "red") +
  scale_size_area() +
  coord_quickmap()
