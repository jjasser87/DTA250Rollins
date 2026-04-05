suppressPackageStartupMessages({
  library(tidyverse)
  library(lubridate)
})


`%||%` <- function(x, y) {
  if (is.null(x) || length(x) == 0 || (length(x) == 1 && is.na(x))) {
    return(y)
  }
  x
}


find_homework_dir <- function() {
  candidates <- c(
    tryCatch(dirname(normalizePath(sys.frames()[[1]]$ofile, winslash = "/", mustWork = FALSE)), error = function(e) NA_character_),
    getwd(),
    file.path(getwd(), "Homework", "Chapters 11 and 12")
  )

  candidates <- unique(candidates[!is.na(candidates)])

  for (candidate in candidates) {
    if (file.exists(file.path(candidate, "customer reviews.csv"))) {
      return(normalizePath(candidate, winslash = "/", mustWork = FALSE))
    }
  }

  stop("Could not locate the Homework/Chapters 11 and 12 directory.")
}


script_dir <- find_homework_dir()
default_submission <- file.path(script_dir, "Homework.R")
input_args <- commandArgs(trailingOnly = TRUE)


load_reviews <- function(script_dir) {
  github_url <- paste0(
    "https://raw.githubusercontent.com/jjasser87/DTA250Rollins/",
    "refs/heads/main/Homework/Chapters%2011%20and%2012/customer%20reviews.csv"
  )
  local_path <- file.path(script_dir, "customer reviews.csv")

  out <- tryCatch(
    suppressWarnings(readr::read_csv(github_url, show_col_types = FALSE)),
    error = function(e) {
      readr::read_csv(local_path, show_col_types = FALSE)
    }
  )

  out |>
    rename_with(~ str_replace_all(.x, " ", "_"))
}


