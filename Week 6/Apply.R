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
# Create a list called theNames that contains the following vectors
# c("Jared", "Deb", "Paul"), c("JJ", "JJJ", "JJJJ")
# Use the lapply function to find the number of characters of each name in theNames


# Redo the last TODO using sapply