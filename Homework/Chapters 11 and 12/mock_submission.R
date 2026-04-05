library(tidyverse)
library(lubridate)

reviews <- tryCatch(
  suppressWarnings(
    readr::read_csv(
      "https://raw.githubusercontent.com/jjasser87/DTA250Rollins/refs/heads/main/Homework/Chapters%2011%20and%2012/customer%20reviews.csv",
      show_col_types = FALSE
    )
  ),
  error = function(e) {
    readr::read_csv("Homework/Chapters 11 and 12/customer reviews.csv", show_col_types = FALSE)
  }
) |>
  rename_with(~ str_replace_all(.x, " ", "_"))

positive_keywords <- c(
  "amazing", "captivating", "well-written", "insightful",
  "compelling", "engaging", "thought-provoking",
  "masterpiece", "inspiring", "beautiful", "page-turner",
  "brilliant", "highly recommended", "fantastic",
  "excellent", "powerful", "emotional", "unique",
  "must-read", "moving"
)

negative_keywords <- c(
  "boring", "disappointing", "poorly-written", "confusing",
  "predictable", "slow", "uninteresting", "cliché",
  "underwhelming", "tedious", "unoriginal", "flat",
  "uninspired", "overrated", "forgettable", "dull",
  "annoying", "frustrating", "weak", "unconvincing"
)

messy_title <- "   Data Science with R   "
book_title_clean <- trimws(messy_title)
title_character_count <- nchar(messy_title)
title_prefix <- substr(book_title_clean, 1, 12)
title_label <- paste("Current title", book_title_clean)
title_upper <- toupper(book_title_clean)

sample_review_title <- reviews$review_title[1]
sample_review_length <- str_length(sample_review_title)
sample_review_first_word <- word(sample_review_title, 2)
sample_review_snake <- str_replace_all(sample_review_title, " ", "_")
sample_review_lower <- str_to_lower(sample_review_title)

positive_pattern <- str_c(positive_keywords, collapse = "|")
negative_pattern <- str_c(negative_keywords, collapse = " ")

reviews_clean <- reviews |>
  rename(review = review_description) |>
  mutate(
    review_clean = review |>
      str_to_lower() |>
      str_replace_all("[[:punct:]]", " ") |>
      str_squish(),
    positive_matches = str_count(review_clean, positive_pattern),
    negative_matches = str_count(review_clean, str_c(negative_keywords, collapse = "|")),
    sentiment = ifelse(
      positive_matches > negative_matches,
      1,
      ifelse(negative_matches > positive_matches, -1, 0)
    ),
    review_date = dmy(date),
    review_year = year(review_date)
  ) |>
  select(
    book_name, review_title, review, review_clean, reviewer_rating,
    positive_matches, negative_matches, sentiment, review_date, review_year
  )

sentiment_summary <- reviews_clean |>
  mutate(
    sentiment_label = case_when(
      sentiment == -1 ~ "Negative",
      sentiment == 0 ~ "Neutral",
      TRUE ~ "Positive"
    )
  ) |>
  count(sentiment_label, name = "n") |>
  mutate(sentiment_label = factor(sentiment_label, levels = c("Negative", "Neutral", "Positive"))) |>
  arrange(sentiment_label)

rating_by_sentiment <- reviews_clean |>
  mutate(
    sentiment_label = case_when(
      sentiment == -1 ~ "Negative",
      sentiment == 0 ~ "Neutral",
      TRUE ~ "Positive"
    )
  ) |>
  group_by(sentiment_label) |>
  summarise(avg_rating = mean(reviewer_rating), .groups = "drop")

sentiment_plot <- ggplot(sentiment_summary, aes(x = sentiment_label, y = n)) +
  geom_col()

current_date <- today()
current_time <- now(tzone = "UTC")

reviews_time <- reviews |>
  mutate(
    review_date = dmy(date),
    review_year = year(review_date),
    review_month = month(review_date, label = TRUE, abbr = TRUE),
    review_day = day(review_date),
    review_weekday = wday(review_date, label = TRUE, abbr = FALSE, week_start = 1),
    days_since_first_review = as.numeric(review_date - min(review_date))
  ) |>
  select(
    book_name, reviewer_rating, review_date, review_year, review_month,
    review_day, review_weekday, days_since_first_review
  )

monthly_review_counts <- reviews_time |>
  count(review_month, name = "review_count")

monthly_average_rating <- reviews_time |>
  group_by(review_month) |>
  summarise(average_rating = median(reviewer_rating), .groups = "drop")

weekday_average_rating <- reviews_time |>
  group_by(review_weekday) |>
  summarise(average_rating = mean(reviewer_rating), .groups = "drop") |>
  mutate(
    review_weekday = factor(
      review_weekday,
      levels = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")
    )
  ) |>
  arrange(review_weekday)

monthly_review_plot <- ggplot(monthly_review_counts, aes(x = review_month, y = review_count)) +
  geom_col(fill = "steelblue")

monthly_rating_plot <- ggplot(monthly_average_rating, aes(x = review_month, y = average_rating, group = 1)) +
  geom_line(color = "darkgreen")

weekday_rating_plot <- ggplot(weekday_average_rating, aes(x = review_weekday, y = average_rating)) +
  geom_line(color = "darkorange")
