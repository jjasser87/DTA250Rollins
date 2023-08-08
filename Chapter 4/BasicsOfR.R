# DTA250 - Fall 2023
# Jasser Jasser

# Chapter 4: Basics of R ----
# In this chapter we will learn about R's mathematical capabilities, variables,
# functions, and data types

## Basic Math ----

# TODO 
# Type 1 + 1 below and run your code either using the 'Run' button above


# TODO
# Now try 3 * 7 * 2


# TODO
# How about 4/2


# TODO
# Or maybe... (4 * 6) + 5


# TODO
# No wait... 4 * (6 + 5)


# TODO
# Is the answer for (4 * 6) + 5 the same for 4 * (6 + 5)? Write your answer as 
# a comment


## Variables ----
# In the R programming language, a variable is a symbol or name that stands for
# a value and is used to store data.

### Variable Assignment ----

# TODO
# Assign the value 2 to the variable x using the <- assignment operator


# TODO
# Assign the value 5 to the variable y using the <- assignment operator


# TODO
# Assign the value 3 to the variable z using the -> assignment operator


# TODO
# Assign the value 7 to the variables a and b using the <- assignment operator
# You can only write 7 once


# TODO
# Assign the value 4 to the variable j using the assign() function


# Variable names in R can be a combination of letters, numbers, periods, and 
# underscores. However, they must start with a letter or a period. If they start
# with a period, the second character cannot be a number. Also, R is 
# case-sensitive, so a variable named 'My_Variable' is different from 
# 'my_variable'.

# TODO
# is .jj a good variable name?
# is .2j a good variable name?
# is 2j a good variable name?
# is _2j a good variable name?
# is j2 a good variable name?
# is j.2 a good variable name?

### Removing Variables ----

# TODO
# Remove the variable j using the rm() function


# Why would you want to remove a variable in R?
# 1. Free Up Memory: Variables in R take up memory. If you're working with large
#   data sets or complex functions, your program could use a lot of memory, and 
#   this can slow down your computer or even cause it to run out of memory. 
#   By removing variables that you no longer need, you can free up memory and 
#   help your program run faster and more efficiently.
# 2. Data Management: In a complex script, you might create a lot of temporary 
#   variables that are used for intermediate steps. These variables can clutter 
#   your work space, making it harder to understand what's going on in your 
#   program. By removing these temporary variables when you're done with them, 
#   you can keep your work space clean and easy to understand.
# 3. Avoid Errors: If you have a variable in your work space from previous 
#   operations, it might interfere with your current operations, particularly if
#   you're reusing variable names. Removing variables when you're done with them
#   can help avoid this kind of error.

## Data Types ----
# Numeric Data
# Character Data
# Dates
# Logical

### Numeric Data ----
# These are numbers, which can be integers or floating-point numbers.

# TODO
# Can you check whether x is numeric using the is.numeric() function?


# TODO
# Assign the value 5L to the variable i?


# TODO
# Can you check whether i is an integer using the is.integer() function?


# TODO
# Can you check whether i is numeric using the is.numeric() function?


# TODO
# Can you check the class of the value 4L using the class() function?


# TODO
# Can you do the same as above for the value 2.8? 


# TODO
# What is the class of 4L * 2.8?


# TODO
# How about 5L/2L? What is the output's class?


# TODO
# How about the class of the following operations
# 6L/3L
# 6L + 3L


### Character Data ----
# These are text or strings.
# character: a type of data that is used to represent textual data, 
#   i.e., sequences of characters (letters, numbers, symbols). It is equivalent 
#   to what is known as a string in many other programming languages.
# factor: a data type used to store categorical data. It is used to represent 
#   data that has a limited number of different values, called levels.
#   Example factor(c("graduate", "undergraduate"))

# TODO
# Assign "data" to the variable x


# TODO
# Assign the factor example above to the variable y. Notice the function c which
# stands for concatenate or combine. We will talk about it later.


# TODO
# How many characters are in the variable x? Use the nchar() function


# TODO
# How many characters are in the word "hello"? Again, use the nchar() function


# TODO
# Can you use the number 3 in nchar()?


# TODO
# How about 420?


### Dates ----
# In R, dates are represented with the Date class. The Date class is designed to
# handle calendar dates, and makes it easy to perform operations involving dates.

# TODO
# Create the following date "2012-06-28" using the as.Date() function
# Store the date into a variable called date1


# TODO
# Check the class of date1 variable using the class() function


# TODO
# Convert the date1 variable into numeric using the as.numeric() function


# TODO
# Create the following date "2012-06-28 17:42" using the as.POSIXct() function
# Store the date into a variable called date2


# TODO
# Check the class of date2 variable using the class() function


# TODO
# Convert the date2 variable into numeric using the as.numeric() function


### Logical ----
# TRUE or FALSE
# 1 or 0

# TODO
# What is the output of TRUE * 5?


# TODO
# What is the output of FALSE * 5?


# TODO
# Assign the value TRUE to the variable k


# TODO
# Check the class of variable k using the class() function


# TODO
# Check whether k is logical using the is.logical() function


# TODO
# Can you write TRUE as T?
# What is the class() of T?


# TODO
# Assign the value 7 to the variable T?


# TODO
# What is the class() of T?


# Logical values can result from comparing two numbers, or characters
# Remember me... (4 * 6) + 5 == 4 * (6 + 5)

# TODO
# What is the answer to the following
# 2 ==3
# 2 != 3
# 2 < 3
# 2 <= 3
# 2 > 3
# 2 >= 3
# "data" == "stats"
# "data" < "stats"

## Vectors ----



