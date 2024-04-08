# DTA250 - Spring 2024
# Homework 7

# You have to understand that the homework starting from this point is going to
# be a little bit different.
# The homework will help you become a better data analyst.
# There will be less hints and more thinking involved.

# Question 1 ----

# Load the library tidyverse using the library() function
library(tidyverse)

# Load the palmerpenguins library using the library() function
# install.packages("palmerpenguins")
library(palmerpenguins)

# Load the penguins dataset library using the data() function
data(penguins)

# Use the filter() function to filter the penguins dataset to only include
# the penguins from the Torgersen island.
# call the new dataset penguins_torgersen

penguins_torgersen <- # Your code here

# Use the ggplot() function to create a density plot of the 'bill_length_mm'
# column of the penguins_torgersen dataset.
# In the aes() function, set the x parameter to the 'bill_length_mm' column
# and the fill parameter to 'sex' column of the penguins_torgersen dataset.
# Set the alpha parameter to 0.5.
# store the plot into a variable called p1.

p1 <- # Your code here


# Now use the fill() function to fill in the missing values in the penguins_torgersen
# dataset.
# Use the everything() function inside the fill() function to fill in all the
# missing values.
# Store the new dataset in a variable called penguins_torgersen_fill.

penguins_torgersen_fill <- # Your code here

# Now do the same density plot as before but use the penguins_torgersen_fill
# dataset instead of the penguins_torgersen dataset.
# store the plot into a variable called p2.
  
p2 <- # Your code here

# Import the patchwork library using the library() function
# Use the + sign to combine the p1 and p2 plots.
# You will notice that the y-axis of the two plots are different.
# You need to go back to the p1 and p2 plots and add a ylim() function to
# set the y-axis to be the same for both plots.
  
combined_plot <- # Your code here

# Do you find any difference between the density plots of the sex column in the
# penguins_torgersen and penguins_torgersen_fill datasets?
# Can you use the above fill() function to fill in the missing values in this
# case? (last observation carried forward)
# Why or why not?
# For this point, there is no right or wrong answer. I just want you to think
# about it and provide your answer in the comments.


# Question 2 ----

# Create a dataset called top_dest that contains the top 10 destinations from
# the flights dataset.
# Run the count() function on the flights dataset to get the top destinations.
# Inside the count() function, set the sort parameter to TRUE
# After that, run the head() function on the count() function to get the top 10

top_dest <- # Your code here


# top_dest is a dataset that contains the top 10 destinations from the flights
# dataset. It has two columns: dest and n.
# dest is the destination airport code and n is the number of flights to that
# destination.

# Can you find all the flights that went to the top 10 destinations in the
# flights dataset?
# You need to do a left join between the flights dataset and the top_dest
# dataset. You have to specify the join column as dest.

flights_into_top_dest <- # Your code here


# Question 3 ----

# Are there any implicit missing values in the planes dataset?
# In other words, are there any missing tailnum values in the planes dataset
# that are found in the flights dataset?
# Use the anti_join() function to find out. It has to be between flights and
# planes datasets. the join_by() function has to be on the tailnum column.
# Use the distinct() function to get the unique tailnum values from the
# flights dataset.

missing_planes <- # Your code here

# One of the tailnum that is missing in the planes dataset is N3ALAA.
# How can you verify that this tailnum is indeed missing in the planes dataset?
# Hint: Use the filter() function to filter the planes dataset to only include
# the tailnum N3ALAA. Then use the nrow() function to get the number of rows
# in the filtered dataset. If the number of rows is 0, then the tailnum is
# missing in the planes dataset.
  
verify_missing <- # Your code here
