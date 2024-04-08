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
second_row_third_column <- df[2,3]
second_row_third_column
# Access the value of horsepower for the first car in the dataset.
horsepower_first_car <- df[1,4]
horsepower_first_car
# Access the number of cylinders (cylinders column) for the fifth car listed in df?
cylinders_fifth_car <- df[5,2]
cylinders_fifth_car
# Access the weight of the third car in the df data frame.
weight_third_car <- df[3,5]
weight_third_car
# Access the acceleration value of the tenth car in the dataset?
acceleration_tenth_car <- df[10,6]
acceleration_tenth_car 
# Row Access ----
  
# Access all data for the first car in the dataset.
first_car <- df[1, ]
first_car
# Retrieve all information about the seventh car in df?
seventh_car <- df[7, ]
seventh_car

# Extract all details for the cars from the 15th till the 20th row of the df data frame.
cars_15_to_20 <- df[15:20, ]
cars_15_to_20
# Access all columns of the 20th, 26th, and 50th rows in df?
cars_20_26_50 <- df[c(20,26,50), ]
cars_20_26_50
# Access the information of the 30th through the 45h cars and the 47th, and 79th cars in the dataset.
# Use a combination of : and c() to achieve this.
cars_30_to_45_47_79 <- df[c(30:45,47,79), ]
cars_30_to_45_47_79
# Column Access ----

# Access all values in the mpg column.
mpg_column <- df[,1]
mpg_column  
# Access the entire year column from df?
year_column <- df[ ,7]
year_column
# Access all values from the origin and year columns in the dataset.
origin_year_columns <- df[ ,7:8]
origin_year_columns
# Access columns 1 through 4 in the dataset?
columns_1_to_4 <- df[ ,1:4]
columns_1_to_4
# Access columns 1 through 4 and the acceleration column in the dataset?
columns_1_to_4_acceleration <- df[ ,c(1:4,6)]
columns_1_to_4_acceleration
# Combined Access ----
# Access the mpg and year for the first five cars in the dataset.
mpg_year_first_five <- df[1:5,c(1,7)]
mpg_year_first_five
# Access the horsepower and weight of cars 10 to 15 in df?
horsepower_weight_10_to_15 <- df[10:15,4:5]
horsepower_weight_10_to_15  
# Access the mpg, horsepower, and year for the 20th, 25th, and 30th cars in the dataset.
mpg_horsepower_year_20_25_30 <- df[c(20,25,30),c(1,4,7)]
mpg_horsepower_year_20_25_30
# Extract the cylinders, displacement, and acceleration for cars with indices 30 through the 45 and the 47th, and 79th cars.
cylinders_displacement_acceleration_30_to_45_47_79 <- df[c(30:45,47,79),c(2:3,6)]
cylinders_displacement_acceleration_30_to_45_47_79
# Access the first 4 columns and acceleration for cars at positions 2 to 4, and 6 in the dataset?
columns_1_to_4_acceleration_2_to_4_6 <- df[c(2:4,6),c(1:4,6)]
columns_1_to_4_acceleration_2_to_4_6  
