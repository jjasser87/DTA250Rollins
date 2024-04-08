# Homework 2
# Spring 2024

# Preparations ----

# Run the following code to create your data frame df
df <- read.csv("https://raw.githubusercontent.com/JaySquare87/DTA395-1Rollins/main/Week%202/Auto.csv", header=TRUE, sep=",")

# Let us check the first few rows of the data frame
# This way we can get an idea of the structure of the data frame
head(df)
# Notice that each row represents a car and each column represents a feature of the car.

# Remember that [] is used to access elements in a vector or list.
# [row/s , column/s]
# If you want to access all rows or all columns, you can leave the space empty.
# For example, df[1,] will access the first row and all columns.
# df[,1] will access all rows and the first column.

# Cell Access ----

# Access the value in the second row and third column of the df data frame?
second_row_third_column <- # Your code here
  
# Access the value of horsepower for the first car in the dataset.
horsepower_first_car <- # Your code here
  
# Access the number of cylinders (cylinders column) for the fifth car listed in df?
cylinders_fifth_car <- # Your code here
  
# Access the weight of the third car in the df data frame.
weight_third_car <- # Your code here
  
# Access the acceleration value of the tenth car in the dataset?
acceleration_tenth_car <- # Your code here
  
# Row Access ----
  
# Access all data for the first car in the dataset.
first_car <- # Your code here

# Retrieve all information about the seventh car in df?
seventh_car <- # Your code here

# Extract all details for the cars from the 15th till the 20th row of the df data frame.
cars_15_to_20 <- # Your code here

# Access all columns of the 20th, 26th, and 50th rows in df?
cars_20_26_50 <- # Your code here

# Access the information of the 30th through the 45h cars and the 47th, and 79th cars in the dataset.
# Use a combination of : and c() to achieve this.
cars_30_to_45_47_79 <- # Your code here
  
# Column Access ----

# Access all values in the mpg column.
mpg_column <- # Your code here
  
# Access the entire year column from df?
year_column <- # Your code here
  
# Access all values from the origin and year columns in the dataset.
origin_year_columns <- # Your code here

# Access columns 1 through 4 in the dataset?
columns_1_to_4 <- # Your code here

# Access columns 1 through 4 and the acceleration column in the dataset?
columns_1_to_4_acceleration <- # Your code here
  
# Combined Access ----
# Access the mpg and year for the first five cars in the dataset.
mpg_year_first_five <- # Your code here
  
# Access the horsepower and weight of cars 10 to 15 in df?
horsepower_weight_10_to_15 <- # Your code here
  
# Access the mpg, horsepower, and year for the 20th, 25th, and 30th cars in the dataset.
mpg_horsepower_year_20_25_30 <- # Your code here

# Extract the cylinders, displacement, and acceleration for cars with indices 30 through the 45 and the 47th, and 79th cars.
cylinders_displacement_acceleration_30_to_45_47_79 <- # Your code here

# Access the first 4 columns and acceleration for cars at positions 2 to 4, and 6 in the dataset?
columns_1_to_4_acceleration_2_to_4_6 <- # Your code here
  
