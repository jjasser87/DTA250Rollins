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
# The following code will replace 20 values in x with NA
y <- x
y[sample(1:100, size=20, replace=FALSE)] <- NA

#TODO
# Find the mean of y
mean(y)

#TODO
# Find the mean of y using the na.rm argument
mean(y, na.rm=TRUE)

# We can replace the NA values in y with the mean of y using the is.na()
# function. The is.na() function will return a logical vector of TRUE and FALSE
# values. The TRUE values correspond to the NA values in y.

#TODO
# Replace the NA values in y with the mean of y
y[is.na(y)] <- mean(y, na.rm=TRUE)

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
cor(economics[, c("pce", "psavert", "uempmed", "unemploy")])

#TODO
# Install the GGally package using the install.packages() function
install.packages("GGally")

#TODO
# Load the GGally package using the library() function
library(GGally)

#TODO
# Use the ggpairs() function to visualize the correlation between pce, psavert,
# uempmed, and unemploy variables in the economics dataset
ggpairs(economics[, c("pce", "psavert", "uempmed", "unemploy")])

# T-Test One Sample ----
# The t.test() function can be used to perform a t-test on a single sample.
# The t.test() function takes a vector as an argument and returns a list of
# results.

# To explain the t-test, we will use the following example. Assume that JJ
# is the owner of a chicken shack called JJ Fill-a-Bucket. JJ claims that the
# average transaction per customer is $50. JJ started a marketing campaign to
# increase the average transaction per customer. After the marketing campaign,
# JJ wants to know if the average transaction per customer has increased. JJ
# randomly sampled 100 transactions and found that the average transaction per
# customer is $55. JJ wants to know if the average transaction per customer has
# increased.

new_sales <- sample(20:90, size=100, replace=TRUE)
# 20 is the mimimum transaction amount
# 90 is the maximum transaction amount
# 100 is the number of transactions
# replace=TRUE means that there is a probability that 2 customers payed the 
# same amount

new_sales_test <- t.test(new_sales, mu=50, alternative="greater")
# This will produce a list of results
# mu=50 means that the null hypothesis is that the average transaction per
# customer is $50
# alternative="greater" means that the alternative hypothesis is that the
# average transaction per customer is greater than $50

# The results will look like this: (depending on the random sample)
#> new_sales_test

#        One Sample t-test

# data:  new_sales
# t = 3.0351, df = 99, p-value = 0.001536
# alternative hypothesis: true mean is greater than 50
# 95 percent confidence interval:
# 52.82174      Inf
# sample estimates:
# mean of x 
    56.23 

# In the case above, the p-value is 0.001536. This means that there is a 0.1536%
# chance that the average transaction per customer is greater than $50. Since
# the p-value is less than 0.05, we can reject the null hypothesis and conclude
# that the average transaction per customer is greater than $50.
# Which means that the marketing campaign was successful.

# Let us visualize this using a histogram

randT <- rt(30000, df=99)
# rt() function will generate a random sample of t-distribution
# df=99 means that the degrees of freedom is 99 (100 - 1). Number of samples - 1

# From the t distribution table for one-tailed test, we can see that the
# critical value for 99 degrees of freedom and 0.05 significance level is 1.66
# https://www.tdistributiontable.com/

# Create a data.frame from the randT vector
randTDF <- data.frame(x = randT)

# Create a ggplot object
library(ggplot2)

# Density plot with critical value and t-statistic value as vlines
ggplot(randTDF, aes(x=x)) +
    geom_density(fill="blue", alpha=0.2) +
    geom_vline(
        xintercept=c(1.66, new_sales_test$statistic), 
        linetype="dashed", color=c("red", "green")
        ) +
    labs(
        title="Density Plot with Critical Value and T-Statistic Value as Vlines",
             x="T-Statistic",
             y="Density"
             )

# In the above plot, the red line is the critical value and the green line is
# the t-statistic value. 
# If The t-statistic value is greater than the critical
# value. This means that we can reject the null hypothesis and conclude that
# the average transaction per customer is greater than $50.
# else, we cannot reject the null hypothesis and conclude that the average
# transaction per customer is not greater than $50.