# DTA250
# JJ

# Modeling the relationship between two variables
# Linear Regression
# Linear regression is a statistical method that models the relationship between
# two variables by fitting a linear equation to observed data. One variable is
# considered to be an explanatory variable, and the other is considered to be a
# dependent variable. For example, we can model the relationship between the
# height of a father and the height of his son. In this case, the height of the
# father is the explanatory variable, and the height of the son is the dependent
# variable. The linear equation is of the form y = mx + b, where y is the
# dependent variable, x is the explanatory variable, m is the slope, and b is
# the intercept. The slope is the change in the dependent variable for every 1
# unit change in the explanatory variable. The intercept is the value of the
# dependent variable when the explanatory variable is 0.

# Load the tidyverse package
library(tidyverse)

# Install UsingR package
install.packages("UsingR")

# Load UsingR package
library(UsingR)

# Load the father.son dataset
data(father.son)

# Plot the father.son dataset
ggplot(data = father.son, aes(x=fheight, y=sheight)) + geom_point() +
    geom_smooth(method = "lm") +
    labs(title = "Father and Son Height",
         x = "Father's Height (inches)",
         y = "Son's Height (inches)")


# Calculate the regression between fheight and sheight using lm() function
regression <- lm(fheight ~ sheight, data = father.son)
# Or you can run lm(father.son$fheight ~ father.son$sheight)
# The result of the regression
summary(regression)

# The results shows that the slope is 0.488, which means that for every 1 inch
# increase in the father's height, the son's height increases by 0.488 inches.
# The intercept is 34.10, which means that if the father's height is 0 inches,
# the son's height is 34.10 inches.

# Excercise

# Q1

# Load the palmerpenguins package
# Load the penguins dataset
# Fill up the missing values in the penguins dataset using the fill()
# and everything() function
# Do a correlation test between body_mass_g and flipper_length_mm
# Load the GGally package
# Use the ggpairs() function to plot the correlation between body_mass_g and
# flipper_length_mm
# Calculate the regression between body_mass_g and flipper_length_mm using the
# lm() function
# Plot the regression line

library(palmerpenguins)
data(penguins)
penguins <- penguins |> fill(everything())
cor(penguins$body_mass_g, penguins$flipper_length_mm)
library(GGally)
ggpairs(penguins, columns = c("body_mass_g", "flipper_length_mm"))
regression <- lm(body_mass_g ~ flipper_length_mm, data = penguins)
summary(regression)
ggplot(data = penguins, aes(x=body_mass_g, y=flipper_length_mm)) + 
    geom_point() +
    geom_smooth(method = "lm") +
    labs(title = "Body Mass and Flipper Length",
         x = "Flipper Length (mm)",
         y = "Body Mass (g)")


# Repeat the plot again but this time, use the species as the color
ggplot(data = penguins, aes(x=body_mass_g, y=flipper_length_mm)) + 
    geom_point(aes(color=species)) +
    geom_smooth(method = "lm") +
    labs(title = "Body Mass and Flipper Length",
         x = "Flipper Length (mm)",
         y = "Body Mass (g)")

# Create a horizontal line of type 2 at 205 mm
ggplot(data = penguins, aes(x=body_mass_g, y=flipper_length_mm)) + 
    geom_point(aes(color=species)) +
    geom_smooth(method = "lm") +
    geom_hline(yintercept = 205, linetype = 2) +
    labs(title = "Body Mass and Flipper Length",
         x = "Flipper Length (mm)",
         y = "Body Mass (g)")

# The horizontal line we added is at 205 mm. We can see that the majority of the
# gentoo penguins have a flipper length greater than 205 mm.
# This will make it easier to classify the penguins based on their flipper
# length.

#Q2

# install the reshape2 package
# Load the reshape2 package
# Load the tips dataset

# Plot the total_bill against the tip
# Add a regression line using the geom_smooth() function

install.packages("reshape2")
library(reshape2)
library(tips)
ggplot(data = tips, aes(x=total_bill, y=tip)) + 
    geom_point() +
    geom_smooth(method = "lm") +
    labs(title = "Total Bill and Tip",
         x = "Total Bill",
         y = "Tip")

# Obvious positive correlation between the total bill and the tip. The more the
# total bill, the higher the tip.