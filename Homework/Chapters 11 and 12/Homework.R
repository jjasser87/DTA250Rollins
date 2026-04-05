# Chapters 11 and 12 Homework
# Complete each task by writing code in the sections marked `TODO`.
# Keep the object names exactly as written because the grading script expects
# those names to exist after the file is sourced.

library(tidyverse)

# -------------------------------------------------------------------------
# Data
# -------------------------------------------------------------------------

# Data: load directly from GitHub and standardize the column names.
reviews <- read_csv(
      "https://raw.githubusercontent.com/jjasser87/DTA250Rollins/refs/heads/main/Homework/Chapters%2011%20and%2012/customer%20reviews.csv",
      show_col_types = FALSE
    ) |>
  rename_with(~ str_replace_all(.x, " ", "_"))


# Keywords found in positive book reviews
positive_keywords <- c(
  "amazing", "captivating", "well-written", "insightful",
  "compelling", "engaging", "thought-provoking",
  "masterpiece", "inspiring", "beautiful", "page-turner",
  "brilliant", "highly recommended", "fantastic",
  "excellent", "powerful", "emotional", "unique",
  "must-read", "moving"
)


# Keywords found in negative book reviews
negative_keywords <- c(
  "boring", "disappointing", "poorly-written", "confusing",
  "predictable", "slow", "uninteresting", "cliché",
  "underwhelming", "tedious", "unoriginal", "flat",
  "uninspired", "overrated", "forgettable", "dull",
  "annoying", "frustrating", "weak", "unconvincing"
)

# -------------------------------------------------------------------------
# Chapter 11: String Manipulation and Regular Expressions
# -------------------------------------------------------------------------

# Task 1
# Use base R string functions with the text below.
messy_title <- "   Data Science with R   "

# TODO: Create the following objects.
# book_title_clean -> remove leading/trailing spaces with trimws()
# title_character_count -> count characters in the cleaned title with nchar()
# title_prefix -> extract the first 12 characters with substr()
# title_label -> combine "Current title:" and the cleaned title with paste()
# title_upper -> convert the cleaned title to uppercase
book_title_clean <- NULL
title_character_count <- NULL
title_prefix <- NULL
title_label <- NULL
title_upper <- NULL


# Task 2
# Use stringr functions with the first review title.
sample_review_title <- reviews$review_title[1]

# TODO: Create the following objects.
# sample_review_length -> use str_length()
# sample_review_first_word -> extract the first word with str_extract()
# sample_review_snake -> replace spaces with underscores using str_replace_all()
# sample_review_lower -> convert the title to lowercase with str_to_lower()
sample_review_length <- NULL
sample_review_first_word <- NULL
sample_review_snake <- NULL
sample_review_lower <- NULL


# Task 3
# Create regular expression patterns for the positive and negative keywords.
# Use str_c() to combine the keywords with "|" between them.

# TODO: Create positive_pattern and negative_pattern
positive_pattern <- NULL
negative_pattern <- NULL


# Task 4
# Clean and analyze the review text.
# 1. Rename review_description to review.
# 2. Create review_clean by converting to lowercase.
# 3. Remove punctuation from review_clean.
# 4. Remove extra spaces from review_clean.
# 5. Create positive_matches with str_count().
# 6. Create negative_matches with str_count().
# 7. Create sentiment:
#    1 if positive_matches > negative_matches
#   -1 if negative_matches > positive_matches
#    0 otherwise
# 8. Parse date with dmy() into review_date.
# 9. Extract review_year from review_date using year() function.
#
# Keep only the columns listed below in this order:
# book_name, review_title, review, review_clean, reviewer_rating,
# positive_matches, negative_matches, sentiment, review_date, review_year

# TODO: Create reviews_clean
reviews_clean <- NULL


# Task 5
# Summarize the sentiment results.
#
# sentiment_summary:
#   count the number of reviews in each sentiment category and create a
#   sentiment_label column with values "Negative", "Neutral", and "Positive".
#   Sort the rows in that order.
#
# rating_by_sentiment:
#   compute the average reviewer_rating for each sentiment_label and name the
#   numeric summary column average_rating.

# TODO: Create sentiment_summary
# TODO: Create rating_by_sentiment
sentiment_summary <- NULL
rating_by_sentiment <- NULL


# Task 6
# Create a bar chart of the sentiment counts.
# Map sentiment_label to x and n to y.
# Fill the bars by sentiment_label and remove the legend.
# Title: "Review Sentiment Counts"
# x-axis label: "Sentiment"
# y-axis label: "Number of Reviews"

# TODO: Create sentiment_plot
sentiment_plot <- NULL


# -------------------------------------------------------------------------
# Chapter 12: Dates, Times, and Time Series
# -------------------------------------------------------------------------

# Task 7
# Create two objects using lubridate:
# current_date -> today()
# current_time -> now(tzone = "America/New_York")

# TODO: Create current_date
# TODO: Create current_time
current_date <- NULL
current_time <- NULL


# Task 8
# Parse and enrich the review date data using the same reviews dataset.
# 1. Create review_date with dmy(date)
# 2. Create review_year, review_month, review_day, and review_weekday
# 3. Create days_since_first_review with interval() and time_length() using the
#    earliest review_date
#
# Keep the columns listed below in this order:
# book_name, reviewer_rating, review_date, review_year, review_month,
# review_day, review_weekday, days_since_first_review

# TODO: Create reviews_time
reviews_time <- NULL


# Task 9
# Create three summary tables.
#
# monthly_review_counts:
#   count the number of reviews by month and name the count column review_count
#
# monthly_average_rating:
#   average reviewer_rating by month and name the summary column average_rating
#
# weekday_average_rating:
#   average reviewer_rating by weekday in Monday-Sunday order and name the
#   summary column average_rating
# 	Use the wday() function

# TODO: Create monthly_review_counts
# TODO: Create monthly_average_rating
# TODO: Create weekday_average_rating
monthly_review_counts <- NULL
monthly_average_rating <- NULL
weekday_average_rating <- NULL


# Task 10
# Create three plots.
#
# monthly_review_plot:
#   a column chart of monthly review counts
#
# monthly_rating_plot:
#   a line chart of average monthly ratings
#
# weekday_rating_plot:
#   a column chart of average weekday ratings

# TODO: Create monthly_review_plot
# TODO: Create monthly_rating_plot
# TODO: Create weekday_rating_plot
monthly_review_plot <- NULL
monthly_rating_plot <- NULL
weekday_rating_plot <- NULL
