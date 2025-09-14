# Basic Data Visualization (Base R Functions)
# This script contains instructions as comments. Your task is to write the R code
# below each instruction to generate the specified plots using base R functions.
# The examples here are slightly different from those presented in the main textbook
# to give you more practice with different variables from the RPG dataset.

# --- Section 1: Setup ---

# Instruction 1: Load the RPG Dataset.
# The 'RPG.csv' dataset contains synthetic information about hypothetical role-playing
# game (RPG) characters. It has 7 variables: Armor, Weapon, Physical, Magic, Level,
# FBoss (logical), and Class (character).
# Use the 'read.csv()' function to load the 'RPG.csv' file into a data frame
# named 'df'.
# Assume 'RPG.csv' is in your current working directory.
# (Hint: If you need to download the dataset, it's available from the official
# GitHub repository mentioned in the course materials, as noted in Section 5.2 of the book .)

# Write your code below this comment:



# Instruction 2: Inspect the structure and first few rows of the loaded dataset.
# Use 'str()' to view the structure of 'df' and 'head()' to see its first few rows,
# as discussed in Section 5.2.1 .

# Write your code below this comment:



# --- Section 2: Scatter Plots with plot() ---

# Instruction 3: Create a scatter plot of 'Armor' vs. 'Weapon'.
# A scatter plot visualizes the relationship between two numerical variables .
# Use the 'plot()' function.
# - Map 'df$Armor' to the x-axis and 'df$Weapon' to the y-axis.
# - Set the main title of the plot to "Armor vs. Weapon".
# - Label the x-axis as "Armor".
# - Label the y-axis as "Weapon".
# (Refer to Section 5.3.1 for general scatter plot usage ).

# Write your code below this comment:



# --- Section 3: Histograms with hist() ---

# Instruction 4: Create a histogram of the 'Physical' variable.
# A histogram displays the distribution of a single numerical variable .
# Use the 'hist()' function.
# - Use 'df$Physical' as the data for the histogram.
# - Set the main title to "Physical Strength Distribution".
# - Label the x-axis as "Physical Strength".
# - Label the y-axis as "Frequency".
# (Refer to Section 5.3.2 for general histogram usage ).

# Write your code below this comment:



# --- Section 4: Box Plots with boxplot() ---

# Instruction 5: Create a box plot of the 'Weapon' variable.
# A box plot is useful for visualizing the distribution of a numerical variable and
# identifying outliers .
# Use the 'boxplot()' function.
# - Use 'df$Weapon' as the data for the box plot.
# - Set the main title to "Weapon Damage Distribution".
# - Label the y-axis as "Weapon Damage".
# (Refer to Section 5.3.3 for general box plot usage ).

# Write your code below this comment:



# --- Section 5: Bar Plots with barplot() ---

# Instruction 6: Create a bar plot of the 'FBoss' (Final Boss) variable distribution.
# A bar plot displays the frequency or proportion of a categorical variable .
# Use the 'barplot()' function.
# - First, calculate the frequency of the 'FBoss' variable (TRUE/FALSE) using the 'table()' function on 'df$FBoss'.
# - Pass the result of 'table()' to the 'barplot()' function.
# - Set the main title to "Final Boss Defeat Status".
# - Label the x-axis as "Defeated Final Boss".
# - Label the y-axis as "Count".
# (Refer to Section 5.3.4 for general bar plot usage).

# Write your code below this comment: