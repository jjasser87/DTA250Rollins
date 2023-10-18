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
# Huh, what is tribble?
# Check the "tribble" note on CANVAS
# notice the ~ next to the column names. This basically tells R that these 
# values are the column names.


#TODO
# use the fill() and everything() functions to fill the missing values
# the fill() function will fill the missing values with the last non-missing 
# value
# the everything() function will select all columns
treatment |> fill(everything())


### Fixed values ----

#TODO
# Run the following code
x <- c(1, 4, 5, 7, NA)
# Notice that the last element in the vector x is NA
# Use the function coalesce() to fill replace the NA element with 0
coalesce(x, 0)

# or the dplyr approach
x |> coalesce(0)

#TODO
# Run the following code
x <- c(1, 4, 5, 7, NA, 9, NA)
# Now there are two NAs at the end
# Try again with the coalesce() function and replace NA with 0
coalesce(x, 0)
# or
x |> coalesce(0)

### Convert values to NA
# Run the follwing code
x <- c(1, 4, 5, 7, -99)
# Obviously the -99 is an odd number in there. Sometimes, it is better to remove
# these odd numbers and replace them with NA.
# use the na_if() function to replace the number -99 with NA
na_if(x, -99)

# or
x |> na_if(-99)

# and if you want to replace NAs with 0
x |> na_if(-99) |> coalesce(0)

### NaN ----
# Not a number.
# Check the note "NA vs NaN" on CANVAS.

#TODO
# Perform the following operations
# Divide 0 by 0
0/0
# Multiply 0 with inf
0 * Inf
# Subtract inf from inf
Inf - Inf
# Find the sqrt() of -1
sqrt(-1)


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
stocks |>
  pivot_wider(
    names_from = qtr,
    values_from = price
  )

###Complete ----
# Another approach is to use the function complete()

#TODO
# Use the function complete() to o generate explicit missing values by providing
# a set of variables that define the combination of rows that should exist.
stocks |> complete(year, qtr)

#TODO
# Repeat the last TODO
# This time, set the year parameter to be 2019:2021.
stocks |> complete(year = 2019:2020, qtr)


### Joins ----
# Another important way of revealing implicitly missing observations
# using the anti_join() function
# We will discuss Joins thoroughly in the next class.

## Factors and empty groups ----

#TODO
# Run the following code.
health <- tibble(
  name   = c("Ikaia", "Oletta", "Leriah", "Dashay", "Tresaun"),
  smoker = factor(c("no", "no", "no", "no", "no"), levels = c("yes", "no")),
  age    = c(34, 88, 75, 47, 56),
)
# the levels = c("yes", "no") argument tells R that the smoker variable has two
# levels: yes and no. This is important for the next TODO.

# Count the number of smokers using the count() function
# the count() function will count the number of observations in each group
health |> count(smoker)

#TODO
# Repeat the last TODO
# This time, inside the count() function, add the argument .drop = FALSE
# This will tell R to include the empty groups
health |> count(smoker, .drop = FALSE)

#TODO
# Let us explain this using ggplot
# Load the ggplot2 package using the library() function
library(ggplot2)

#TODO
# Run the following code
ggplot(data = health, aes(x = smoker)) +
  geom_bar()


#TODO
# Repeat the last TODO
# This time, add another layer called scale_x_discrete() after geom_bar()
# the scale_x_discrete() function will tell R to use discrete values 
# on the x-axis
# Inside scale_x_discrete set the drop parameter to FALSE
ggplot(data = health, aes(x = smoker)) +
  geom_bar() +
  scale_x_discrete(drop = FALSE)

#TODO
# gropu_by smoker
# inside the group_by() function, set the .drop parameter to FALSE
# then find the following 
# number of patients using the n() function 
# the average age of patients
# the max age of patients
# the min age of patients
# the age standard deviation of patients. use the sd() function for that.
health |>
  group_by(smoker, .drop = FALSE) |>
  summarize(
    n = n(),
    avg_age = mean(age),
    max_age = max(age),
    min_age = min(age),
    sd_age = sd(age)
  )

# or a better approach so that we end up with NA instead of NaN or Inf

health |>
  group_by(smoker) |>
  summarize(
    n = n(),
    avg_age = mean(age),
    max_age = max(age),
    min_age = min(age),
    sd_age = sd(age)
  ) |>
  complete(smoker)
