# Reusable Prompt for Future Homework Creation

Use the prompt below when you want to create a new homework assignment and matching autograder for different chapters. This version is dynamic, so it works whether a starter homework file already exists or whether the AI should create everything from scratch.

## Dynamic Prompt

```md
In the `[FOLDER PATH]` folder, I want a homework assignment based on `[CHAPTER NAME OR NUMBERS]`. You can find the learning objectives in the same folder.

If a starter file named `[HOMEWORK FILE NAME]` already exists, build on top of it.
If it does not exist, create it from scratch.

Create a homework assignment that captures the learning objectives.

Requirements:

1. Keep the assignment in a single student-facing R script named `[HOMEWORK FILE NAME]`.
2. Add clear task instructions and predeclare every required object name with `NULL` so all students use the same variable names.
3. If a starter homework file already contains useful code, preserve and extend it rather than replacing it unnecessarily.
4. Use the dataset specified in the homework folder. If the dataset should be loaded from GitHub, keep that behavior.
5. Use the same dataset across all tasks unless I explicitly ask for multiple datasets.
6. Make sure the tasks align directly with the chapter learning objectives.
7. If I specify that some tasks must use base R, `stringr`, `lubridate`, or another package, enforce that in both the homework instructions and the autograder.
8. Create an autograder script named `[GRADER FILE NAME]`.
9. The autograder should:
   - grade each required object separately
   - give 1 point per correct object
   - check both final output and required function usage
   - reject forbidden substitute functions when the assignment is assessing a specific function
   - verify plots are accurate, not just that a `ggplot` object exists
   - check plot type/layer structure, built plotting data, and key labels
   - create an individual CSV report for each submission
   - support grading a folder of submissions
   - create combined CSV reports for all submissions
   - create a wide summary CSV with:
     - `submission_name`
     - one column per graded answer containing `1` or `0`
     - `total_points`
10. Create a student instructions markdown file that explains how to complete and submit the homework.
11. Include in the student instructions an optional self-check command showing how to run the autograder on the student's file.
12. Create an autograder explanation markdown file that explains exactly what the grader checks.
13. Create at least two mock submissions:
    - one intentionally imperfect submission with some mistakes
    - one fully correct submission
14. Test the autograder on a single file and on a folder of submissions, and confirm the results.

Additional constraints:

1. Task 1 should use `[BASE R / PACKAGE / WHATEVER I SPECIFY]`.
2. All remaining tasks should use `[PACKAGE OR RULE I SPECIFY]`.
3. Do not rely on output-only grading if the assignment is meant to assess specific functions.
4. Keep the object names stable because the autograder depends on them.
5. If I ask to remove or simplify a task later, update the homework, mock submissions, grader logic, and markdown documentation so they all stay consistent.

After making or updating the files, summarize:

1. which files you created or updated
2. how the autograder works
3. how to run the autograder on a single file
4. how to run the autograder on a folder of submissions
5. which reports are generated, including the wide summary report
```

## Suggested placeholders

Replace these placeholders before using the prompt:

1. `[FOLDER PATH]`
2. `[HOMEWORK FILE NAME]`
3. `[CHAPTER NAME OR NUMBERS]`
4. `[GRADER FILE NAME]`
5. `[BASE R / PACKAGE / WHATEVER I SPECIFY]`
6. `[PACKAGE OR RULE I SPECIFY]`

## Example Adaptation

```md
In the `Homework/Chapter 8` folder, I want a homework assignment based on Chapter 8. You can find the learning objectives in the same folder.

If a starter file named `Homework.R` already exists, build on top of it.
If it does not exist, create it from scratch.

Create a homework assignment that captures the learning objectives.

Requirements:

1. Keep the assignment in a single student-facing R script named `Homework.R`.
2. Add clear task instructions and predeclare every required object name with `NULL` so all students use the same variable names.
3. If a starter homework file already contains useful code, preserve and extend it rather than replacing it unnecessarily.
4. Use the dataset specified in the homework folder. If the dataset should be loaded from GitHub, keep that behavior.
5. Use the same dataset across all tasks unless I explicitly ask for multiple datasets.
6. Make sure the tasks align directly with the chapter learning objectives.
7. Task 1 should use base R.
8. All remaining tasks should use `dplyr` and `ggplot2`, not base R.
9. Create an autograder script named `grade_homework.R`.
10. The autograder should:
   - grade each required object separately
   - give 1 point per correct object
   - check both final output and required function usage
   - verify plots are accurate and reject the wrong plot type
   - create an individual CSV report for each submission
   - support grading a folder of submissions
   - create combined CSV reports for all submissions
   - create a wide summary CSV with `submission_name`, one 0/1 column per graded answer, and `total_points`
11. Create a student instructions markdown file that explains how to complete and submit the homework.
12. Include an optional self-check command in the student instructions.
13. Create an autograder explanation markdown file that explains exactly what the grader checks.
14. Create at least two mock submissions:
    - one intentionally imperfect submission with mistakes
    - one fully correct submission
15. Test the autograder on a single file and on a folder, and confirm that it works.
```
