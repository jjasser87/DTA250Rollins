# DTA250 - Fall 2023
# Jasser Jasser (JJ)

# Advanced Data Structures ----
# Sometimes you need a more complex storage than simple vectors

## data.frames ----
# Think of a data frame as an Excel spreadsheet in that it has columns and 
# rows. In statistical terms, each column is a variable and each row is an
# observation
# Each column is actually a vector, each of which has the same length.

#TODO
# Create a vector called x that contains the numbers from 10 to 1

# Create a vector called y that contains the numbers from -4 to 5

# Create a vector called q and store the following into it:
c("Hockey", "Football", "Baseball", "Curling", "Rugby", "Lacrosse", 
  "Basketball", "Tennis", "Cricket", "Soccer")


#TODO
# Create a data frame called df using the variables x, y, and q
# Use the function data.frame()


#TODO
# Check the class of df using the class() function


#TODO
# Can you check the number of columns in df using ncol() function


#TODO
# Can you check the number of row in df using the nrow() function


#TODO
# Can you check the dimensions of df using the dim() function


#TODO
# How about giving names to these columns.
# Recreate the data frame df using the variables x, y, q, and give them the
# names First, Second and, Sport
# Use the funtion data.frame()


#TODO
# Check the names of the columns in the df variable using the names() function


#TODO
# Access the third column name using the names() function and []


#TODO
# Check the row names in the df variable using rownames() function


#TODO
# Change the row names in df to the following using rownames() function
c("a", "b", "c", "d", "e", "f", "g", "h", "i", "jj")
# Notice the c() function


#TODO
# Check the row names in the df variable using rownames() function


# TODO
# Let us return the row names to their origin (generic index)
# Set the row names to NULL
# Huh? What is NULL?
# In R, NULL is a special object that indicates the absence of a value or 
# a missing value.


#TODO
# Check the row names in the df variable using rownames() function


#TODO
# Can you check the first few rows in df using the head() function?


#TODO
# Can you check the first 7 rows in df using the head() function?


#TODO
# Can you check the last few rows in df using the tail() function?


#TODO
# Can you check the last 8 rows in df using the tail() function?


#TODO
# Can you access the Sport column in df using the $ operator


# Similar to vectors, data frames allow us to access individual elements by their
# position using []. However, two positions need to be specified.
# The first is the row number and the second is the column number

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

