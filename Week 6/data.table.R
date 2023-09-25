# DTA250 - Fall 2023
# Jasser Jasser (JJ)

# Group Manipulation ----
# Another term for it is "data Munging"
# This often requires repeated operations on different sections of the data
# something Hadley Wickham coined “split-apply-combine.”

## Pipes ----
# But before that, let us learn about pipes
# Pipes are a way to chain commands together
# They are used to make code more readable
# They are also used to make code more efficient

#TODO
# Load the library magrittr using the library() function
# This library contains the pipe operator %>%


#TODO
# Load the diamonds dataset from the ggplot2 library using the data() function


#TODO
# Use the dim() function to get the dimensions of the first 4 rows of the
# diamonds dataset (use the head() function to get the first 4 rows)


#TODO
# Use the %>% operator to get the dimensions of the first 4 rows of the
# diamonds dataset


## data.table ----
# data.table is a package that provides an enhanced version of data frames

#TODO
# Load the library data.table using the library() function


#TODO
# Use the data.table() function to convert the diamonds dataset to a data.table
# Assign the result to a variable called dt


#TODO
# Use the class() function to check the class of dt

### Subsetting ----
# Subsetting is used to extract a subset of the data

#TODO
# Extract diamonds with ideal cut from dt


#TODO
# Extract diamonds that has the color category D from dt


### Selecting Columns ----
# Selecting columns is used to extract a subset of the columns

#TODO
# Select `carat` and `price` of the "Ideal" cut diamonds.


#TODO
# Get maximum and minimum price of "Premium" cut diamonds


### Aggregating ----
# Aggregating is used to summarize data
# Grouping and summarizing data is done using the by argument.

#TODO
# Find the average price of diamonds for each cut


#TODO
# Count of diamonds for each combination of cut and color


### Modifying Values ----
# Modifying values is used to change values in the data
# You can directly update values without making a copy, which is 
# memory efficient.

#TODO
# Increase the price by 10 for diamonds weighing more than 2 carats.
# Set the new price in a new column called 'new_price'


#TODO
# Assign a new column 'price_category' based on price value
# If the price is less than 1000, assign "low"
# If the price is between 1000 and 5000, assign "medium"
# If the price is greater than 5000, assign "high"


### Chaining operations ----
# Chaining operations is used to combine multiple operations into one statement
# One of the powerful features is the ability to chain operations.

#TODO
# Extract diamonds with a "Premium" cut, and compute the average price 
# for each color


#TODO
# Get diamonds of color "E", and then filter those with price above 2000


### Setting and using keys ----
# Keys optimize operations on specific columns and allow for faster joins.

#TODO
# Set 'cut' as the key using the setkey() function


#TODO
# With 'cut' as the key, this subset operation is faster


#TODO
# Set 'cut' and 'color' as keys using the setkey() function


#TODO
# Retrieve all diamonds with "Ideal" cut and "E" color