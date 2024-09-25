# DTA250
# Fall 2024
# JJ

#TODO
# Create a vector called x that contains the numbers from 10 to 1
x <- 10:1


# TODO
# Create a vector called y that contains the numbers from -4 to 5
y <- -4:5


#TODO
# Create a vector called q and store the following into it:
c("Hockey", "Baseball", "Football", "Tennis", "Basketball", "Baseball",
"Hockey", "Football", "Tennis", "Basketball", "Baseball", "Hockey",
"Football", "Tennis", "Basketball", "Baseball", "Hockey", "Football")

q <- c("Hockey", "Baseball", "Football", "Tennis", "Basketball", "Baseball",
"Hockey", "Football", "Tennis", "Basketball", "Baseball", "Hockey",
"Football", "Tennis", "Basketball", "Baseball", "Hockey", "Football")


# TODO
# Convert the vector q into a factor and store it in a new variable called qf
qf <- factor(q)


# TODO
# Set the levels to be "Football", "Basketball", " Tennis", "Baseball", "Hockey"
qf <- factor(q, 
    levels = c("Football", "Basketball", "Tennis", "Baseball", "Hockey"))


# TODO
# Check the levels of qf using the levels() function
levels(qf)


#TODO
# Create a data frame called df using the variables x, y, and qf
# Use the function data.frame() to create the data frame
df <- data.frame(x, y, qf)

# That didn't go as planned. The number of elements in x and y are not the same
# We need to increase the number of elements in x and y to 18
# You can't create a data frame with vectors of different lengths
x <- 18:1
y <- -4:13

# Let's try creating the data frame again
df <- data.frame(x, y, qf)


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
# Recreate the data frame df using the variables x, y, qf, and give them the
# names First, Second and, Sport
# Use the function data.frame()
df <- data.frame(First = x, Second = y, Sport = qf)



#TODO
# Check the names of the columns in the df variable using the names() function
names(df)


#TODO
# Can you check the first few rows in df using the head() function?
head(df)



#TODO
# Can you check the first 7 rows in df using the head() function?
head(df, 7)



#TODO
# Can you check the last few rows in df using the tail() function?
tail(df)



#TODO
# Can you check the last 8 rows in df using the tail() function?
tail(df, 8)


#TODO
# Get a summary of the data frame df using the summary() function
summary(df)


#TODO
# Get the structure of the data frame df using the str() function
str(df)



#TODO
# Can you access the Sport column in df using the $ operator
df$Sport



#TODO
# What is the class of df$Sport?
# because we are using the $ operator, we are accessing the elements 
# in a single column
# By accessing the elements in the column, the result is a vector
class(df$Sport)


# What is the class of df["Sport"]
# In here, the results is a data frame because we are selecting that 
# particular column from the data frame. The result is a data frame 
# with a single column
# Notice that the index is still there.
class(df["Sport"])


# Similar to vectors, data frames allow us to access individual elements 
# by their position using []. However, two positions need to be specified.
# The first is the row number and the second is the column number
# [row, column]

#TODO
# Access the value of the third row from the Second column in df
df[3, "Second"]



#TODO
# Access the values of the third row from both the Second and Sport columns 
# in df
df[3, c("Second", "Sport")]


#TODO
# Access the values of the third and fifth rows from the Second column in df
df[c(3, 5), "Second"]


#TODO
# Access the values of the third and fifth rows from the Second and Sport
# columns in df
df[c(3, 5), c("Second", "Sport")]


#TODO
# Access all the values in the Sport column using []
df[,"Sport"]


#TODO
# Access all the values in the Second and Sport columns using []
df[, c("Second", "Sport")]


#TODO
# Access all of row 2 using []
df[2,]


#TODO
# Access all of rows 2 through 4 using []
df[2:4,]


#TODO
# Access all values in columns First and Sport using []
df[, c("First", "Sport")]
