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

install.packages("tidyverse")

install.packages("ggplot2")


# Let us start by loading the ggplot2 package 

#TODO
# Load the ggplot2 package
# Use the library() function

library(ggplot2)

library(tidyverse)


#TODO
# Load the diamonds dataset from the ggplot2 package
# use the data() function

data(diamonds)


#TODO
# Check the head of the diamonds dataset using the head() function
# The head() function is a sanity check to make sure that the dataset is
# loaded correctly

head(diamonds)


# Diamonds (https://www.youtube.com/watch?v=lWA2pjMjpBs)
# Carat (https://www.youtube.com/watch?v=1TsVjvEkc4s)
# (🤮 I hate these songs)


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

diamonds$price

ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = carat))


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

ggplot(data = diamonds) +
  geom_density(mapping = aes(x = carat), fill = "blue", color="red")


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

plot(diamonds$carat, diamonds$price)

ggplot(data = diamonds, mapping = aes(x = carat, y = price)) +
  geom_point()


# We are going to use the line
# ggplot(diamonds, aes(x = carat, y = price))
# repeatedly later. So it is better to store it in a variable

#TODO
# Store the line
# ggplot(diamonds, aes(x = carat, y = price))
# in a variable called diamonds_plot

diamonds_plot <- ggplot(diamonds, aes(x = carat, y = price))


#TODO
# Use the diamonds_plot variable to create a scatterplot of the carat and price
# variables in the diamonds dataset
# Add a + sign after the diamonds_plot variable
# After that use the geom_point() function
# Inside the geom_point(), set the mapping parameter to aes()
# Inside the aes() function, set the color parameter to the color variable
# The color column in the diamonds dataset. It is a categorical variable.
# factor() is a function that converts a variable to a categorical variable

diamonds_plot +
  geom_point(mapping = aes(color = color))


#TODO
# Repeat the previous TODO
# Add a + sign after the geom_point() function
# After that use the facet_wrap() function
# Inside the facet_wrap() function, set the separator ~ color

diamonds_plot +
  geom_point(mapping = aes(color = color)) +
  facet_wrap( ~ color)


#TODO
# This time, we will replace the facet_wrap() function with the facet_grid()
# function
# Inside the facet_grid() function, set the separator cut ~ clarity

diamonds_plot +
  geom_point(mapping = aes(color = color)) +
  facet_grid( ~ color)

diamonds_plot +
  geom_point(mapping = aes(color = color)) +
  facet_grid(cut ~ clarity)


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
# Inside the facet_wrap() function, use the separator ~ color

ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = carat)) +
  facet_wrap( ~ color)


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

ggplot(data = diamonds) +
  geom_boxplot(mapping = aes(y = carat))


#TODO
# Repeat the previous TODO
# However, this time, add a an x parameter to the aes() function
# Set the x parameter to cut

ggplot(data = diamonds) +
  geom_boxplot(mapping = aes(y = carat, x = cut))


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

ggplot(data = diamonds) +
  geom_violin(mapping = aes(y = carat, x = cut))


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

ggplot(data = diamonds) +
  geom_violin(mapping = aes(y = carat, x = cut)) +
  geom_point(mapping = aes(y = carat, x = cut))

ggplot(data = diamonds, mapping = aes(y = carat, x = cut)) +
  geom_violin() +
  geom_point()

ggplot(data = diamonds, mapping = aes(y = carat, x = cut)) +
  geom_point(mapping = aes(color = cut))+
  geom_violin(mapping = aes(fill = cut))

ggplot(data = diamonds, mapping = aes(y = carat, x = cut)) +
  geom_point()+
  geom_violin(mapping = aes(fill = cut))



