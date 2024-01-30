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
x <- 10:1

# Create a vector called y that contains the numbers from -4 to 5
y <- -4:5

# Create a vector called q and store the following into it:
c("Hockey", "Football", "Baseball", "Curling", "Rugby", "Lacrosse", 
  "Basketball", "Tennis", "Cricket", "Soccer")
q <- c("Hockey", "Football", "Baseball", "Curling", "Rugby", "Lacrosse", 
  "Basketball", "Tennis", "Cricket", "Soccer")


#TODO
# Create a data frame called df using the variables x, y, and q
# Use the function data.frame()

df <- data.frame(x, y, q)


#TODO
# Check the class of df using the class() function

class(df)



#TODO
# Can you check the number of columns in df using ncol() function

ncol(df)


#TODO
# Can you check the number of row in df using the nrow() function

nrow(df)


#TODO
# Can you check the dimensions of df using the dim() function

dim(df)


#TODO
# How about giving names to these columns.
# Recreate the data frame df using the variables x, y, q, and give them the
# names First, Second and, Sport
# Use the funtion data.frame()

df <- data.frame(First = x, Second = y, Sport = q)


#TODO
# Check the names of the columns in the df variable using the names() function
names(df)

#TODO
# Access the third column name using the names() function and []
names(df)[3]
# With the [] operator, you can access the elements of a vector
# The results of the names() function is a vector


#TODO
# Check the row names in the df variable using rownames() function
rownames(df)


#TODO
# Change the row names in df to the following using rownames() function
c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j")
# Notice the c() function
rownames(df) <- c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j")


#TODO
# Check the row names in the df variable using rownames() function
rownames(df)


# TODO
# Let us return the row names to their origin (generic index)
# Set the row names to NULL
# Huh? What is NULL?
# In R, NULL is a special object that indicates the absence of a value or 
# a missing value.
rownames(df) <- NULL


#TODO
# Check the row names in the df variable using rownames() function
rownames(df)


#TODO
# Can you check the first few rows in df using the head() function?
head(df)


#TODO
# Can you check the first 7 rows in df using the head() function?
head(df, 7)

head(df, 10) # If you want to see the top 10 rows


#TODO
# Can you check the last few rows in df using the tail() function?
tail(df)


#TODO
# Can you check the last 8 rows in df using the tail() function?
tail(df, 8)

tail(df, 10) # If you want to see the last 10 rows


#TODO
# Can you access the Sport column in df using the $ operator
df$Sport


#TODO
# What is the class of df$Sport?
class(df$Sport)
# because we are using the $ operator, we are accessing a single column
# By accessing a single column, the result is a vector


# What is the class of df["Sport"]
class(df["Sport"])
# In here, the results is a data frame because we are selecting that 
# particular column from the dataframe. The result is a data frame with a single
# column
# Notice that the index is still there.
df["Sport"]


# Similar to vectors, data frames allow us to access individual elements by their
# position using []. However, two positions need to be specified.
# The first is the row number and the second is the column number

#TODO
# Access the value of the third row from the Second column in df
df[3, 2]


#TODO
# Access the values of the third row from both the Second and Sport columns 
# in df
df[3, c(2, 3)]
# or
df[3, 2:3]
# or
df[3, c("Second", "Sport")] # better answer. Use the column names to make sure
# you are selecting the right columns.


#TODO
# Access the values of the third and fifth rows from the Second column in df
df[c(3, 5), 2]


#TODO
# Access the values of the third and fifth rows from the Second and Sport
# columns in df
df[c(3, 5), c(2, 3)]
# or
df[c(3, 5), 2:3]
# or
df[c(3, 5), c("Second", "Sport")] # better answer.


#TODO
# Access all the values in the Sport column using []
df[, 3]
# or
df[, "Sport"]

#TODO
# Access all the values in the Second and Sport columns using []
df[, c(2, 3)]
# or
df[, 2:3]
# or
df[, c("Second", "Sport")] # better answer.


#TODO
# Access all of row 2 using []
df[2, ]


#TODO
# Access all of rows 2 through 4 using []
df[2:4, ]


#TODO
# Access all values in columns First and Sport using []
df[, c("First", "Sport")]

