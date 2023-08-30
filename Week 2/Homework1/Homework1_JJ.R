# DTA250 - Fall 2023
# Homework 1
# JJ
# IF YOU MANAGED TO FIND THIS FILE ON GitHub BEFORE THE DEADLIEN OF THIS 
# HOMEWORK, YOU ARE A CLEVER PERSON AND DESERVES A FULL GRADE.

# Question 1 ----
# Create Variables and Perform Operations:

# Assigning the value 10 to the variable num1 using the <- operator
num1 <- 10

# Assigning the value 5 to the variable num2 using the <- operator
num2 <- 5

# Assigning the value 3 to the variable num3 using the <- operator
num3 <- 3

# Calculating the sum of the three variables and storing the results in the 
# variable sum_result
sum_result <- num1 + num2 + num3

# Calculating the product of the three variables and storing the results in the
# product_result variable
product_result <- num1 * num2 * num3

# Calculating raising the num1 variable to the power of num2 variable and
# storing the results in a variable called power_result
power_result <- num1 ^ num2

# Checking whether num1 is an integer
is.integer(num1)

# Checking whether product_result is numeric
is.numeric(product_result)

# Question 2 ----
# Characters

# Creating the fruits vector from the assignment
fruits <- c("Apple", "Banana", "Cherry", "Date", "Elderberry")

# Determining the character length in each fruit name using the nchar() function
nchar(fruits)

# Elderberry has the most characters

# Question 3 ----
# Dates

# Creating the dates vector from the assignment
string_dates <- c("2023-01-01", "2022-05-15", "2021-08-29", "2022-02-28", 
                  "2021-12-31")

# Converting the string_dates vector into Date object using the as.Date()
# function and storing the results into the date_objects variable
date_objects <- as.Date(string_dates)

# Computing the difference, in days, between each date in date_objects and the
# date "2023-08-29". The results are stored in the variable days_diff
days_diff <- date_objects - as.Date("2023-08-29")

# Question 4 ----
# Logical

# TRUE & FALSE is FALSE
# TRUE | TRUE is TRUE
# !TRUE is FALSE
# (TRUE & FALSE) | (!FALSE) is TRUE. FALSE | TRUE will result in TRUE
# Yes they are the same.
# From the help: & and && indicate logical AND and | and || indicate logical OR.
# The shorter forms performs element wise comparisons in much the same way as 
# arithmetic operators. The longer forms evaluates left to right, proceeding 
# only until the result is determined. The longer form is appropriate for 
# programming control-flow and typically preferred in if clauses.

# Question 5 ----
# Vectors

# Creating the sales vector from the assignment
sales <- c(1200, 1300, 1250, 1100, 1150, 1400, 1450, 1300, 1350, 1100, 1250, 
           1400)

# Calculating the average of the sales and storing the results in the variable
# mean_sale
mean_sales <- mean(sales)

# Finding the months were sales above the yearly average using the > operator
above_mean <- (sales > mean_sales) * c(1:12)
