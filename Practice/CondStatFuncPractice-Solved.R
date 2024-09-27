# DTA250 Fall 2024
# Conditional Statements and Functions Practice
# JJ

# Question 1 (Easy)
# Write a function that takes in a number and returns "even" if the number is 
# even and "odd" if the number is odd.

even_odd <- function(x) {
  if (x %% 2 == 0) {
    return("even")
  } else {
    return("odd")
  }
}

# Test the function
even_odd(2)  # "even"
even_odd(3)  # "odd"

# Question 2 (Medium)
# Write a function that takes in a number and returns "positive" if the number
# is positive, "negative" if the number is negative, and "zero" if the number
# is zero.
# What if you provide a character or a logical value to the function?
# You need to make sure that the class of the input is numeric.
# Use the class() function to check the class of the input.

pos_neg_zero <- function(x) {
  if (class(x) != "numeric") {
    return("Please provide a numeric value.")
  }
  
  if (x > 0) {
    return("positive")
  } else if (x < 0) {
    return("negative")
  } else {
    return("zero")
  }
}

# Test the function
pos_neg_zero(5)    # "positive"
pos_neg_zero(-3)   # "negative"
pos_neg_zero(0)    # "zero"
pos_neg_zero("a")  # "Please provide a numeric value."

# Question 3 (Hard)
# Write a function that takes two numbers, x and y, and returns returns
# "positive and between 1 and 10" if the sum of the two numbers is positive and
# between 1 and 10, "positive and greater than 10" if the sum is positive and
# greater than 10, "negative and between -10 and -1" if the sum is negative
# and between -10 and -1, "negative and less than -10" if the sum is negative
# and less than -10, and "zero" if the sum is zero.
# You can solve this either using nested if-else statements or using logical
# operators.
# You also need to make sure that the class of the inputs is numeric.

# Using nested if-else statements

sum_pos_neg_zero <- function(x, y) {
  if (class(x) != "numeric" | class(y) != "numeric") {
    return("Please provide numeric values.")
  }
  
  sum <- x + y
  
  if (sum > 0) {
    if (sum <= 10) {
      return("positive and between 1 and 10")
    } else {
      return("positive and greater than 10")
    }
  } else if (sum < 0) {
    if (sum >= -10) {
      return("negative and between -10 and -1")
    } else {
      return("negative and less than -10")
    }
  } else {
    return("zero")
  }
}

# Using logical operators

sum_pos_neg_zero <- function(x, y) {
  if (class(x) != "numeric" | class(y) != "numeric") {
    return("Please provide numeric values.")
  }
  
  sum <- x + y
  
  if (sum > 0 & sum <= 10) {
    return("positive and between 1 and 10")
  } else if (sum > 10) {
    return("positive and greater than 10")
  } else if (sum < 0 & sum >= -10) {
    return("negative and between -10 and -1")
  } else if (sum < -10) {
    return("negative and less than -10")
  } else {
    return("zero")
  }
}

# Test the function
sum_pos_neg_zero(5, 3)    # "positive and between 1 and 10"
sum_pos_neg_zero(7, 5)    # "positive and greater than 10"
sum_pos_neg_zero(-3, -5)  # "negative and between -10 and -1"
sum_pos_neg_zero(-7, -5)  # "negative and less than -10"
sum_pos_neg_zero(0, 0)    # "zero"
