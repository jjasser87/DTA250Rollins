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
df <- c(1,2,3,4,5,6,7,8,9,10)


### Vector Operations ----

#TODO
# Multiply x by 3
x * 3


#TODO
# Add 2 to x
x + 2


#TODO
# subtract 3 from x
x - 3


#TODO
# Divide x by 4
x / 4


#TODO
# Raise x to the power of 2
x ^ 2


#TODO
# Find the square root of x using the sqrt() function
sqrt(x)


#### The : operator ----
# The : operator is a shortcut which generates a sequence of consecutive numbers
# in either direction

# TODO
# Generate the number sequence starting at 1 and ending at 10 using :
1:10


#TODO
# Can you generate the number sequence backwards from 10 to 1 using :
10:1


#TODO
# How about number sequence from -2 to 3
-2:3


#TODO
# or 5 to -7
5:-7


#TODO
# Create a vector from 1 to 10 using : and store it in the variable x
# Create a vector from -5 to 4 using : and store it in the variable y
x <- 1:10
y <- -5:4


#TODO
# Add x and y
# Subtract y from x (The Devil...)
# Multiply x and y
# Divide x and y
# Raise x to the power of y

x + y
x - y
x * y
x / y
x ^ y



#TODO
# Can you check the length of each using the length() function
length(x)
length(y)


#TODO
# Can you check the length of the summation of both vectors using length()
length(x + y)


#TODO
# What would happen if you execute the below code
# x + c(1,2)
x + c(1,2)
# R keeps fitting the smaller vector to the larger one until there are no more
# values in the larger one
# 1 2 3 4 5 6 7 8 9 10
# 1 2 1 2 1 2 1 2 1 2


#TODO
# How about the following
# x + c(1,2,3)
x + c(1,2,3)
# Same as above
# 1 2 3 4 5 6 7 8 9 10
# 1 2 3 1 2 3 1 2 3 1


#TODO
# Try and explain the following
# x <= 5
x <= 5


#TODO
# OK. Try x > y
x > y


#TODO
# Maybe x < y
x < y


#TODO
# To test whether all the resulting elements are True, use the all() function
all(x > y)


#TODO
# To test whether any of the elements is True, use the any() function
any(x > y)


#The nchar() function also acts on each element of a vector

#TODO
# Create a vector, name it q and store the following values in it
c("Hockey", "Football", "Baseball", "Curling", "Rugby", "Lacrosse", "Basketball"
  , "Tennis", "Cricket", "Soccer")
q <- c("Hockey", "Football", "Baseball", "Curling", "Rugby", "Lacrosse", "Basketball"
  , "Tennis", "Cricket", "Soccer")


#TODO
# Run the nchar() function with the q variable as the parameter? What happened?
nchar(q)


#TODO
# Run the nchar() function with the y variable as the parameter? What happened?
nchar(y)
# -2 is 2 characters. the - is considered one character
# R convert the number -2 into a character so it ends up being 2 characters


# Accessing individual elements of a vector is done using the square brackets []
# The first element of x is retrieved by typing x[1]
# The first two elements by x[1:2]
# Non=consecutive elements by x[c(1,4)]

#TODO
# Try retrieving the first element of x
x[1]
q[1]


#TODO
# Try retrieving the first 4 elements in x
x[1:4]
q[1:4]


#TODO
# Try retrieving the first, fourth, sixth, and ninth elements in x
x[c(1,4,6,9)]
q[c(1,4,6,9)]


# Giving names to vectors!! Huh? What is that? Isn't that the variable name?
# It is possible to give names to a vector either during creation of after the 
# fact.
# An example:
c(One="a", Two="b", Last="z")

#TODO
# Create a vector from 1 to 3 and store it in the variable w
w <- c(1,2,3)


# Name the elements in w as follows "a", "b", "c" using the names() function
names(w) <- c("a", "b", "c")


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
q2 <- c(q, "Hockey", "Lacrosse", "Hockey", "Water Polo", "Hockey", "Lacrosse")


#TODO
# Convert q2 into a factor vector using the as.factor() function and store it
# into the variable q2Factor
# Notice the Levels of q2Factor
q2Factor <- as.factor(q2)


#TODO
# Convert q2Factor into numeric using the as.numeric() function?
# Notice something?
as.numeric(q2Factor)
# The numbers are the levels of the factor vector
# You can check the levels of a factor vector using the levels() function
# Try it
levels(q2Factor)
# Notice that R automatically assigns levels to the factor vector
# based on alphabetical order of the values in the vector


# What if you want to define the levels yourself? Yes. You can do that.

#TODO
# Use the below vector and follow my instructions
c("College", "PhD", "High School", "Masters")

education <- c("College", "PhD", "High School", "Masters")
# Check the levels
levels(education)
# obviously, the levels are not in the order we want
# You can't graduate from college and then from high school
# Assign the levels in the order you want
levels(education) <- c("High School", "College", "Masters", "PhD")

# Or you can assign them directly when creating the factor vector
education <- factor(education, levels=c("High School", "College", "Masters", "PhD"))
