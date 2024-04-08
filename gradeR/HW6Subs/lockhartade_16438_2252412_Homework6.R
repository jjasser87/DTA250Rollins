# Homework 6
# JJ

# Load the tidyverse package
library(tidyverse)

# This is a simple homework that will teach you a trick of using pivot_longer()
# to help you create a plot that describes your entire dataset.

# Load the Boston Housing dataset. You need to install the MASS package for that
install.packages("MASS")
library(MASS)
data(Boston)

# Now we want to create a histogram plot of every variable in the Boston dataset.
# To do that we need to use the pivot_longer() function to convert the dataset
# into a long format.
# Use the pivot_longer() function to convert the Boston dataset into a long format
# Set the cols parameter to everything() to include all columns
# Set the x parameter to "Variable" to name the new column "Variable"
# Set the values_to parameter to "Value" to name the new column "Value"

Boston_long <- pivot_longer(Boston, cols = everything(), 
                            names_to = "Variable", 
                            values_to = "Value")
  
# Now that we have the data in a long format we can create a histogram plot
# with facet_wrap() to create a plot of every variable in the dataset.
# Use the ggplot() function to create the plot
# Set the data parameter to Boston_long
# Use the aes() function to set the x parameter to Value
# Add a + sign after the ggplot() function
# Use the geom_histogram() function to create the histogram
# Use the facet_wrap() function to create a plot of every variable in the dataset
# Set the ~Variable parameter to create a plot of every variable in the dataset
# Set the scales parameter to "free" to allow the scales to vary

all_plot <- ggplot(Boston_long, aes(x = Value)) +
  geom_histogram(bins = 30) +
  facet_wrap(~Variable, scales = "free")
