# Load necessary libraries
library(tidyverse)


# Load the datasets
reviews <- read.csv("https://raw.githubusercontent.com/jjasser87/DTA250Rollins/refs/heads/main/Homework/customer%20reviews.csv")


# Create positive and negative keywords vectors (using AI)
# Vector of keywords found in positive book reviews
positive_keywords <- c("amazing", "captivating", "well-written", "insightful",
						"compelling", "engaging", "thought-provoking",
						"masterpiece", "inspiring", "beautiful", "page-turner",
						"brilliant", "highly recommended", "fantastic",
						"excellent", "powerful", "emotional", "unique",
						"must-read", "moving")


# Display the vector
positive_keywords


# Vector of keywords found in negative book reviews
negative_keywords <- c("boring", "disappointing", "poorly-written", "confusing",
						"predictable", "slow", "uninteresting", "cliché",
						"underwhelming", "tedious", "unoriginal", "flat",
						"uninspired", "overrated", "forgettable", "dull",
						"annoying", "frustrating", "weak", "unconvincing")


# Display the vector
negative_keywords


# Create regular expression patterns for both positive and negative keywords
# Use a stringr function to concatenate the keywords



# Rename reviews_description in reviews to review



# Clean the review column


# Detect the sentiment of the reviews based on the number of positive and
# negative keywords
# If the number of positive keywords is greater than the number of negative
# keywords, the sentiment is 1
# If the number of negative keywords is greater than the number of positive
# keywords, the sentiment is -1
# If the number of positive and negative keywords is equal, the sentiment is 0