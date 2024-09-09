# DTA250
# Fall 2024
# JJ

#TODO
# Create a vector called x that contains the numbers from 10 to 1


# TODO
# Create a vector called y that contains the numbers from -4 to 5


#TODO
# Create a vector called q and store the following into it:
c("Hockey", "Baseball", "Football", "Tennis", "Basketball", "Baseball",
"Hockey", "Football", "Tennis", "Basketball", "Baseball", "Hockey",
"Football", "Tennis", "Basketball", "Baseball", "Hockey", "Football")


# TODO
# Convert the vector q into a factor and store it in a new variable called qf


# TODO
# Set the levels to be "Football", "Basketball", " Tennis", "Baseball", "Hockey"


# TODO
# Check the levels of qf using the levels() function


#TODO
# Create a data frame called df using the variables x, y, and qf
# Use the function data.frame() to create the data frame


#TODO
# Can you check the number of columns in df using ncol() function


#TODO
# Can you check the number of row in df using the nrow() function



#TODO
# Can you check the dimensions of df using the dim() function



#TODO
# How about giving names to these columns.
# Recreate the data frame df using the variables x, y, qf, and give them the
# names First, Second and, Sport
# Use the function data.frame()



#TODO
# Check the names of the columns in the df variable using the names() function


#TODO
# Can you check the first few rows in df using the head() function?



#TODO
# Can you check the first 7 rows in df using the head() function?



#TODO
# Can you check the last few rows in df using the tail() function?



#TODO
# Can you check the last 8 rows in df using the tail() function?


#TODO
# Get a summary of the data frame df using the summary() function


#TODO
# Get the structure of the data frame df using the str() function



#TODO
# Can you access the Sport column in df using the $ operator



#TODO
# What is the class of df$Sport?
# because we are using the $ operator, we are accessing the elements 
# in a single column
# By accessing the elements in the column, the result is a vector


# What is the class of df["Sport"]
# In here, the results is a data frame because we are selecting that 
# particular column from the data frame. The result is a data frame 
# with a single column
# Notice that the index is still there.


# Similar to vectors, data frames allow us to access individual elements 
# by their position using []. However, two positions need to be specified.
# The first is the row number and the second is the column number
# [row, column]

#TODO
# Access the value of the third row from the Second column in df



#TODO
# Access the values of the third row from both the Second and Sport columns 
# in df


#TODO
# Access the values of the third and fifth rows from the Second column in df


#TODO
# Access the values of the third and fifth rows from the Second and Sport
# columns in df


#TODO
# Access all the values in the Sport column using []


#TODO
# Access all the values in the Second and Sport columns using []


#TODO
# Access all of row 2 using []


#TODO
# Access all of rows 2 through 4 using []


#TODO
# Access all values in columns First and Sport using []
