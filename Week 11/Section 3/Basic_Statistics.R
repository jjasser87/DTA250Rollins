#DTA250 - Fall 2023
#JJ

# Summary Statistics ----

# The sample() function will randomly sample a given number of values from a
# vector. For example, if we want to randomly sample 10 values from the vector
# 1:100, we can use the sample() function.

#TODO
# Create a vector of numbers from 1 to 100 and assign it to a variable called
# x. Set the size parameter to 100 and the replace parameter to TRUE
# replace=TRUE means that the values can be sampled more than once

x <- sample(1:100, size=100, replace=TRUE)


#TODO
# Find the mean of x
mean(x)


#TODO
# The following code will create a copy of x into a variable called y
# Then it will replace 20 values in y with NA
y <- x
y[sample(1:100, size=20, replace=FALSE)] <- NA


#TODO
# Find the mean of y
mean(y)


#TODO
# Find the mean of y using the na.rm argument
mean(y, na.rm = TRUE)


# We can replace the NA values in y with the mean of y using the is.na()
# function. The is.na() function will return a logical vector of TRUE and FALSE
# values. The TRUE values correspond to the NA values in y.

#TODO
# Replace the NA values in y with the mean of y

is.na(y)
y[is.na(y)] <- mean(y, na.rm = TRUE)

#TODO
# Find the mean of y again
mean(y)

## Weighted Mean ----

# Assume you have the following data:
grades <- c(95, 72, 87, 66)
weights <- c(1/2, 1/4, 1/8, 1/8)

#TODO
# Find the weighted mean of grades
# use the weighted.mean() function

weighted.mean(grades, weights)


# Variance is a measure of how spread out a set of data is. The variance of a
# vector can be calculated using the var() function.

#TODO
# Find the variance of x
# Which equals to
sum((x - mean(x))^2) / (length(x) - 1)

var(x)

#TODO
# Find the summary statistics of x using the summary() function
summary(x)

#TODO
# Find the summary statistics of y using the summary() function
summary(y)

# Correlation ----
# The cor() function can be used to calculate the correlation between two
# vectors.

#TODO
# Load the tidyverse package using the library() function
library(tidyverse)


#TODO
# Load the economics dataset from the ggplot2 package using the data() function
data(economics)

#TODO
# Take a look at the very first few rows of the economics dataset using the
# head() function
head(economics)


#TODO
# Find the correlation between the pce and psavert variables in the economics
# dataset. Use the cor() function

cor(economics$pce, economics$psavert)


#TODO
# Find the correlation between pce, psavert, uempmed, and unemploy variables in
# the economics dataset. Use the cor() function

cor(economics[ , c("pce", "psavert", "uempmed", "unemploy")])

#TODO
# Install the GGally package using the install.packages() function

install.packages("GGally")


#TODO
# Load the GGally package using the library() function
library(GGally)


#TODO
# Use the ggpairs() function to visualize the correlation between pce, psavert,
# uempmed, and unemploy variables in the economics dataset
ggpairs(economics[ , c("pce", "psavert", "uempmed", "unemploy")])


#TODO
# Create the ggpairs for the following columns from the penguins dataset
# "bill_length_mm"    "bill_depth_mm" "flipper_length_mm" "body_mass_g"

library(palmerpenguins)
data("penguins")

ggpairs(penguins[ , c("bill_length_mm", 
                      "bill_depth_mm", 
                      "flipper_length_mm",
                      "body_mass_g"
                      )
                  ]
        )


# T-Test

# Let us say that JJ has a chicken shack called JJ fill-a
# Average customer pays 50 dollar
# JJ decided to invest in a marketing campaign
# The next day, the average customer pay was 60
# The next day JJ fill-a had 30 customers

new_sales <- sample(30:80, size=30, replace=TRUE)
# 30 is the min pay
# 100 is the max pay

mean(new_sales)

t.test(new_sales, alternative = "greater", mu=50)

# H0 The true average is equal to 50
# H1 The true average is greater than 50

new_sales_ttest <- t.test(new_sales, alternative = "greater", mu=50)

randT <- rt(30000, df=29)
randTDF <- data.frame(x=randT)

ggplot(data = randTDF) +
  geom_density(aes(x=x), fill="grey", color="grey") +
  geom_vline(xintercept = new_sales_ttest$statistic) +
  geom_vline(xintercept = 1.69, linetype=2)
