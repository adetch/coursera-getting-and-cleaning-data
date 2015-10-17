# Getting and Cleaning Data Course Project

## Overview

This repo contains code to complete the course project for class 3 in Coursera's Data Science specialization: Getting and Cleaning Data.

## Code

There is one relevant file, `run_analysis.R` that runs several analyses (detailed in `CodeBook.md`) and outputs tidy data file `tidy.txt`

## Assumptions

This code makes no assumptions! (beyond that a somewhat recent version of `dplyr` is installed)

The dataset is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, unzipped to `UCI HAR Dataset` and processed as described in the `code` section above.

# Steps

############################################################################################
## 1. Merges the training and the test sets to create one data set.
############################################################################################

Merges train and test data, including:
    * Variabes
    * Subject number
    * Activity index

Adds variable names to columns using `map` function.

############################################################################################
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
############################################################################################

Renames the variables of interest mean() and std() to recognizale values using `gsub`.

Uses `make.names` to rename column names so they're syntactically valid.

Filters out all but subject, activity, mean and standard deviation columns using `dplyr`.

############################################################################################
## 3. Uses descriptive activity names to name the activities in the data set.
############################################################################################

Reads in activty mapping information.

Uses `sapply` and `map` function defined above to rename activities.

############################################################################################
## 4. Appropriately labels the data set with descriptive variable names. 
############################################################################################

Uses a series of `gsub` operations to expand abbreviated variable names.

############################################################################################
## 5. From the data set in step 4, creates a second, independent tidy data set with the 
#     average of each variable for each activity and each subject.
############################################################################################

Users `dplyr`'s pipe, `group_by` and `summarize_each` functions to provide mean of each 
variable.

Writes frame to `tidy.txt`