build_reference <- function(script_dir) {
  reviews <- load_reviews(script_dir)

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

  book_title_clean <- trimws("   Data Science with R   ")
  title_character_count <- nchar(book_title_clean)
  title_prefix <- substr(book_title_clean, 1, 12)
  title_label <- paste("Current title:", book_title_clean)
  title_upper <- toupper(book_title_clean)

  sample_review_title <- reviews$review_title[1]
  sample_review_length <- str_length(sample_review_title)
  sample_review_first_word <- str_extract(sample_review_title, "^[A-Za-z]+")
  sample_review_snake <- str_replace_all(sample_review_title, " ", "_")
  sample_review_lower <- str_to_lower(sample_review_title)

  positive_pattern <- str_c(positive_keywords, collapse = "|")
  negative_pattern <- str_c(negative_keywords, collapse = "|")

  reviews_clean <- reviews |>
    rename(review = review_description) |>
    mutate(
      review_clean = review |>
        str_to_lower() |>
        str_replace_all("[[:punct:]]", " ") |>
        str_squish(),
      positive_matches = str_count(review_clean, positive_pattern),
      negative_matches = str_count(review_clean, negative_pattern),
      sentiment = case_when(
        positive_matches > negative_matches ~ 1,
        negative_matches > positive_matches ~ -1,
        TRUE ~ 0
      ),
      review_date = dmy(date),
      review_year = year(review_date)
    ) |>
    select(
      book_name, review_title, review, review_clean, reviewer_rating,
      positive_matches, negative_matches, sentiment, review_date,
      review_year
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
    summarise(average_rating = mean(reviewer_rating), .groups = "drop") |>
    mutate(sentiment_label = factor(sentiment_label, levels = c("Negative", "Neutral", "Positive"))) |>
    arrange(sentiment_label)

  sentiment_plot <- ggplot(sentiment_summary, aes(x = sentiment_label, y = n, fill = sentiment_label)) +
    geom_col() +
    labs(
      title = "Review Sentiment Counts",
      x = "Sentiment",
      y = "Number of Reviews"
    ) +
    theme_minimal() +
    theme(legend.position = "none")

  current_date <- today()
  current_time <- now(tzone = "America/New_York")

  reviews_time <- reviews |>
    mutate(
      review_date = dmy(date),
      review_year = year(review_date),
      review_month = month(review_date, label = TRUE, abbr = FALSE),
      review_day = day(review_date),
      review_weekday = wday(review_date, label = TRUE, abbr = FALSE, week_start = 1),
      days_since_first_review = time_length(interval(min(review_date), review_date), "days")
    ) |>
    select(
      book_name, reviewer_rating, review_date, review_year, review_month,
      review_day, review_weekday, days_since_first_review
    )

  monthly_review_counts <- reviews_time |>
    count(review_month, name = "review_count")

  monthly_average_rating <- reviews_time |>
    group_by(review_month) |>
    summarise(average_rating = mean(reviewer_rating), .groups = "drop")

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
    geom_col(fill = "steelblue") +
    labs(
      title = "Monthly Review Counts",
      x = "Month",
      y = "Number of Reviews"
    ) +
    theme_minimal()

  monthly_rating_plot <- ggplot(
    monthly_average_rating,
    aes(x = review_month, y = average_rating, group = 1)
  ) +
    geom_line(linewidth = 1, color = "darkgreen") +
    geom_point(size = 2, color = "darkgreen") +
    labs(
      title = "Average Monthly Rating",
      x = "Month",
      y = "Average Rating"
    ) +
    theme_minimal()

  weekday_rating_plot <- ggplot(weekday_average_rating, aes(x = review_weekday, y = average_rating)) +
    geom_col(fill = "darkorange") +
    labs(
      title = "Average Rating by Weekday",
      x = "Weekday",
      y = "Average Rating"
    ) +
    theme_minimal()

  list(
    book_title_clean = book_title_clean,
    title_character_count = title_character_count,
    title_prefix = title_prefix,
    title_label = title_label,
    title_upper = title_upper,
    sample_review_length = sample_review_length,
    sample_review_first_word = sample_review_first_word,
    sample_review_snake = sample_review_snake,
    sample_review_lower = sample_review_lower,
    positive_pattern = positive_pattern,
    negative_pattern = negative_pattern,
    reviews_clean = reviews_clean,
    sentiment_summary = sentiment_summary,
    rating_by_sentiment = rating_by_sentiment,
    sentiment_plot = sentiment_plot,
    current_date = current_date,
    current_time = current_time,
    reviews_time = reviews_time,
    monthly_review_counts = monthly_review_counts,
    monthly_average_rating = monthly_average_rating,
    weekday_average_rating = weekday_average_rating,
    monthly_review_plot = monthly_review_plot,
    monthly_rating_plot = monthly_rating_plot,
    weekday_rating_plot = weekday_rating_plot
  )
}


compare_atomic <- function(observed, expected) {
  isTRUE(all.equal(observed, expected, check.attributes = FALSE))
}


compare_time_close <- function(observed, expected, seconds = 600) {
  if (!inherits(observed, "POSIXct")) {
    return(FALSE)
  }
  abs(as.numeric(difftime(observed, expected, units = "secs"))) <= seconds &&
    identical(tz(observed), tz(expected))
}


compare_df <- function(observed, expected) {
  if (!is.data.frame(observed)) {
    return(FALSE)
  }

  normalize_df <- function(x) {
    x <- as.data.frame(x)

    for (i in seq_along(x)) {
      if (is.factor(x[[i]])) {
        x[[i]] <- as.character(x[[i]])
      }
    }

    x
  }

  obs <- normalize_df(observed)
  exp <- normalize_df(expected)

  if (!identical(names(obs), names(exp))) {
    return(FALSE)
  }

  if (!identical(nrow(obs), nrow(exp)) || !identical(ncol(obs), ncol(exp))) {
    return(FALSE)
  }

  isTRUE(all.equal(obs, exp, check.attributes = FALSE, tolerance = 1e-8))
}


compare_plot <- function(observed, expected) {
  if (!inherits(observed, "ggplot") || !inherits(expected, "ggplot")) {
    return(FALSE)
  }

  normalize_plot_df <- function(x) {
    x <- as.data.frame(x)

    for (i in seq_along(x)) {
      if (is.factor(x[[i]])) {
        x[[i]] <- as.character(x[[i]])
      }
    }

    x
  }

  build_observed <- tryCatch(ggplot_build(observed), error = function(e) NULL)
  build_expected <- tryCatch(ggplot_build(expected), error = function(e) NULL)

  if (is.null(build_observed) || is.null(build_expected)) {
    return(FALSE)
  }

  if (length(build_observed$data) != length(build_expected$data)) {
    return(FALSE)
  }

  observed_geoms <- map_chr(observed$layers, ~ class(.x$geom)[1])
  expected_geoms <- map_chr(expected$layers, ~ class(.x$geom)[1])

  if (!identical(observed_geoms, expected_geoms)) {
    return(FALSE)
  }

  observed_labels <- observed$labels
  expected_labels <- expected$labels
  label_fields <- c("title", "x", "y")

  for (field in label_fields) {
    if (!identical(observed_labels[[field]] %||% "", expected_labels[[field]] %||% "")) {
      return(FALSE)
    }
  }

  for (i in seq_along(build_expected$data)) {
    obs_df <- normalize_plot_df(build_observed$data[[i]])
    exp_df <- normalize_plot_df(build_expected$data[[i]])

    common_cols <- intersect(names(obs_df), names(exp_df))
    common_cols <- setdiff(
      common_cols,
      c("PANEL", "group", "flipped_aes", "colour", "fill", "linewidth", "linetype", "alpha")
    )

    obs_df <- obs_df[, common_cols, drop = FALSE]
    exp_df <- exp_df[, common_cols, drop = FALSE]

    if (!identical(names(obs_df), names(exp_df))) {
      return(FALSE)
    }

    if (!identical(nrow(obs_df), nrow(exp_df)) || !identical(ncol(obs_df), ncol(exp_df))) {
      return(FALSE)
    }

    if (!isTRUE(all.equal(obs_df, exp_df, check.attributes = FALSE, tolerance = 1e-8))) {
      return(FALSE)
    }
  }

  TRUE
}


collect_functions <- function(expr) {
  out <- character()

  recurse <- function(node) {
    if (!is.call(node)) {
      return(invisible(NULL))
    }

    head <- node[[1]]

    if (is.symbol(head)) {
      name <- as.character(head)
      if (!name %in% c("(", "{")) {
        out <<- c(out, name)
      }
    } else if (is.call(head) && is.symbol(head[[1]]) && as.character(head[[1]]) %in% c("::", ":::")) {
      out <<- c(out, as.character(head[[3]]))
    }

    if (length(node) >= 2) {
      for (i in 2:length(node)) {
        recurse(node[[i]])
      }
    }
  }

  recurse(expr)
  unique(out)
}


extract_assignment_calls <- function(parsed_exprs) {
  assignments <- list()

  for (expr in parsed_exprs) {
    if (!is.call(expr)) {
      next
    }

    head <- expr[[1]]
    if (!is.symbol(head) || !as.character(head) %in% c("<-", "=")) {
      next
    }

    lhs <- expr[[2]]
    rhs <- expr[[3]]

    if (!is.symbol(lhs)) {
      next
    }

    assignments[[as.character(lhs)]] <- collect_functions(rhs)
  }

  assignments
}


object_specs <- tibble(
  task = c(
    "Task 1", "Task 1", "Task 1", "Task 1", "Task 1",
    "Task 2", "Task 2", "Task 2", "Task 2",
    "Task 3", "Task 3",
    "Task 4",
    "Task 5", "Task 5",
    "Task 6",
    "Task 7", "Task 7",
    "Task 8",
    "Task 9", "Task 9", "Task 9",
    "Task 10", "Task 10", "Task 10"
  ),
  object_name = c(
    "book_title_clean", "title_character_count", "title_prefix", "title_label", "title_upper",
    "sample_review_length", "sample_review_first_word", "sample_review_snake", "sample_review_lower",
    "positive_pattern", "negative_pattern",
    "reviews_clean",
    "sentiment_summary", "rating_by_sentiment",
    "sentiment_plot",
    "current_date", "current_time",
    "reviews_time",
    "monthly_review_counts", "monthly_average_rating", "weekday_average_rating",
    "monthly_review_plot", "monthly_rating_plot", "weekday_rating_plot"
  ),
  comparator = c(
    "atomic", "atomic", "atomic", "atomic", "atomic",
    "atomic", "atomic", "atomic", "atomic",
    "atomic", "atomic",
    "df",
    "df", "df",
    "plot",
    "atomic", "time_close",
    "df",
    "df", "df", "df",
    "plot", "plot", "plot"
  ),
  required_functions = I(list(
    "trimws",
    "nchar",
    "substr",
    "paste",
    "toupper",
    "str_length",
    "str_extract",
    "str_replace_all",
    "str_to_lower",
    "str_c",
    "str_c",
    c("rename", "str_to_lower", "str_replace_all", "str_squish", "str_count", "dmy", "year", "case_when"),
    character(),
    character(),
    character(),
    "today",
    "now",
    c("dmy", "year", "month", "day", "wday", "interval", "time_length"),
    character(),
    character(),
    character(),
    character(),
    character(),
    character()
  )),
  forbidden_functions = I(list(
    "str_trim",
    "str_length",
    "str_sub",
    "str_c",
    "str_to_upper",
    "nchar",
    "word",
    "gsub",
    "tolower",
    "paste",
    "paste",
    c("grepl", "str_extract"),
    character(),
    character(),
    character(),
    "Sys.Date",
    "Sys.time",
    c("parse_date_time", "format", "as.numeric", "str_extract", "mdy", "ymd_hms", "str_c"),
    character(),
    character(),
    character(),
    character(),
    character(),
    character()
  ))
)


run_comparison <- function(observed, expected, comparator) {
  switch(
    comparator,
    atomic = compare_atomic(observed, expected),
    df = compare_df(observed, expected),
    plot = compare_plot(observed, expected),
    time_close = compare_time_close(observed, expected),
    FALSE
  )
}


reference <- build_reference(script_dir)
check_function_usage <- function(object_name, required_functions, forbidden_functions, assignment_calls) {
  used_functions <- assignment_calls[[object_name]] %||% character()

  required_ok <- all(required_functions %in% used_functions)
  forbidden_ok <- !any(forbidden_functions %in% used_functions)

  list(
    used_functions = paste(sort(used_functions), collapse = ", "),
    function_check = required_ok && forbidden_ok
  )
}

resolve_submission_paths <- function(input_args, default_submission, script_dir) {
  if (length(input_args) == 0) {
    return(list(
      submission_paths = normalizePath(default_submission, winslash = "/", mustWork = FALSE),
      output_dir = script_dir
    ))
  }

  normalized_inputs <- normalizePath(input_args, winslash = "/", mustWork = FALSE)

  if (length(normalized_inputs) == 1 && dir.exists(normalized_inputs[1])) {
    folder <- normalized_inputs[1]
    submission_paths <- list.files(folder, pattern = "\\.R$", full.names = TRUE)
    submission_paths <- submission_paths[!basename(submission_paths) %in% c(
      "grade_homework.R",
      "Homework.R"
    )]
    submission_paths <- normalizePath(submission_paths, winslash = "/", mustWork = FALSE)

    return(list(
      submission_paths = submission_paths,
      output_dir = folder
    ))
  }

  return(list(
    submission_paths = normalized_inputs,
    output_dir = dirname(normalized_inputs[1])
  ))
}


grade_submission <- function(submission_path, reference, object_specs, output_dir) {
  student_env <- new.env(parent = globalenv())
  source_error <- NULL
  parsed_submission <- NULL

  if (!file.exists(submission_path)) {
    stop("Submission file not found: ", submission_path)
  }

  tryCatch(
    {
      parsed_submission <- parse(submission_path, keep.source = TRUE)
    },
    error = function(e) {
      source_error <<- conditionMessage(e)
    }
  )

  tryCatch(
    sys.source(submission_path, envir = student_env),
    error = function(e) {
      source_error <<- conditionMessage(e)
    }
  )

  if (!is.null(source_error)) {
    grade_table <- tibble(
      task = "Submission",
      object_name = "SOURCE_ERROR",
      status = "error",
      output_check = FALSE,
      function_check = FALSE,
      used_functions = "",
      points_earned = 0L,
      points_possible = 1L,
      message = source_error
    )
  } else {
    assignment_calls <- extract_assignment_calls(parsed_submission)

    grade_table <- pmap_dfr(
      object_specs,
      function(task, object_name, comparator, required_functions, forbidden_functions) {
        if (!exists(object_name, envir = student_env, inherits = FALSE)) {
          return(
            tibble(
              task = task,
              object_name = object_name,
              status = "missing",
              output_check = FALSE,
              function_check = FALSE,
              used_functions = "",
              points_earned = 0L,
              points_possible = 1L,
              message = ""
            )
          )
        }

        observed <- get(object_name, envir = student_env, inherits = FALSE)
        expected <- reference[[object_name]]
        output_ok <- run_comparison(observed, expected, comparator)
        function_result <- check_function_usage(
          object_name,
          required_functions,
          forbidden_functions,
          assignment_calls
        )
        is_correct <- output_ok && function_result$function_check

        status <- case_when(
          is_correct ~ "correct",
          !output_ok && !function_result$function_check ~ "wrong_output_and_function",
          !output_ok ~ "wrong_output",
          TRUE ~ "wrong_function"
        )

        tibble(
          task = task,
          object_name = object_name,
          status = status,
          output_check = output_ok,
          function_check = function_result$function_check,
          used_functions = function_result$used_functions,
          points_earned = if_else(is_correct, 1L, 0L),
          points_possible = 1L,
          message = ""
        )
      }
    )
  }

  total_row <- tibble(
    task = "Total",
    object_name = "TOTAL",
    status = "",
    output_check = NA,
    function_check = NA,
    used_functions = "",
    points_earned = sum(grade_table$points_earned),
    points_possible = sum(grade_table$points_possible),
    message = ""
  )

  grade_report <- bind_rows(grade_table, total_row) |>
    mutate(
      submission_file = basename(submission_path),
      submission_path = submission_path,
      .before = 1
    )

  submission_stub <- tools::file_path_sans_ext(basename(submission_path))
  report_path <- file.path(output_dir, paste0(submission_stub, "_grade_report.csv"))
  readr::write_csv(grade_report, report_path)

  list(
    submission_path = submission_path,
    report_path = report_path,
    grade_report = grade_report
  )
}


resolved_inputs <- resolve_submission_paths(input_args, default_submission, script_dir)
submission_paths <- resolved_inputs$submission_paths
output_dir <- resolved_inputs$output_dir

if (length(submission_paths) == 0) {
  stop("No submission .R files found to grade.")
}

grading_results <- map(
  submission_paths,
  ~ grade_submission(.x, reference, object_specs, output_dir)
)

all_grade_reports <- map_dfr(grading_results, "grade_report")
all_grade_report_path <- file.path(output_dir, "all_submissions_grade_report.csv")
readr::write_csv(all_grade_reports, all_grade_report_path)

all_submissions_summary <- all_grade_reports |>
  filter(object_name == "TOTAL") |>
  transmute(
    submission_file,
    submission_path,
    points_earned,
    points_possible
  )
all_submissions_summary_path <- file.path(output_dir, "all_submissions_summary.csv")
readr::write_csv(all_submissions_summary, all_submissions_summary_path)

all_submissions_wide_summary <- all_grade_reports |>
  filter(object_name != "TOTAL") |>
  select(submission_file, object_name, points_earned) |>
  tidyr::pivot_wider(
    names_from = object_name,
    values_from = points_earned,
    values_fill = 0L
  ) |>
  left_join(
    all_grade_reports |>
      filter(object_name == "TOTAL") |>
      transmute(
        submission_file,
        total_points = points_earned
      ),
    by = "submission_file"
  ) |>
  rename(submission_name = submission_file)

all_submissions_wide_summary_path <- file.path(output_dir, "all_submissions_wide_summary.csv")
readr::write_csv(all_submissions_wide_summary, all_submissions_wide_summary_path)

for (result in grading_results) {
  cat("Grading file:", result$submission_path, "\n")
  cat("Grade report:", result$report_path, "\n\n")
  print(result$grade_report, n = nrow(result$grade_report))
  cat("\n")
}

cat("Combined report:", all_grade_report_path, "\n")
cat("Summary report:", all_submissions_summary_path, "\n")
cat("Wide summary report:", all_submissions_wide_summary_path, "\n")
