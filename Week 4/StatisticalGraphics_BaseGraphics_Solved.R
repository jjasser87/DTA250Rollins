# DTA250 - Fall 2023
# Jasser Jasser (JJ)

# Statistical Graphics ----
# Statistical graphics are a way to visually communicate information about data

# First, we need to install the ggplot2 package (if it is not installed)

install.packages("tidyverse") # install the tidyverse package which includes ggplot2

#TODO
# Install the ggplot2 package
# use the install.packages() function
# set the package name to "ggplot2"

install.packages("ggplot2") # install the ggplot2 package only


# Let us start by loading the ggplot2 package 
# (ggplot always reminds me of GG Allin, the punk rocker. Don't look him up!)
# (You don't want to be traumatized)

#TODO
# Load the ggplot2 package
# Use the library() function

library(tidyverse) # Loading the tidyverse package which includes ggplot2
library(ggplot2) # loading the ggplot2 library only

#TODO
# Load the diamonds dataset from the ggplot2 package
# use the data() function
# store the dataset in a variable called diamonds

data(diamonds)

?diamonds


#TODO
# Check the head of the diamonds dataset using the head() function

head(diamonds)


## Base Histogram ----
# The most common graph of data in a single variable is a histogram.
# This shows the distribution of values for that variable.

#TODO
# Create a histogram of the carat variable in the diamonds dataset
# use the hist() function
# set the title to "Histogram of Carat." Use the main parameter
# set the x-axis label to "Carat." Use the xlab parameter

hist(diamonds$carat, main = "Histogram of Carat", xlab = "Carat")

hist(diamonds$price, main = "Histogram of Price", xlab = "Price")


## Base Scatterplot ----
# It is frequently good to see two variables in comparison with each other
# this is where the scatterplot is used.

#TODO
# Create a scatterplot of the carat and price variables in the diamonds dataset
# use the plot() function
# set the title to "Scatterplot of Carat and Price." Use the main parameter
# set the x-axis label to "Carat." Use the xlab parameter
# set the y-axis label to "Price." Use the ylab parameter

plot(diamonds$carat, 
     diamonds$price,
     main = "Scatterplot of Carat and Price",
     xlab = "Carat",
     ylab = "Price")

plot(diamonds$x,
     diamonds$y,
     main = "Scatterplot of Length vs. Width",
     xlab = "Length",
     ylab = "Width")


## Base Boxplot ----
# A boxplot is a way to show the distribution of a variable
# It shows the median, the interquartile range, and the range of the data

#TODO
# Create a boxplot of the carat variable in the diamonds dataset
# use the boxplot() function
# set the title to "Boxplot of Carat." Use the main parameter
# set the y-axis label to "Carat." Use the ylab parameter

boxplot(diamonds$carat, main = "Boxplot of Carat", ylab = "Carat")

boxplot(diamonds$price, main = "Boxplot of Price", ylab = "Price")
