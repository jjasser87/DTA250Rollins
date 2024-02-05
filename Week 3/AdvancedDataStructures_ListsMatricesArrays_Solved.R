# DTA250 - Fall 2023
# Jasser Jasser (JJ)

# Run the following line of code to prepare your environment

df <- data.frame(
  "First" = 10:1,
  "Second" = -4:5,
  "Sport" = c("Hockey", "Football", "Baseball", "Curling", "Rugby", "Lacrosse", 
              "Basketball", "Tennis", "Cricket", "Soccer")
)

# Advanced Data Structures ----
# In this file, we will learn about Lists, Matrices, and Arrays

## Lists ----
# Sometimes you need to have a container that holds arbitrary objects
# Either of the same type of varying types.
# R accomplishes this through Lists

#TODO
# Create a SINGLE element list using the list() function
# This one element is a vector containing the number from 1 through 3
# Use the c() function for the vector
# Store the output in a variable called lst1

lst1 <- list(1:3)
lst1 <- list(1:3, c("Hello", "World"))
lst1 <- list(1:3, c("Hello", "World"), c(4, 5, "Bye"))


#TODO
# Create a THREE element list using the list() function
# These three elements are the numbers 1, 2, and 3
# Store the output in a variable called lst3

list3 <- list(1, 2, 3)


#TODO
# Create a TWO element list using the list() function
# Inside the first element is a vector containing the numbers 1 through 3
# Inside the second element is a vector containing the numbers 3, 5, and 7
# Store the output in a variable called lst2

lst2 <- list(1:3, c(3, 5, 7))

# 1:3 -> 1, 2, 3 -> integers
# c(3, 5, 7) -> 3.0, 5.0, 7.0 -> doubles


#TODO
# Create a TWO element list using the list() function
# Inside the first element is the df variable defined above
# Inside the second element is a vector containing the numbers from 1 through 10
# Store the results in a variable called lst

lst <- list(df, 1:10)


#TODO
# Can you check the length of lst using the length() function

length(lst)


#TODO
# Can you access the first element in lst using []. What is its class?
lst[1]

class(lst[1])


#TODO
# How about accessing the first element using [[]]. What is its class?

lst[[1]]

# Name your sublists when you create your list
lst <- list(df = df, numbers = 1:10)

lst$df[2, "Sport"]

lst$numbers
lst$numbers[5]


### Nested Lists ----
# Even more confusing.
# list(list(), list())

# TODO
# Create a TWO element list using the list() function
# Inside the first element is another list() that contains the df variable
# and a vector from 1 through 10
# Inside the second element is a vector containing the numbers from 20 through 30

crazy_lst <- list(list(df, 1:10), list(20:30))

## Matrices ----
# Essential in statistics.
# Similar to data frames
# Every single element regardless of column must of of same type
# Most commonly all numeric

#TODO
# Create a 5x2 matrix that contains the numbers 1 through 10
# using the matrix() function.
# Use nrow parameter for number of rows
# use ncol parameter for number of columns
# Store the results into a variable called mtx

mtx <- matrix(1:10, nrow = 5, ncol = 2)


#TODO
# Create a 5x3 matrix that contains the number 1 thought 10
# Use the same function and parameters above.
# What do you get?

mtx <- matrix(1:10, nrow = 5, ncol = 3)


## Arrays ----
# Basically a multidimensional vector
# It must all be of the same data type
# Elements can be accessed using []
# [row index, column index, dimension]

#TODO
# Create a new array using the array() function that contains the following
# Numbers 1 through 12
# 2 rows, 3 columns, and 2 dimensions. Use the dim parameter for this
# Inside the dim parameter, use the c() function to enter the dimensions
# Store the results in a variable called arr

arr <- array(1:12, dim = c(2, 3, 2))

arr <- array(1:18, dim = c(2, 3, 3))


