# DTA250 - 2024
# JJ

# In this file, make sure to change the path to the location of the data files on your computer.
# To get the path, select the file in the Files pan in RStudio, click on the gear icon, and select "Copy Folder Path To Clipboard".

# Load txt files

df <- read.table("C:/Users/jjasser/OneDrive - Rollins College/DTA250/2024/Spring2024/2024ClassCoding/Week 9/student_info.txt", 
                 sep=",", 
                 header = TRUE)

# Load txt files without headers
df2 <- read.table("C:/Users/jjasser/OneDrive - Rollins College/DTA250/2024/Spring2024/2024ClassCoding/Week 9/student_info_no_headers.txt", 
                  sep=",", 
                  col.names = c("ID", "Name", "Major"))

# Load csv files

df3 <- read.csv("Week 9/student_info.csv", header = TRUE)

# Or using the readr library
library(readr)
df3 <- read_csv("Week 9/student_info.csv")
View(df3)

# Load excel files

install.packages("readxl")
library(readxl)

df4 <- read_xlsx("Week 9/student_info.xlsx", sheet = "Sheet2")

# using readr library
df4 <- read_excel("Week 9/student_info.xlsx", sheet = "Sheet2")
