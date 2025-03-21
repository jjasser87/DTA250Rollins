#DTA250 - Fall 2023
#JJ

# Normal Distributions ----
# Perhaps the most famous, and most used, distribution is the normal 
# distribution.

# Set the seed to 123 to ensure reproducibility
set.seed(123)

#TODO
# Create 10 random numbers using the rnorm() function


# In the case above, the mean is automatically set to 0 and the standard
# deviation is set to 1. We can change these values by adding the mean and
# standard deviation arguments to the function.

#TODO
# Create 10 random numbers with a mean of 100 and a standard deviation of 20


# The dnorm() function will give us the probability density of a given value
# in a normal distribution. For example, if we want to know the probability
# density of the value 100 in a normal distribution with a mean of 100 and a
# standard deviation of 20, we can use the dnorm() function.

#TODO
# Create 10 random numbers using the rnorm() function and store it in a variable
# called randNorm10




#TODO
# Run the dnorm() function on randNorm10


## Plotting Normal Distributions ----
#TODO
# Create 3000 random numbers using rnorm() and assign it to a variable called 
# randNorm
# Calculate the distribution of randNorm using the dnorm() function and assign
# it to a variable called randDensity
# Create a data.frame called randDF with two columns: randNorm and randDensity
# Load the ggplot2 library
# Create a scatter plot using the ggplot() and geom_point() functions
# Set the data argument to randDF
# Set the x-axis to randNorm and the y-axis to randDensity


# The pnorm() function will give us the cumulative probability of a given
# value in a normal distribution.

#TODO
# Run the pnorm() function on randNorm10


# Binomial Distributions ----
# The binomial distribution is a discrete probability distribution that
# describes the probability of a given number of successes in a given number
# of trials in an experiment which has two possible outcomes (commonly called
# a binomial experiment). For example, the probability of getting 3 heads in 5
# coin tosses.

#TODO
# Execute the rbinom() function with n=1, size=10, prob=0.4


#TODO
# Try the code above with n=5 and n=10


#TODO
# Try the above 3 examples but this time make sure size=1


#TODO
# Create a data.frame called binomDF with one column called Successes where
# Successes is a random binomial distribution with n=1000, size=10, prob=0.3
# Create a histogram using the ggplot() and geom_histogram() functions
# Set the data argument to binomDF
# Set the x-axis to Successes



# Poisson Distributions ----
# The Poisson distribution is a discrete probability distribution that
# describes the probability of a given number of events occurring in a fixed
# interval of time or space if these events occur with a known constant mean
# rate and independently of the time since the last event. For example, the
# probability of 3 customers arriving at a store in 1 hour if customers arrive
# at a rate of 3 per hour.

#TODO
# Using the rpois() function, create a random poisson distribution with 
# n=10000 and lambda=1.
# Save the results in a variable called pois1


#TODO
# Repeat the last TODO 4 more times but this time change lambda to 2, 5, 10, and 20
# Save the results in variables called pois2, pois5, pois10, and pois20


#TODO
# Create a data.frame called poisDF with 5 columns: Lambda.1, Lambda.2, Lambda.5,
# Lambda.10, and Lambda.20
# Set each column to the corresponding variable from the last TODO


#TODO
# We need to do some reshaping for the data to be in the correct format for
# plotting.
# Run the following code.

library(tidyverse)
poisDF <- poisDF |>
    pivot_longer(
        cols=everything(),
        names_to="Lambda",
        values_to="Count"
    )

poisDF <- poisDF |>
    mutate(Lambda=str_extract(Lambda, "[:digit:]+") |> 
    as.numeric() |> 
    as.factor()
    )

# In the above code we used the pivot_longer() function to reshape the data
# and the mutate() function to convert the Lambda column to a factor.
# The str_extract() function is used to extract the numbers from the Lambda
# column.

#TODO
# Create a histogram using the ggplot() and geom_histogram() functions
# Create a facet wrap using the facet_wrap() function to display the 5 different
# lambda values



#TODO
# Create a density plot using the ggplot() and geom_density() functions

