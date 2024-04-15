## DTA250 - Spring 2024
## JJ

# Manipulating Strings

# Strings are a sequence of characters. In R, strings are represented by the 
# character data type.
# In this script, we will learn how to manipulate strings in R.

# paste function
# The paste function is used to concatenate strings. It takes an arbitrary number
# of arguments and concatenates them into a single string.

# TODO
# Create a string from the following words: "Hello", "World", "from", "R"
# and store it in a variable called greeting.

greeting <- paste("Hello", "World", "from", "R")

# TODO
# Repeat the last TODO but this time use the sep argument to separate the words
# with a , (comma).

greeting <- paste("Hello", "World", "from", "R", sep = ", ")

# TODO
# We want to say "Hello" to the following people: "Alice", "Bob", "Charlie".
# However, we don't want to write the greeting for each person separately.
# Use the paste function to create a single string that greets all three people.

people <- c("Alice", "Bob", "Charlie")
greeting <- paste("Hello", people, sep = ", ")

# The collapse function
# The collapse function is used to concatenate strings and collapse them into a
# single string. It is similar to the paste function, but it collapses the
# resulting vector into a single string.

# TODO
# Repeat the last TODO but this time use the collapse argument to collapse the
# resulting vector into a single string.

greeting <- paste("Hello", people, sep = ", ", collapse = " ")

# Not a good look for the greeting. Let's fix it. We need to add a period at the
# end of the greeting.

# TODO
# Add a period at the end of the greeting.

greeting <- paste("Hello", people, sep = ", ", collapse = ". ")

# The sprintf function
# The sprintf function is used to format strings. It takes a format string and
# a set of arguments and returns a formatted string.

# TODO
# Let us do a quick review. Assume we have the following variables:
# name = "Alice"
# age = 25
# height = 5.5
# weight = 130
# Use the sprintf function to create a string that says:
# "Alice is 25 years old, 5.5 feet tall, and weighs 130 pounds."

name <- "Alice"
age <- 25
height <- 5.5
weight <- 130
sprintf("%s is %d years old, %.1f feet tall, and weighs %d pounds.", 
        name, age, height, weight)

# The strsplit function
# The strsplit function is used to split strings into substrings. It takes a
# string and a delimiter as arguments and returns a list of substrings.

# TODO
# Split the following string into words: "Hello World from R".

strsplit("Hello World from R", " ")

# The stringr package
# The stringr package is a part of the tidyverse and provides a set of functions
# for working with strings. It is an alternative to the base R functions for
# manipulating strings.

# TODO
# Load the tidyverse package.

library(tidyverse)

# The str_c function
# The str_c function is similar to the paste function. It is used to concatenate
# strings.

# TODO
# Create a string from the following words: "Hello", "World", "from", "R"
# and store it in a variable called greeting.

greeting <- str_c("Hello", "World", "from", "R")

# We need to add space between the words. Let's fix it.

# TODO
# Repeat the last TODO but this time use the sep argument to separate the words
# with a space.

greeting <- str_c("Hello", "World", "from", "R", sep = " ")

# The str_glue function
# The str_glue function is used to interpolate strings. It takes a format string
# and a set of arguments and returns a formatted string.

# TODO
# Assume we have the following variables:
# name = "Alice"
# age = 25
# height = 5.5
# weight = 130
# Use the str_glue function to create a string that says:
# "Alice is 25 years old, 5.5 feet tall, and weighs 130 pounds."
# You don't need to recreate the variables again, use the ones from the previous
# example.

str_glue("{name} is {age} years old, {height} feet tall, and weighs {weight} pounds.")

# The str_split function
# The str_split function is similar to the strsplit function. It is used to split
# strings into substrings.

# TODO
# Split the following string into words: "Hello World from R".

str_split("Hello World from R", " ")

# The str_replace function
# The str_replace function is used to replace substrings in a string. It takes a
# string, a pattern to match, and a replacement string as arguments and returns
# the modified string.

# TODO
# Replace the word "World" with "Universe" in the following string:
# "Hello World from R".

str_replace("Hello World from R", "World", "Universe")

# The str_detect function
# The str_detect function is used to check if a string contains a pattern. It
# takes a string and a pattern as arguments and returns a logical value.

# TODO
# Check if the following string contains the word "World":
# "Hello World from R".

str_detect("Hello World from R", "World")

# The str_count function
# The str_count function is used to count the occurrences of a pattern in a
# string. It takes a string and a pattern as arguments and returns the number of
# occurrences.

# TODO
# Count the occurrences of the word "World" in the following string:
# "Hello World from R".

str_count("Hello World from R", "World")

# The str_length function
# The str_length function is used to get the length of a string. It takes a
# string as an argument and returns the number of characters in the string.

# TODO
# Get the length of the following string:
# "Hello World from R".

str_length("Hello World from R")

# The str_to_lower and str_to_upper functions
# The str_to_lower function is used to convert a string to lowercase. The
# str_to_upper function is used to convert a string to uppercase.

# TODO
# Convert the following string to lowercase:
# "Hello World from R".

str_to_lower("Hello World from R")

# TODO
# Convert the following string to uppercase:
# "Hello World from R".

str_to_upper("Hello World from R")

# The str_trim function
# The str_trim function is used to remove leading and trailing whitespace from a
# string.

# TODO
# Remove leading and trailing whitespace from the following string:
# "   Hello World from R   ".
# Hint: The string has leading and trailing whitespace.

str_trim("   Hello World from R   ")

# The str_replace_all function
# The str_replace_all function is used to replace all occurrences of a pattern in
# a string. It takes a string, a pattern to match, and a replacement string as
# arguments and returns the modified string.

# TODO
# Replace all occurrences of the word "World" with "Universe" in the following
# string:
# "Hello World from World".

str_replace_all("Hello World from World", "World", "Universe")

# The str_sub function
# The str_sub function is used to extract a substring from a string. It takes a
# string, a start position, and an end position as arguments and returns the
# substring.

# TODO
# Extract the word "World" from the following string:
# "Hello World from R".

str_sub("Hello World from R", start = 7, end = 11)

# The str_locate function
# The str_locate function is used to find the position of a pattern in a string.
# It takes a string and a pattern as arguments and returns the start and end
# positions of the pattern.

# TODO
# Find the position of the word "World" in the following string:
# "Hello World from R".

str_locate("Hello World from R", "World")

# The str_extract function
# The str_extract function is used to extract the first occurrence of a pattern
# in a string. It takes a string and a pattern as arguments and returns the
# extracted substring.

# TODO
# Extract the word "World" from the following string:
# "Hello World from R".

str_extract("Hello World from R", "World")

# The str_extract_all function
# The str_extract_all function is used to extract all occurrences of a pattern in
# a string. It takes a string and a pattern as arguments and returns a vector of
# extracted substrings.

# TODO
# Extract all occurrences of the word "World" in the following string:
# "Hello World from World".

str_extract_all("Hello World from World", "World")

# The str_subset function
# The str_subset function is used to filter a vector of strings based on a
# pattern. It takes a vector of strings and a pattern as arguments and returns a
# vector of strings that match the pattern.

# TODO
# Filter the following vector of strings to include only the strings that contain
# the word "World":
# c("Hello World from R", "Goodbye Universe from Python", "Hello World from
# Python").

str_subset(c("Hello World from R", "Goodbye Universe from Python", "Hello World from Python"), "World")

