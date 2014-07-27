#### Peer Assessments / Getting and Cleaning Data Course Project
- **Demonstrate the process to collect, work with, and clean a data set.**
- **The goal is to prepare tidy data that can be used for later analysis.**

1. related files:
 - 'ReadMe.md' : This file.
 - 'CodeBook.md' : The data dictionary of the tidy data set.
 - 'run_analysis.R' : The R script to generate the tidy data set.
 - 'tidy.txt' : The file that the tidy data set would be written to.
 - 'UCI HAR Dataset' : The folder with all the files of source data.

2. source data:
 - Human Activity Recognition Using Smartphones Dataset.
 - compressed file 'getdata-projectfiles-UCI HAR Dataset.zip'
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

3. prerequisite to run the R script
 - put run_analysis.R in the working directory of R
 - download the source data compressed file and extract to the working directory of R

4. instructions to run the R script

 4-1. load the R script

  - **source("run_analysis.R")**

 4-2. run the main function -- run_analysis()

  - **tidy <- run_analysis()**

 4-3. check the result

  - **dim(tidy)**                                   #output: [1] 180  68
  - **list.files(path=".", pattern="tidy.txt")**    #output: [1] "tidy.txt"
  - **tidy2 <- read.table("tidy.txt", header=TRUE)**
  - **dim(tidy2)**                                  #output: [1] 181  68
  - **identical(colnames(tidy), colnames(tidy2))**  #output: [1] TRUE

