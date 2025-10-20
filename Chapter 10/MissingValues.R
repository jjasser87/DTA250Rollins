#DTA250 - Fall 2023
#JJ

# Dealing with missing values ----

## Introduction ----

#TODO
# load the tidyverse package using the library() function
library(tidyverse)


## Explicit missing values ----
# Explicit missing values are values that are explicitly marked as missing.

### Last observation carried forward ----

#TODO
# Run the following code
treatment <- tribble(
  ~person,           ~treatment, ~response,
  "Derrick Whitmore", 1,         7,
  NA,                 2,         10,
  NA,                 3,         NA,
  "Katherine Burke",  1,         4
)
# notice the ~ next to the column names. This basically tells R that these 
# values are the column names.


#TODO
# use the fill() and everything() functions to fill the missing values
# the fill() function will fill the missing values with the last non-missing 
# value
# the everything() function will select all columns




### Fixed values ----

#TODO
# Run the following code
x <- c(1, 4, 5, 7, NA)
# Notice that the last element in the vector x is NA
# Use the function coalesce() to fill replace the NA element with 0




#TODO
# Run the following code
x <- c(1, 4, 5, 7, NA, 9, NA)
# Now there are two NAs at the end
# Try again with the coalesce() function and replace NA with 0



### Convert values to NA
# Run the following code
x <- c(1, 2, 3, 4, 5, -99, 7, 8, 9, 10)
# Obviously the -99 is an odd number in there. Sometimes, it is better to remove
# these odd numbers and replace them with NA.
# use the na_if() function to replace the number -99 with NA




### NaN ----
# Not a number.

#TODO
# Perform the following operations
# Divide 0 by 0

# Multiply 0 with inf

# Subtract inf from inf

# Find the sqrt() of -1



## Implicit missing values ----
# Implicit missing values are values that are not explicitly marked as missing.

#TODO
# Run the following code
stocks <- tibble(
  year  = c(2020, 2020, 2020, 2020, 2021, 2021, 2021),
  qtr   = c(   1,    2,    3,    4,    2,    3,    4),
  price = c(1.88, 0.59, 0.35,   NA, 0.92, 0.17, 2.66)
)
# The data has two missing observations. Can you find them?


### Pivoting ----

#TODO
# Use the pivot_wider() function to convert the implicit missing values into
# explicit ones
# follow after me with the code




###Complete ----
# Another approach is to use the function complete()

#TODO
# Use the function complete() to o generate explicit missing values by providing
# a set of variables that define the combination of rows that should exist.



#TODO
# Repeat the last TODO
# This time, set the year parameter to be 2019:2021.
