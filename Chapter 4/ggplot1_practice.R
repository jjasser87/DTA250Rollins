# Title: RPG Data Visualization Practice with ggplot2
# Author: JJ Jasser
# Date: Fall 2025
# Description: This script provides practice exercises for creating visualizations 
# using the ggplot2 library in R. The goal is to recreate plots from the 
# base R practice, but this time using ggplot2's grammar of graphics.
# The RPG.csv dataset contains variables such as Armor, Weapon, Physical, 
# Magic, Level, FBoss (logical), and Class (character).

# --- Setup ---

# Step 1: Load the ggplot2 library. If you don't have it installed,
# run install.packages("ggplot2") in the console first.


# Step 2: Load the dataset. Make sure to replace "path/to/your/RPG.csv" 
# with the actual file path on your computer.


# Step 3: It's good practice to treat character variables used for grouping
# as factors. Convert the 'Class' variable to a factor.


# --- Plotting Tasks ---

# Task 1: Scatter Plot
# Create a scatter plot to examine the relationship between a character's 
# 'Level' and their 'Physical' attack power.
#   - Place 'Level' on the x-axis.
#   - Place 'Physical' on the y-axis.
#   - Add a title: "Character Level vs. Physical Attack Power".
#   - Label the x-axis "Level" and the y-axis "Physical Attack".

# Your ggplot2 code for the scatter plot goes here:



# Task 2: Box Plot
# Create a box plot to compare the 'Magic' damage distribution across 
# different character 'Class' types.
#   - Place 'Class' on the x-axis.
#   - Place 'Magic' on the y-axis.
#   - Add a title: "Magic Damage Distribution by Class".
#   - Label the x-axis "Character Class" and the y-axis "Magic Damage".

# Your ggplot2 code for the box plot goes here:



# Task 3: Bar Plot
# Create a bar plot to show the count of characters in each 'Class'.
#   - Map the 'Class' variable to the x-axis.
#   - Use geom_bar() to automatically count the occurrences of each class.
#   - Add a title: "Number of Characters per Class".
#   - Label the x-axis "Class" and the y-axis "Count".

# Your ggplot2 code for the bar plot goes here:



# Task 4: Histogram
# Create a histogram to visualize the distribution of 'Armor' values 
# for all characters.
#   - Map the 'Armor' variable to the x-axis.
#   - Experiment with the 'binwidth' or 'bins' argument in geom_histogram() 
#     to see how it changes the plot's appearance. Start with a binwidth of 10.
#   - Add a title: "Distribution of Armor Values".
#   - Label the x-axis "Armor" and the y-axis "Frequency".

# Your ggplot2 code for the histogram goes here:



# Task 5: Advanced Scatter Plot with Aesthetics
# Enhance the scatter plot from Task 1 by adding more visual information.
#   - Create the same scatter plot with 'Level' on the x-axis and 
#     'Physical' on the y-axis.
#   - Color the points based on the character's 'Class'.
#   - Change the shape of the points based on whether they defeated the 
#     final boss ('FBoss').
#   - Add a title: "Level vs. Physical Attack by Class and Boss Victory".
#   - Label the x-axis "Level" and the y-axis "Physical Attack".

# Your ggplot2 code for the advanced scatter plot goes here:
