# DTA250 - Fall 2023
# Jasser Jasser (JJ)

# Before I start with loops, let us do some review of control statements

#TODO
# Create a function that would take a grade as an input
# If the grade is greater than or equal to 90, print "A"
# If the grade is greater than or equal to 80, print "B"
# If the grade is greater than or equal to 70, print "C"
# If the grade is greater than or equal to 60, print "D"
# Else, print "F"

printGrade <- function(grade) {
  if (grade >= 90) {
    print("A")
  } else if (grade >= 80) {
    print("B")
  } else if (grade >= 70) {
    print("C")
  } else if (grade >= 60) {
    print("D")
  } else {
    print("F")
  }
}


# Loops ----
# Most people use loops to iterate over elements of a vector, list, or 
# data frame. While it is natural to do this in other languages, it is
# not the best way to do it in R. In R, we use vectorized functions
# Nevertheless, sometimes we need to use loops. Therefore, R offers both
# for loops and while loops.

## The for Loop ----
# The for loop is used to iterate over a sequence of elements. The syntax
# of the for loop is as follows:
# for (variable in sequence) {
#   statement
# }
# The variable is the variable that will be used to iterate over the
# sequence. The sequence is a vector, list, or data frame. The statement
# is the code that will be executed in each iteration.

# TODO
# Create a vector of numbers from 1 to 10
# Create a for loop that iterates over the vector and prints each element
# of the vector

x <- 1:10
for (i in x) {
  print(i)
}


# TODO
# Repeat the last TODO.
# Create a for loop that iterates over the vector and prints the square
# of each element of the vector

for (i in x) {
  print(i^2)
}


# TODO
# Create the following vector c("apple", "banana", "pomegranate") in a variable
# called fruits
# Create a for loop that iterates over the vector and prints each element
# of the vector

fruits <- c("apple", "banana", "pomegranate")
for (i in fruits) {
  print(i)
}


# TODO
# Repeat the last TODO.
# Create a for loop that iterates over the vector and prints the number
# of characters of each element of the vector

for (i in fruits) {
  print(nchar(i))
}


# While Loop ----
# The while loop is used to execute a block of code as long as a condition
# is true. The syntax of the while loop is as follows:
# while (condition) {
#   statement
# }
# The condition is a logical expression. The statement is the code that
# will be executed as long as the condition is true.

# TODO
# Create a variable called i and set it to 1
# Create a while loop that prints the value of i as long as i is less than
# or equal to 10

i <- 1
while (i <= 10) {
  print(i)
  i <- i + 1
}


# TODO
# Repeat the last TODO.
# Create a while loop that prints the square of i as long as i is less than
# or equal to 10

i <- 1
while (i <= 10) {
  print(i^2)
  i <- i + 1
}


# Controlling Loops ----
# Sometimes we need to control the flow of a loop. For example, we may
# need to skip an iteration or break out of a loop. We can do this using
# the next and break statements.

# TODO
# Create a for loop that iterates over the numbers from 1 to 10
# If the number is even, skip the iteration
# If the number is odd, print the number

for (i in 1:10) {
  if (i %% 2 == 0) {
    next
  }
  print(i)
}


# TODO
# Repeat the last TODO.
# Create a for loop that iterates over the numbers from 1 to 10
# If the number is even, skip the iteration
# If the number is odd, print the square of the number
# If the number is 5, break out of the loop

for (i in 1:10) {
  if (i %% 2 == 0) {
    next
  }
  if (i == 5) {
    break
  }
  print(i^2)
}