# DTA250 - Fall 2023
# Jasser Jasser (JJ)

# Reading data into R ----
# You can read data into your working environment from different types of files
# Most common is CSV, JSON, and Excel

## Reading data from CSV file ----

#TODO
# Read the TomatoFirst.csv file and store it into a variable called df
# Use the read.csv() function
# Store the output into a variable called dfCSV
# Use the header parameter and set it to TRUE
# If your csv file in a sub directory, then you need to set that sub directory
# to be your working directory. Under the Files tab, navigate to that 
# sub directory, click on the cog icon and choose "Set As Working Directory"


## Read data from Excel File (xlsx) ----
# You need to have the readxl library installed for that

#TODO
# Install the readxl library using the install.packages() function
# Make sure you type "readxl" inside the parenthesis. (The quotations)


#TODO
# Load the readxl library using the library() function
# Whenever you need to use a library, you have to install it first if it is not
# installed, then you need to load it


#TODO
# Read the TomatoFirst.xlsx file using the read_excel() function
# Store the results into a variable called dfExcel


## Reading data from JSON file ----
# There are two libraries to read JSON files, rjson and jsonlite
# We will use jsonlite in this excercise

#TODO
# Install the jsonlite package using the install.packages() function


#TODO
# Load the jsonlite library using the library() function


#TODO
# Use the fromJSON() function to read the PizzaFavorites.json file
# Store the output into a variable called dfJSON

