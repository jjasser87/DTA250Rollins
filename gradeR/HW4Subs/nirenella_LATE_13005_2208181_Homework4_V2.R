# Homework 4. V2

# Question 1 ----
# Write a function named `area_triangle` that calculates the area of a triangle.
# The function should take two arguments, `base` and `height`, and return the area
# calculated using the formula 
# 0.5 × base × height
# Once the function is defined, use it to compute the area of a triangle
# with a base of 5 and a height of 7, and another with a base of 10 and a height of 15.

area_triangle <- function(base, height) {
  0.5 * base * height
}
  
# Test the function
area57 <- area_triangle(5, 7)
area1015 <- area_triangle(10, 15)

# Question 2 ----
# Write a function called even_or_odd that takes a number as an argument
# and will print "<number> is even" is the number is even. else, it will print
# "<number> is odd"
# Use the sprintf() function to format the output.
# Test your function on the following numbers 5, 8.

even_or_odd <- function(number) {
  if (number %%2 == 0) {
    print(sprintf("%d is even", number))
  } else {
    print(sprintf("%d is odd", number))
  }
}
  
# Test the function
evenodd5 <- even_or_odd(5)
evenodd8 <- even_or_odd(8)

# Question 3 ----
# Write a function named celsius_to_fahrenheit that converts temperature from 
# Celsius to Fahrenheit.
# The function should take a single argument, celsius, and return the 
# temperature in Fahrenheit,
# calculated using the formula
# (celsius × 9/5) + 32
# Once the function is defined, use it to convert the temperature from 
# Celsius to Fahrenheit for a temperature of 40°C, 25°C and -5°C.
# Inside the function, create an if statement to check if the temperature 
# calculated is greater than 90. If it is, return "It's hot!" 
# else, return "It's not hot!"

celsius_to_fahrenheit <- function(celsius) {
  fahrenheit <- (celsius * 9/5) + 32
  if(fahrenheit > 90) {
    return("It's hot!")
  } else {
    return("It's not hot!")
  }
}
  
# Test the function
celsius40 <- celsius_to_fahrenheit(40)
celsius25 <- celsius_to_fahrenheit(25)
celsius5 <- celsius_to_fahrenheit(5)
