# DTA250 - Fall 2023
# Jasser Jasser (JJ)

# Statistical Graphics ----
# Statistical graphics are a way to visually communicate information about data

# You installed ggplot2 in the last class
# Therefore, you don't need to install it again.
# However, if you didn't install it, then you need to do this step.

#TODO - If installed, then skip this TODO
# Install the ggplot2 package
# use the install.packages() function
# set the package name to "ggplot2"


# Let us start by loading the ggplot2 package 

#TODO
# Load the ggplot2 package
# Use the library() function


#TODO
# Load the diamonds dataset from the ggplot2 package
# use the data() function


#TODO
# Check the head of the diamonds dataset using the head() function
# The head() function is a sanity check to make sure that the dataset is
# loaded correctly


# Diamonds (https://www.youtube.com/watch?v=lWA2pjMjpBs)
# Carat (https://www.youtube.com/watch?v=1TsVjvEkc4s)


## Histogram and Densities ----
# Remember that a histogram is a way to show the distribution of a variable
# It shows the frequency of values for that variable
# A density plot is a smoothed version of a histogram
# It is another way to show the distribution of a variable

### Histogram ----

#TODO
# Create a histogram of the carat variable in the diamonds dataset
# Use the ggplot() function
# Inside the ggplot() function, set the data parameter to diamonds
# Add a + sign after the ggplot() function
# After that use the geom_histogram() function
# Inside the geom_histogram() function, set the mapping parameter to aes()
# Inside the aes() function, set the x parameter to carat


### Density ----

#TODO
# Create a density plot of the carat variable in the diamonds dataset
# Use the ggplot() function
# Inside the ggplot() function, set the data parameter to diamonds
# Add a + sign after the ggplot() function
# After that use the geom_density() function
# Inside the geom_density() function, set the mapping parameter to aes()
# Inside the aes() function, set the x parameter to carat
# Inside geom_density(), set the fill parameter to "grey50"


## Scatterplot ----
# A scatterplot is a way to show the relationship between two variables
# It shows the values of one variable on the x-axis and the values of the other
# variable on the y-axis
# It is a good way to see if there is a relationship between two variables

#TODO
# Create a scatterplot of the carat and price variables in the diamonds dataset
# Use the ggplot() function
# Inside the ggplot() function, set the data parameter to diamonds
# Inside the ggplot() function, set the mapping parameter to aes()
# Inside the aes() function, set the x parameter to carat
# Inside the aes() function, set the y parameter to price
# Add a + sign after the ggplot() function
# After that use the geom_point() function


# We are going to use the line
# ggplot(diamonds, aes(x = carat, y = price))
# repeatedly later. So it is better to store it in a variable

#TODO
# Store the line
# ggplot(diamonds, aes(x = carat, y = price))
# in a variable called diamonds_plot


#TODO
# Use the diamonds_plot variable to create a scatterplot of the carat and price
# variables in the diamonds dataset
# Add a + sign after the diamonds_plot variable
# After that use the geom_point() function
# Inside the geom_point(), set the mapping parameter to aes()
# Inside the aes() function, set the color parameter to the color variable
# The color column in the diamonds dataset. It is a categorical variable.
# factor() is a function that converts a variable to a categorical variable


#TODO
# Repeat the previous TODO
# Add a + sign after the geom_point() function
# After that use the facet_wrap() function
# Inside the facet_wrap() function, set the formula parameter to ~ color


#TODO
# This time, we will replace the facet_wrap() function with the facet_grid()
# function
# Inside the facet_grid() function, set the formula parameter to cut ~ clarity


# Faceting can also works with histograms or any other geom.

#TODO
# Create a histogram of the carat variable in the diamonds dataset
# Use the ggplot() function
# Inside the ggplot() function, set the data parameter to diamonds
# Set the mapping parameter to aes()
# Inside the aes() function, set the x parameter to carat
# Add a + sign after the ggplot() function
# After that use the geom_histogram() function
# Add a + sign after the geom_histogram() function
# After that use the facet_wrap() function
# Inside the facet_wrap() function, set the formula parameter to ~ color


## Boxplot and Violins ----

### Boxplot ----
# A boxplot is a way to show the distribution of a variable
# It shows the median, the interquartile range, and the range of the data

#TODO
# Create a boxplot of the carat variable in the diamonds dataset
# Use the ggplot() function
# Inside the ggplot() function, set the data parameter to diamonds
# Set the mapping parameter to aes()
# Inside the aes() function, set the y parameter to carat
# Add a + sign after the ggplot() function
# After that use the geom_boxplot() function


#TODO
# Repeat the previous TODO
# However, this time, add a an x parameter to the aes() function
# Set the x parameter to cut


### Violin ----
# A violin plot is a way to show the distribution of a variable
# It is similar to a boxplot
# However, it also shows the density of the data at different values

#TODO
# Create a violin plot of the carat variable in the diamonds dataset
# Use the ggplot() function
# Inside the ggplot() function, set the data parameter to diamonds
# Set the mapping parameter to aes()
# Inside the aes() function, set the y parameter to carat
# Set the x parameter to cut
# Add a + sign after the ggplot() function
# After that use the geom_violin() function


## Using multiple geoms ----
# You can use multiple geoms in the same plot
# This is useful to show multiple aspects of the data

#TODO
# Create a violin plot of the carat variable in the diamonds dataset
# Use the ggplot() function
# Inside the ggplot() function, set the data parameter to diamonds
# Set the mapping parameter to aes()
# Inside the aes() function, set the y parameter to carat
# Set the x parameter to cut
# Add a + sign after the ggplot() function
# After that use the geom_violin() function
# Add a + sign after the geom_violin() function
# After that use the geom_point() function


