# DTA250 - Fall 2023
# Jasser Jasser (JJ)

# Control Statements ----
# Control statements are used to control the flow of code
# Depending on the value of a test, different code can be executed
# Test result in a logical value (TRUE or FALSE)

## The if else Statement ----
# The if else statement is used to execute code based on a test
# If the test is TRUE, the code inside the if statement is executed
# If the test is FALSE, the code inside the else statement is executed

# Before that, let us do some review of logical operators
# Logical operators are used to compare values
# They result in a logical value (TRUE or FALSE)
# The most common logical operators are:
# == (equal to)
# != (not equal to)
# < (less than)
# > (greater than)
# <= (less than or equal to)
# >= (greater than or equal to)

#TODO
# Use the == operator to compare 1 and 1


#TODO
# Use the != operator to compare 1 and 2


#TODO
# Use the < operator to compare 1 and 2


#TODO
# Use the > operator to compare 1 and 2


#TODO
# Use the <= operator to compare 1 and 1


#TODO
# assign the value 1 to a variable called toCompare


#TODO
# Write an if statement that checks if toCompare is equal to 1
# If it is, print "toCompare is equal to 1"
# Start by writing if (toCompare == 1) { and then press enter
# RStudio will automatically add the closing bracket for you
# Write the print statement inside the curly brackets


# To add an else statement, write else { and then press enter
# after the if statement


#TODO
# Write a function called checkIfEqual that takes a single argument
# The function should check if the argument is equal to 1
# If it is, print "Argument is equal to 1"
# else, print "Argument is not equal to 1"
# Start by writing checkIfEqual <- function(x) { and then press enter
# RStudio will automatically add the closing bracket for you
# Write the if else statement inside the curly brackets
# Call the function with the value 1
# Call the function with the value 2


# else if statements
# else if statements can be used to check multiple conditions
# If the first condition is not met, the second condition is checked
# If the second condition is not met, the third condition is checked
# and so on

#TODO
# Write a function called checkIfEqual that takes a single argument
# The function should check if the argument is equal to 1
# If it is, print "Argument is equal to 1"
# else if it is equal to 2, print "Argument is equal to 2"
# else, print "Argument is not equal to 1 or 2"
# Start by writing checkIfEqual <- function(x) { and then press enter
# RStudio will automatically add the closing bracket for you
# Write the if else statement inside the curly brackets
# Call the function with the value 1
# Call the function with the value 2
# Call the function with the value 3


## Switch Statements ----
# Switch statements are used to check multiple conditions
# They are similar to else if statements
# Switch statements are more readable when there are many conditions

#TODO
# Write a function called checkIfEqual that takes a single argument
# The function should check if the argument is equal to "a"
# If it is, print "first"
# else if it is equal to "b", print "second"
# else if it is equal to "c", print "third"
# else if it is equal to "z", print "last"
# else, print "other"
# Start by writing checkIfEqual <- function(x) { and then press enter
# RStudio will automatically add the closing bracket for you
# Write the switch statement inside the curly brackets
# Call the function with the value "a"
# Call the function with the value "b"
# Call the function with the value "c"
# Call the function with the value "z"
# Call the function with the value "d"


## ifelse() Function ----
# The ifelse() function is used to check multiple conditions
# It is similar to the if else statement

#TODO
# Write an ifelse() statement that checks if 1 is equal to 1
# If it is, print "Yes"
# else, print "No"


#TODO
# Create the following vector: c(1, 1, 0, 1, 0, 1)
# Use the ifelse() function to check if each element is equal to 1
# If it is, print "Yes"
# else, print "No"


#TODO
# Repeat the previous TODO
# This time, if the element is equal to 1, multiple the element by 2
# else, print "No"


## Compound Tests ----
# Compound tests are used to check multiple conditions
# The most common compound tests are:
# & (and)
# | (or)
# ! (not)

#TODO
# Create the following vector: c(1, 1, 0, 1, 0, 1) and assign 
# it to a variable called toTest
# Create another vector with the following values: c(1, 1, 0, 0, 1, 1)
# Assign it to a variable called toTest2
# Use the & operator to check if each element in toTest is equal to 1
# and if each element in toTest2 is equal to 0 
# use the ifelse() function to print "Yes" if the test is TRUE
# and "No" if the test is FALSE


#TODO
# Repeat the previous TODO
# However, this time, use the | operator