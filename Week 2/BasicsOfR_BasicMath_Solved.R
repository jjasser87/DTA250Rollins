# DTA250 - Fall 2023
# Jasser Jasser (JJ)

# Basics of R ----
# In this chapter we will learn about R's mathematical capabilities, variables,
# functions, and data types

## Basic Math ----

# TODO
# Type 1 + 1 below and run your code either using the 'Run' button above
# or using the 'Run' command shortcut... Hover over the 'Run' command button
# above to find out what is the shortcut
1 + 1


# TODO
# Now try 3 * 7 * 2
3 * 7 * 2


# TODO
# How about 4/2
4/2


# TODO
# Or maybe... (4 * 6) + 5
(4 * 6) + 5


# TODO
# No wait... 4 * (6 + 5)
4 * (6 + 5)


# TODO
# Is the answer for (4 * 6) + 5 the same for 4 * (6 + 5)? Write your answer as 
# a comment
# Wait a minute? What is a comment?
# A comment is a line of code that is not executed by the computer. It is
# usually used to explain what the code is doing. In R, comments start with a
# pound sign (#). You can also use comments to temporarily remove a line of
# code from being executed by the computer. This is called commenting out a
# line of code.

# As to the answer above, no, the answer is not the same. Why? Because of
# PEMDAS. The computer follows the order of operations. It first does the
# operations inside the parenthesis, then the exponents, then the
# multiplication and division, and finally the addition and subtraction.

# The students' meme (https://www.pinterest.com/pin/552042866800890781/)
# The professors' meme (https://imgflip.com/i/3es7bu)


## Variables ----
# In the R programming language, a variable is a symbol or name that stands for
# a value and is used to store data.

### Variable Assignment ----

# TODO
# Assign the value 2 to the variable x using the <- assignment operator
x <- 2


# TODO
# Assign the value 5 to the variable y using the = assignment operator
y = 5


# TODO
# Assign the value 3 to the variable z using the -> assignment operator
3 -> z


# TODO
# Assign the value 7 to the variables a and b using the <- assignment operator
# You can only write 7 once
a <- b <- 7


# TODO
# Assign the value 4 to the variable j using the assign() function
assign("j", 4)


# Variable names in R can be a combination of letters, numbers, periods, and 
# underscores. However, they must start with a letter or a period. If they start
# with a period, the second character cannot be a number. Also, R is 
# case-sensitive, so a variable named 'My_Variable' is different from 
# 'my_variable'.

# TODO
# is .jj a good variable name? Yes. Notice the .jj is not added to the Environment.
# is .2j a good variable name? No
# is 2j a good variable name? No
# is _2j a good variable name? No
# is j2 a good variable name? Yes
# is j.2 a good variable name? Yes

### Removing Variables ----

# TODO
# Remove the variable j using the rm() function
rm(j)


# Why would you want to remove a variable in R?
# 1. Free Up Memory: Variables in R take up memory. If you're working with large
#   data sets or complex functions, your program could use a lot of memory, and 
#   this can slow down your computer or even cause it to run out of memory. 
#   By removing variables that you no longer need, you can free up memory and 
#   help your program run faster and more efficiently.
# 2. Data Management: In a complex script, you might create a lot of temporary 
#   variables that are used for intermediate steps. These variables can clutter 
#   your work space, making it harder to understand what's going on in your 
#   program. By removing these temporary variables when you're done with them, 
#   you can keep your work space clean and easy to understand.
# 3. Avoid Errors: If you have a variable in your work space from previous 
#   operations, it might interfere with your current operations, particularly if
#   you're reusing variable names. Removing variables when you're done with them
#   can help avoid this kind of error.

#TODO
# Remove the variable j again using the rm() function
rm(j)


#TODO
# Create a variable called var and assign the value 17 to it
var <- 17


#TODO
# Type in "Var" below and tell me what happens.
"var"

# That is because "var" (between quotes) is treated as string and not a variable
# name. We will learn more about strings in the coming classes.




