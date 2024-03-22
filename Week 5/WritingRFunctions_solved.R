# DTA250 - Fall 2023
# Jasser Jasser (JJ)

# Writing R Functions ----
# Functions are a way to write code that can be reused

## The Hello World Function ----
# The simplest function is one that prints "Hello World" to the console
# The function is called hello_world and it takes no arguments

#TODO
# Write a function called hello_world that prints "Hello World" to the console
# Use the function() function to create the function (😵‍💫)
# Open a bracket after the function header
# Print "Hello World" to the console using the print() function
# Close the bracket after the print() function

hello_world <- function() {
  print("Hello World")
}

#TODO
# Call the hello_world function (Don't forget the parentheses!)
hello_world()

## Function Arguments ----
# Functions can take arguments
# Arguments are variables that are passed to the function
# Arguments can be used inside the function

# First, we need to learn about the sprintf() function
# The sprintf() function is used to format strings
# Its first argument is a string with special input characters and subsequent
# arguments that will be substituted into the special input characters.

#TODO
# Use the sprintf() function to create a string that says "Hello <name>!"
# The first argument of sprintf() should be "Hello %s!"
# The second argument of sprintf() should be the name argument

sprintf("Hello %s!", "Jasser")

#TODO
# Multiple arguments can be passed to sprintf()
# Use sprintf() to create a string that says "Hello <name>! You are <age> 
# years old!"
# The first argument of sprintf() should be "Hello %s! You are %d years old!"
# The second argument of sprintf() should be the name argument
# The third argument of sprintf() should be the age argument

sprintf("Hello %s! You are %d years old!", "Jasser", 20)

#TODO
# Create a function called hello_name that takes a name argument
# The function should print "Hello <name>!" to the console
# Use the sprintf() function to create the string
# Call the hello_name function with your name as the argument

hello_name <- function(name) {
  print(sprintf("Hello %s!", name))
}

hello_name("Jasser")

#TODO
# Create a function called hello_name_age that takes a name and age argument
# The function should print "Hello <name>! You are <age> years old!" to the
# console
# Use the sprintf() function to create the string
# Call the hello_name_age function with your name and age as the arguments

hello_name_age <- function(name, age) {
  print(sprintf("Hello %s! You are %d years old!", name, age))
}

hello_name_age("Jasser", 20)

## Function Return Values ----
# Functions can return values
# The return value of a function is the value that is returned when the
# function is called
# The return value of a function is specified using the return() function

#TODO
# Create a function that takes two numbers as arguments and returns their sum
# Name the function sum_numbers
# The function should return the sum of the two numbers

sum_numbers <- function(num1, num2) {
  return(num1 + num2)
}

sum_numbers(1, 2)

# The difference between a function that has the return statement and one that
# doesn't is that the function that has the return statement will return the
# value specified by the return statement while the function that doesn't have
# the return statement will return the last value in the function
# Please check the PDF file included in CANVAS for more explanation.

## do.call() ----
# The do.call() function is used to call a function with a list of arguments
# The first argument of do.call() is the function to call
# The second argument of do.call() is a list of arguments to pass to the
# function

#TODO
# Use the do.call() function to call the hello_name function with your name as
# the argument
# The first argument of do.call() should be the hello_name function
# The second argument of do.call() should be a list with your name as the
# argument (It needs to be a list)

do.call(hello_name, list("Jasser"))

