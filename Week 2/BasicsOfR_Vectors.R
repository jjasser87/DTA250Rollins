# DTA250 - Fall 2023
# Jasser Jasser (JJ)

# Basics of R ----
# In this chapter we will learn about R's mathematical capabilities, variables,
# functions, and data types

## Vectors ----
# A vector is a collection of elements, all of the same type.
# A vector cannot be of mixed type.
# vectors play a crucial, and helpful, role in R. More than being a simple 
# containers, vectors in R are special in that R is a vectorized language.
# That means operations are applied to each element of the vector automatically,
# without the need to loop through the vector.
# Vectors don't have dimensions.
# No such thing as row vector or column vector

# The most common way to create a vector is using the c() function
# (remember me)
# The "c" stands for combine because multiple elements are being combined into a
# vector
# Let us start

#TODO
# create a vector of the numbers from 1 to 10 using the c() function


### Vector Operations ----

#TODO
# Multiply x by 3


#TODO
# Add 2 to x


#TODO
# subtract 3 from x


#TODO
# Divide x by 4


#TODO
# Raise x to the power of 2


#TODO
# Find the square root of x using the sqrt() function


#### The : operator ----
# The : operator is a shortcut which generates a sequence of consecutive numbers
# in either direction

# TODO
# Generate the number sequence starting at 1 and ending at 10 using :


#TODO
# Can you generate the number sequence backwards from 10 to 1 using :


#TODO
# How about number sequence from -2 to 3


#TODO
# or 5 to -7


#TODO
# Create a vector from 1 to 10 using : and store it in the variable x
# Create a vector from -5 to 4 using : and store it in the variable y


#TODO
# Add x and y
# Subtract y from x
# Multiply x and y
# Divide x and y
# Raise x to the power of y


#TODO
# Can you check the length of each using the length() function


#TODO
# Can you check the length of the summation of both vectors using length()


#TODO
# What would happen if you execute the below code
# x + c(1,2)


#TODO
# How about the following
# x + c(1,2,3)


#TODO
# Try and explain the following
# x <= 5


#TODO
# OK. Try x > y


#TODO
# Maybe x < y


#TODO
# To test whether all the resulting elements are True, use the all() function


#TODO
# To test whether any of the elements is True, use the any() function



