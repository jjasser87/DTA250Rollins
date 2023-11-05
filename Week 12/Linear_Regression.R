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
regression <- lm(sheight ~ fheight, data = father.son)
# The result of the regression
summary(regression)

# The result of the regression shows that the intercept is 33.886 and the slope 
# is 0.514.
# The intercept is the value of the dependent variable when the independent 
# variable is 0.
# The slope is the change in the dependent variable for every 1 unit change in 
# the independent variable.
# In this case, the intercept is 33.886, which means that the son's height is 
# 33.886 inches when the father's height is 0 inches.
# The slope is 0.514, which means that the son's height increases by 0.514 
# inches for every 1 inch increase in the father's height.

# Load the palmerpenguins package
library(palmerpenguins)

# Load the penguins dataset
data(penguins)

# Fill up the missing values in the penguins dataset using the fill()
# and everything() function
penguins <- penguins |> fill(everything())

# Do a correlation test between body_mass_g and flipper_length_mm
cor(penguins$body_mass_g, penguins$flipper_length_mm)

# Load the GGally package
library(GGally)

# Use the ggpairs() function to plot the correlation between body_mass_g and
# flipper_length_mm
ggpairs(penguins, columns = c("body_mass_g", "flipper_length_mm"))

# Calculate the regression between body_mass_g and flipper_length_mm using the
# lm() function
regression <- lm(body_mass_g ~ flipper_length_mm, data = penguins)

# The result of the regression
summary(regression)

# Plot the regression line
ggplot(data = penguins, aes(x=flipper_length_mm, y=body_mass_g)) + geom_point() +
    geom_smooth(method = "lm") +
    labs(title = "Body Mass and Flipper Length",
         x = "Flipper Length (mm)",
         y = "Body Mass (g)")

# Repeat the plot again but this time, use the species as the color
ggplot(data = penguins, aes(x=flipper_length_mm, y=body_mass_g)) + 
    geom_point(aes(color = species)) +
    geom_smooth(method = "lm") +
    labs(title = "Body Mass and Flipper Length",
         x = "Flipper Length (mm)",
         y = "Body Mass (g)")

# Create a vertical line of type 2 at 205 mm
ggplot(data = penguins, aes(x=flipper_length_mm, y=body_mass_g)) + 
    geom_point(aes(color = species)) +
    geom_smooth(method = "lm") +
    geom_vline(xintercept = 205, linetype = 2) +
    labs(title = "Body Mass and Flipper Length",
         x = "Flipper Length (mm)",
         y = "Body Mass (g)")
