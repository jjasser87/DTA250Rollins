# Homework Assignment: Understanding Variables, Data Types, Vectors, and Factors in R
# DON'T CHANGE THE VARIABLE NAMES BECAUSE THEY ARE USED IN THE GRADING BY THE
# AUTOGRADER

# Part 1: Variables ----
# Create a variable called first_number and assign it the numeric
# value of 5
first_number <-  5 # Your code here
  
# Create a variable called second_number and assign it the integer
# value of 2
second_number <-  2L # Your code here
  
# Create a variable called my_character and assign it the character value "hello"
my_character <- "hello" # Your code here

# Create a variable called my_logical and assign it the logical 
# value of TRUE
my_logical <- TRUE # Your code here
  
# Part 2: Operations ----
# Add first_number and second_number and assign the result to a
# variable called sum_result.
sum_result <- first_number + second_number # Your code here
  
# Divide first_number by second_number and assign the result to a
# variable called div_result.
div_result <- first_number / second_number # Your code here
  
# Multiply first_number by my_logical and assign the result to a
# variable called mult_result.
mult_result <-  first_number * my_logical # Your code here
  
# Find the number of characters in my_character using nchar()
# and assign the result to a variable called char_result.
char_result <- nchar(my_character) # Your code here

# Part 3: Data Types ----
# Use the class() function to check the data type of first_number.
first_number_type <- class(first_number) # Your code here

# Use the is.integer() function to check whether the type of second_number
second_number_int_check <- is.integer(second_number) # Your code here

# Use the is.logical() function to check the data type of my_logical.
my_logical_check <- is.logical(my_logical) # Your code here

# Use the == operator to check whether my_logical_check is equal to
# second_number_int_check.
equal_check <- my_logical_check == second_number_int_check # Your code here

# Part 4: Vectors ----# Part 4: Vecsecond_number_int_checktors ----
# Create a numeric vector called num_vector with the three values 1, 2, 3
# Use the c() function.
num_vector <-  c(1,2,3) # Your code here
  
# Create a range of numbers starting from -5 to 7 using the : operator.
# Store the results in a variable called range_vector.
range_vector <- (-5:7) # Your code here

# Create a character vector called char_vector with the following character values.
# "apple", "banana", "cherry"
char_vector <-  c("apple", "banana", "cherry")# Your code here

# Create a logical vector called log_vector with 2 TRUEs and 1 FALSE.
# It doesnt matter what order you put them in.
log_vector <- c(TRUE,TRUE,FALSE) # Your code here
  
# Multiply num_vector by log_vector and assign the result to a
# variable called mult_vector.
mult_vector <- num_vector * log_vector # Your code here
  
# Produce the following vector by doing Boolean operations on the num_vector
# (FALSE, TRUE, TRUE) and store the result in a variable called bool_vector.
bool_vector <- num_vector > 1# Your code here

# Part 4: Factors
# Convert char_vector into a factor called factor_vector.
# Use as.factor() function.
factor_vector <- as.factor(char_vector) # Your code here

# Reassign the levels of factor_vector such that the first level is "cherry",
# followed by apple, and then banana.
# Store the results in a variable called factor_vector_level
# Use the factor() function this time.
# Or you can reassign the levels of factor_vector using the levels() function.
# First you need to reassign factor_vector to the new variable factor_vector_level
# Then you can use the levels() function to reassign the levels.
factor_vector_level <-  factor_vector
levels(factor_vector_level) <- c("cherry", "apple", "banana") # Your code here

# End of Homework Assignment
