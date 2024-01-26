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
# Create a vector of the numbers from 1 to 10 using the c() function
# Sore it in a variable called x


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
# Subtract y from x (The Devil...)
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


#The nchar() function also acts on each element of a vector

#TODO
# Create a vector, name it q and store the following values in it
c("Hockey", "Football", "Baseball", "Curling", "Rugby", "Lacrosse", "Basketball"
  , "Tennis", "Cricket", "Soccer")


#TODO
# Run the nchar() function with the q variable as the parameter? What happened?


#TODO
# Run the nchar() function with the y variable as the parameter? What happened?


# Accessing individual elements of a vector is done using the square brackets []
# The first element of x is retrieved by typing x[1]
# The first two elements by x[1:2]
# Non=consecutive elements by x[c(1,4)]

#TODO
# Try retrieving the first element of x


#TODO
# Try retrieving the first 4 elements in x


#TODO
# Try retrieving the first, fourth, sixth, and ninth elements in x


# Giving names to vectors!! Huh? What is that? Isn't that the variable name?
# It is possible to give names to a vector either during creation of after the 
# fact.
# An example:
c(One="a", Two="b", Last="z")

#TODO
# Create a vector from 1 to 3 and store it in the variable w


# Name the elements in w as follows "a", "b", "c" using the names() function


### Factor Vectors ----
# A factor is a data structure used for fields that take on a limited, 
# and usually fixed, number of possible values (categorical data). 
# Factors are an integral part of the R programming language and are very useful
# in statistical modeling and data analysis.

#TODO
# Store the following vector in the variable q2
c(q, "Hockey", "Lacrosse", "Hockey", "Water Polo", "Hockey", "Lacrosse")
# Wait a minute! what is q doing in there? 
# (https://www.nytimes.com/2022/02/19/technology/qanon-messages-authors.html)
# q is the vector we created above, we are using it and adding some more values
# to it and storing all of these values into the new variable q2


#TODO
# Convert q2 into a factor vector using the as.factor() function and store it
# into the variable q2Factor
# Notice the Levels of q2Factor


#TODO
# Convert q2Factor into numeric using the as.numeric() function?
# Notice something?


# What if you want to define the levels yourself? Yes. You can do that.

#TODO
# Use the below vector and follow my instructions
c("College", "PhD", "High School", "Masters")
