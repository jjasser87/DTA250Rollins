# DTA250 - Spring 2024
# Jasser Jasser (JJ)

# Iterating with purrr ----
# (Not a cat https://www.youtube.com/watch?v=Ih5pEDV0T9M)
# purrr is a package that makes it easy to work with lists and vectors. 
# It is built around the concept of iteration: functions that apply a 
# piece of code to each element in a list or vector. 
# purrr is an alternative to base R iteration tools like 
# apply(), lapply().
# purrr is part of the tidyverse, so it is already installed if you
# have tidyverse installed.

## purrr functions ----
# purrr has a number of functions that are useful for iteration.
# The most common are map(), map2(), and pmap().
# map() applies a function to each element of a list or vector.
# map2() applies a function to two lists or vectors in parallel.
# pmap() applies a function to a list of vectors in parallel.

# In this lecture, we will only focus on map().

### map() ----
# map() applies a function to each element of a list or vector.
# map() returns a list.

#TODO
# Run the following code
theList <- list(A=matrix(1:9, 3), B=1:5, C=matrix(1:4, 2), D=2)


#TODO
# Load the tidyverse package using the library() function



#TODO
# Use the map() function to apply the function sum() to each element of theList
# map() returns a list. Use the pipe operator |>



### map() family ----
# map() has a number of variants that are useful for different situations.
# map_lgl() returns a logical vector.
# map_int() returns an integer vector.
# map_dbl() returns a double vector.
# map_chr() returns a character vector.
# map_df() returns a data frame.

#TODO
# Use the map_lgl() function to apply the function is.matrix() to 
# each element of theList
# map_lgl() returns a logical vector. Use the pipe operator |>



#TODO
# Use the map_int() function to apply the function length() to 
# each element of theList
# map_int() returns an integer vector. Use the pipe operator |>



#TODO
# Use the map_dbl() function to apply the function mean() to 
# each element of theList
# map_dbl() returns a double vector. Use the pipe operator |>



#TODO
# Use the map_chr() function to apply the function class() to 
# each element of theList
# map_chr() returns a character vector. Use the pipe operator |>



# Will, that didn't work. Why?
# Because the class() function returns a character vector of length > 1.
# map_chr() expects a character vector of length 1.
# We can use the map() function instead.



# Nevertheless, here is code that would work with map_chr()
theList |> map_chr(function(x) paste(class(x), collapse = ", "))
# In the above code, we are using the paste() function to collapse the
# character vector returned by the class() function into a single string.
# The collapse argument is used to specify the separator between the
# elements of the character vector. In this case, we are using ", " as
# the separator.
# the function() function is used to create an anonymous function.
# We already talked about anonymous functions in previous lecture.
# When we applied multiple function (mean and median) to columns and removed
# NA values


## map() over a data frame ----
# map() can also be used to apply a function to each column of a data frame.

#TODO
# Load the diamonds data set from the ggplot2 package
# use the data() function to load the diamonds data set



#TODO
# Use the map() function to apply the function mean() to 
# each numerical column of the diamonds data set
# map() returns a list. Use the pipe operator |>
# Also use the where() function to select the numerical columns



#TODO
# Use the map_dbl() function to apply the function mean() to 
# each numerical column of the diamonds data set
# map_dbl() returns a double vector. Use the pipe operator |>
# Use the where() function to select the numerical columns.




## map() with multiple inputs ----
# map() can also be used to apply a function to multiple inputs.

#TODO
# Assume you have the following two lists
firstList <- list(A=matrix(1:16, 4), B=matrix(1:16, 2), C=1:5)
secondList <- list(A=matrix(1:16, 4), B=matrix(1:16, 8), C=15:1)
# Let us create a function called sum_all function that takes two arguments
# and returns the sum of the two arguments




#TODO
# Use the map2() function to apply the sum_all() function to
# the firstList and secondList lists


# Adding another list
thirdList <- list(A=matrix(1:16, 4), B=matrix(1:16, 2), C=1:5)

# We need to update our function to take three arguments

#TODO
# Update the sum_all() function to take three arguments and return the sum of 
# three arguments (x, y, and z)


#TODO
# Use the pmap() function to apply the sum_all() function to
# the firstList, secondList, and thirdList


# The difference betwen map2() and pmap() is that map2() is used when
# you have two lists and you want to apply a function to each pair of
# elements in the two lists. pmap() is used when you have a list of
# lists and you want to apply a function to each set of elements in the
# lists.