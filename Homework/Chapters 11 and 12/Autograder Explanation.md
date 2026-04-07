# How the Autograder Works

This document explains what the autograder is checking in the Chapters 11 and 12 homework.

## What the autograder does

The autograder:

1. Sources the student's `Homework.R` file.
2. Builds its own internal reference solution.
3. Checks each required object one at a time.
4. Gives `1` point for each correct object.
5. Creates a grading table with:
   - `task`
   - `object_name`
   - `status`
   - `points_earned`
   - `points_possible`
   - `point_loss_reason`
6. Adds a final total row.
7. Saves the results as CSV reports.
8. Creates batch summary files when you grade multiple submissions or a folder.

## Batch reports

When the autograder grades a folder, it now creates three overall reports:

1. `all_submissions_grade_report.csv`
   - one row per graded object per submission
2. `all_submissions_summary.csv`
   - one row per submission with total points earned and total points possible
3. `all_submissions_wide_summary.csv`
   - one row per submission
   - one column for each graded answer
   - each answer column contains `1` or `0`
   - a final `total_points` column

In the wide summary report, the first column is `submission_name`.

## What counts as a correct answer

The autograder now checks two things for each required object:

1. The final result stored in the object
2. The function(s) used to create that object

Examples:

1. For a character object such as `book_title_clean`, it checks whether the final value matches the reference solution.
2. For a data frame such as `reviews_clean`, it checks the final columns, column names, row counts, and values.
3. For plots such as `sentiment_plot`, it checks the plot type, built plotting data, and key labels against the reference plot.
4. For `current_time`, it checks that the result is a `POSIXct` value in the expected time zone and close to the current time.

## Important: the autograder checks code and output

The autograder does **not** rely only on the final answer anymore.

For the chapter skill objects, it parses the student's assignment code and checks whether the required function names appear in the assignment used to create that object.

Examples:

1. `book_title_clean` must use `trimws()`
2. `title_character_count` must use `nchar()`
3. `title_prefix` must use `substr()`
4. `sample_review_length` must use `str_length()`
5. `current_date` must use `today()`
6. `current_time` must use `now()`
7. `reviews_time` must use the required `lubridate` date functions
8. `reviews_clean` must use `case_when()` and `year()`

For some objects, the autograder also rejects common substitutes.

Examples:

1. `book_title_clean` rejects `str_trim()`
2. `title_character_count` rejects `str_length()`
3. `title_prefix` rejects `str_sub()`
4. `title_label` rejects `str_c()`
5. `title_upper` rejects `str_to_upper()`
6. `sample_review_first_word` rejects `word()`
7. `current_date` rejects `Sys.Date()`
8. `current_time` rejects `Sys.time()`

## What this means for `trimws()`

If the assignment says to use `trimws()`, then the autograder now checks for that.

So:

1. If a student uses `trimws()` and gets the correct result, that object can earn the point.
2. If a student uses `str_trim()` instead, even if the output matches, the object will be marked wrong for function usage.

## How the status column works

Each row in the grading report includes:

1. `output_check`
2. `function_check`
3. `status`
4. `point_loss_reason`

If a student loses the point on a row, `point_loss_reason` explains why.

Examples:

1. `Final output did not match the expected result.`
2. `Missing required function(s): case_when.`
3. `Used forbidden substitute function(s): word.`
4. A combined message if both the output and function usage were wrong.

Possible status values include:

1. `correct`
2. `wrong_output`
3. `wrong_function`
4. `wrong_output_and_function`
5. `missing`

The student earns the point only when both the output check and function check pass.

## Important limitation

The autograder checks the function names used in the top-level assignment for each required object.

This means the safest approach for students is:

1. Build each required object directly in its named assignment
2. Use the required functions in that assignment

If a student hides the required work in a separate helper object and then assigns the final object from that helper, the function check may fail even if the final answer is correct.

## Current conclusion

The autograder now checks both:

1. final output
2. required function usage

So yes, it now enforces the instructional goal of confirming that students used the intended functions.
