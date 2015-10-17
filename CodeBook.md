# Variables

## Identification

`subject`            The subject (1-30) who's data the row describes.

`activity`           The activity being performed by the subject.

## Measurements

Means of each indicated variable across multiple tests by subject and activity

`TimeBodyAccelerationMEAN.X`
`TimeBodyAccelerationMEAN.Y`
`TimeBodyAccelerationMEAN.Z`
`TimeBodyAccelerationSTD.X`
`TimeBodyAccelerationSTD.Y`
`TimeBodyAccelerationSTD.Z`
`TimeGravityAccelerationMEAN.X`
`TimeGravityAccelerationMEAN.Y`
`TimeGravityAccelerationMEAN.Z`
`TimeGravityAccelerationSTD.X`
`TimeGravityAccelerationSTD.Y`
`TimeGravityAccelerationSTD.Z`
`TimeBodyAccelerationJerkMEAN.X`
`TimeBodyAccelerationJerkMEAN.Y`
`TimeBodyAccelerationJerkMEAN.Z`
`TimeBodyAccelerationJerkSTD.X`
`TimeBodyAccelerationJerkSTD.Y`
`TimeBodyAccelerationJerkSTD.Z`
`TimeBodyGyroMEAN.X` 
`TimeBodyGyroMEAN.Y` 
`TimeBodyGyroMEAN.Z` 
`TimeBodyGyroSTD.X`
`TimeBodyGyroSTD.Y`
`TimeBodyGyroSTD.Z`
`TimeBodyGyroJerkMEAN.X` 
`TimeBodyGyroJerkMEAN.Y` 
`TimeBodyGyroJerkMEAN.Z` 
`TimeBodyGyroJerkSTD.X`
`TimeBodyGyroJerkSTD.Y`
`TimeBodyGyroJerkSTD.Z`
`TimeBodyAccelerationMagnitudeMEAN`
`TimeBodyAccelerationMagnitudeSTD`
`TimeGravityAccelerationMagnitudeMEAN`
`TimeGravityAccelerationMagnitudeSTD` 
`TimeBodyAccelerationJerkMagnitudeMEAN`
`TimeBodyAccelerationJerkMagnitudeSTD`
`TimeBodyGyroMagnitudeMEAN`
`TimeBodyGyroMagnitudeSTD`
`TimeBodyGyroJerkMagnitudeMEAN`
`TimeBodyGyroJerkMagnitudeSTD`
`FourierBodyAccelerationMEAN.X`
`FourierBodyAccelerationMEAN.Y`
`FourierBodyAccelerationMEAN.Z`
`FourierBodyAccelerationSTD.X`
`FourierBodyAccelerationSTD.Y`
`FourierBodyAccelerationSTD.Z`
`FourierBodyAccelerationJerkMEAN.X`
`FourierBodyAccelerationJerkMEAN.Y`
`FourierBodyAccelerationJerkMEAN.Z`
`FourierBodyAccelerationJerkSTD.X`
`FourierBodyAccelerationJerkSTD.Y`
`FourierBodyAccelerationJerkSTD.Z`
`FourierBodyGyroMEAN.X`
`FourierBodyGyroMEAN.Y`
`FourierBodyGyroMEAN.Z`
`FourierBodyGyroSTD.X`
`FourierBodyGyroSTD.Y`
`FourierBodyGyroSTD.Z`
`FourierBodyAccelerationMagnitudeMEAN`
`FourierBodyAccelerationMagnitudeSTD` 
`FourierBodyBodyAccelerationJerkMagnitudeMEAN`
`FourierBodyBodyAccelerationJerkMagnitudeSTD` 
`FourierBodyBodyGyroMagnitudeMEAN`
`FourierBodyBodyGyroMagnitudeSTD` 
`FourierBodyBodyGyroJerkMagnitudeMEAN`
`FourierBodyBodyGyroJerkMagnitudeSTD`

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