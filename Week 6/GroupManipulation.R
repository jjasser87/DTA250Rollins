# DTA250 - Fall 2023
# Jasser Jasser (JJ)

# Group Manipulation ----
# Another term for it is "data Munging"
# This often requires repeated operations on different sections of the data
# something Hadley Wickham coined “split-apply-combine.”

## Apply Family ----
# The apply family of functions is used to apply a function to 
# a matrix, array, or data frame.

### Apply ----
# The apply function is used to apply a function to the rows or columns of 
# a matrix.
# The first argument is the matrix, the second is the dimension 
# (1=rows, 2=columns), and the third is the function to apply.

#TODO
# Create a matrix and call it theMatrix that has the numbers from 1 to 9
# in a 3x3 matrix.


#TODO
# Use the apply function to sum the rows of theMatrix.


#TODO
# Use the apply function to sum the columns of theMatrix.


# You can also achieve the above using the functions rowSums and colSums.

### lapply and sapply ----
# The lapply function is used to apply a function to each element of a list.
# The first argument is the list, the second is the function to apply.

#TODO
# Create a list called theList that contains the following elements:
# A matrix with the numbers from 1 to 9 in a 3x3 matrix. (Call it A)
# A vector with the numbers from 1 to 5. (Call it B)
# A matrix with the number from 1 to 4 in a 2x2 matrix. (Call it C)
# The number 2. (Call it D)


#TODO
# Use the lapply function to sum each element of theList.


# Dealing with lists can be a bit of a pain, so the sapply function is
# provided to simplify the process. It is the same as lapply, except that
# it tries to simplify the result to a vector or matrix if possible.

#TODO
# Use the sapply function to sum each element of theList.


#TODO
# Create a list called theNames that contains the following vector
# c("Jared", "Deb", "Paul")
# Notice that each element in the vector becomes a sublist in the list
# Use the lapply function to find the length of each name in theNames


### mapply ----
#Perhaps the most-overlooked-when-so-useful member of the apply family is mapply
# which applies a function to each element of multiple lists. 
# Often, when confronted with this scenario, people will resort to using a loop
# which is certainly not necessary.

#TODO
# Consider the following two lists:
firstList <- list(A=matrix(1:16, 4), B=matrix(1:16, 2), C=1:5)
secondList <- list(A=matrix(1:16, 4), B=matrix(1:16, 8), C=15:1)
# Use the mapply function to find whether the elements of firstList are
# equal to the elements of secondList
# Use the identical function to compare the elements of the two lists

### Other Apply Function ----
# There are many other members of the apply family that either do not get used 
# much or have been superseded by functions in the plyr, dplyr and purrr 
# packages. (Some would argue that lapply and sapply have been superseded, but 
# they do have their advantages over their corresponding dplyr and purrr 
# functions.)

# tapply
# rapply
# eapply
# vapply
# by

## aggreate ----
# The aggregate function is used to apply a function to a data frame split by
# one or more factors. The first argument is the data frame, the second is a
# list of factors, and the third is the function to apply.

#TODO
# Load the diamonds data set from the ggplot2 package using the data() function


#TODO
# Find the mean price of diamonds by cut
# Use the aggregate function


#TODO
# Find the mean price of diamonds by cut and color
# Use the aggregate function



