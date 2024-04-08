# Please create teh following plots:

# Q1 ----

# Load the tidyverse library
library(tidyverse)

# Load the palmerpenguins library
library(palmerpenguins)

# Load the penguins dataset
data(penguins)

# Plot 1
# Create a density plot of the 'bill_length_mm' column of the penguins
# dataset.
# Use the ggplot() function to create the plot.
# Use the aes() function to specify the x-axis variable.
# Inside the aes() function, set the x parameter to the 'bill_length_mm'
# column of the penguins dataset.
# Add a + sign after the ggplot() function.
# Use the geom_density() function to add a density plot to the ggplot()
# function.
# Add a + sign after the geom_density() function.
# Use the facet_grid() function to add a facet to the ggplot() function.
# Inside the facet_grid() function, set the formula to
# "~ species".
# Add a + sign after the facet_grid() function.
# Use the labs() function to add a title to the ggplot() function.
# Inside the labs() function, set the title parameter to
# "Density Plot of Bill Length by Species".
# Set the x parameter to "Bill Length (mm)".
# Set the y parameter to "Density".

plot1 <- ggplot(data = penguins, aes(x = bill_length_mm)) +
  geom_density() + 
  facet_grid("~species") +
  labs(title = "Density Plot of Bill Length by Species",
       x = "Bill Length (mm)",
       y = "Density")

# To verify your answer, run the following code
plot1

# Q2 ----

# Use the diamonds dataset from ggplot2
data(diamonds)

# Plot 2
# Create a scatter plot of 'carat' vs. 'price', colored by 'cut' quality.
# Use the ggplot() function to create the plot.
# Use the aes() function to specify the x-axis and y-axis variables.
# Inside the aes() function, set the x parameter to 'carat', the y parameter to 'price'.
# Add a + sign after the ggplot() function.
# Use the geom_point() function to add a scatter plot to the ggplot() function. 
# Inside the geom_point() function, use the aes() function to set the color parameter to 'cut'.
# Set the alpha parameter inside geom_point() to 0.5 to make the points semi-transparent if there is overplotting.
# Use the geom_smooth() function to add a smooth line through the points for each 'cut' category, setting the method argument to "lm" for linear models.
# Add a + sign after the geom_point() (and geom_smooth(), if used) function.
# Use the labs() function to add a title to the ggplot() function.
# Inside the labs() function, set the title parameter to "Carat vs. Price by Cut Quality",
# Set the x parameter to "Carat",
# Set the y parameter to "Price".

plot2 <- ggplot(data = diamonds, aes(x = carat, y = price)) + 
  geom_point(aes(color = cut), alpha = 0.5) +
  geom_smooth(method = "lm" ) +
  labs(title = "Carat vs. Price by Cut Quality",
       x = "Carat",
       y = "Price")


# To verify your answer, run the following code
plot2

# Q3 ----


# Use the mtcars dataset
data(mtcars)

# Plot 3
# Create a boxplot of 'mpg' by 'cyl' (number of cylinders).
# Use the ggplot() function to create the plot.
# Use the aes() function to specify the x-axis and y-axis variables.
# Inside the aes() function, set the x parameter to 'cyl' and the y parameter to 'mpg'.
# NOTICE that you will need to convert the 'cyl' column to a factor using the factor() function. factor(cyl)
# Add a + sign after the ggplot() function.
# Use the geom_boxplot() function to add a boxplot to the ggplot() function.
# Add a + sign after the geom_boxplot() function.
# Use the labs() function to add a title to the ggplot() function.
# Inside the labs() function, set the title parameter to "Miles Per Gallon by Cylinder Number",
# Set the x parameter to "Number of Cylinders",
# Set the y parameter to "Miles Per Gallon (mpg)".

plot3 <- ggplot(data = mtcars, aes(x = factor(cyl), y = mpg)) + 
  geom_boxplot() +
  labs(title = "Miles Per Gallon by Cylinder Number",
       x = "Number of Cylinders",
       y = "Miles Per Gallon (mpg)")
  


# To verify your answer, run the following code
plot3

# Q4 ----

# Use the iris dataset
data(iris)

# Plot 4
# Create a histogram of 'Petal.Length' for each species.
# Use the ggplot() function to create the plot.
# Use the aes() function to specify the x-axis variable.
# Inside the aes() function, set the x parameter to 'Petal.Length'.
# Add a + sign after the ggplot() function.
# Use the geom_histogram() function to add a histogram to the ggplot() function, and set bins to 30.
# Add a + sign after the geom_histogram() function.
# Use the facet_wrap() function to add a facet for 'Species'.
# Inside the facet_wrap() function, set the facets parameter to '~ Species'.
# Add a + sign after the facet_wrap() function.
# Use the labs() function to add a title to the ggplot() function.
# Inside the labs() function, set the title parameter to "Petal Length Distribution for Each Species",
# Set the x parameter to "Petal Length",
# Set the y parameter to "Count".

plot4 <- ggplot(data = iris, aes(x = Petal.Length)) + 
  geom_histogram(bins = 30) +
  facet_wrap(~Species) +
  labs(title = "Petal Length Distribution for Each Species",
       x = "Petal Length",
       y = "Count")


# To verify your answer, run the following code
plot4

#After loading the graph and data set for the iris data, I was unable to find a unit of
#measurement for the Petal Length. I looked further into the data set and realized that
#none of the variables have a form of measurement. Is this an error in the data set?

