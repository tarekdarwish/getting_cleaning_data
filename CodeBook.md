This document describes the run_analysis function as well as the data it manipulates

Function:
=========
The name of this function is run_analysis.R
The function loads data from "train" set and "test" set. After extracting the std and mean variables from the merged set, it creates new data set that calculates the mean of each variable


Input data:
===========
The function reads the data from the following data set:
"Human Activity Recognition Using Smartphones Data Set"
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
This data set is copied and zipped from the course project webpage and is listed below:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

In order to make sure the data is reproducible, all data and corresponding file structure are copied into the repo under the name "dat_set"
The data set has lot of files explaining the data as well as the variables. It also has a nice explanation of how the experiment was conducted and how the variables are measured and calculated.


Output data:
============
The README.md file explains how the function works. The function creates and output data structure that provides the mean of the mean and std variables for each activity and each subject.
The function can be simply called as follows:

data <- run_analysis()
where data will be the table data frame that holds the summary.

This data can be written to a file as follows:
write.table(data, "summary_data.txt", row.names = FALSE)

Here is a description for the data collected by the run_analysis function:
each row corresponds to the mean calculation for all measurements done for a given subject and given activity.
We have 30 subjects and 6 activities, and thus the table has 30x6 = 180 entries.

The column variables are 

subject:
--------
Identifier with values ranging from 1 to 30. Each number represents one of the 30 persons (subjects) participated in this study

activity:
---------
Activities performed by the subjects. 6 possible activities were performed:
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

Measurement variables:
----------------------
The remaining variables are extracted from the data set. We only extracted the variables that has "mean" or "std" in the variable name.
For an explanation of what each variable is, please refer to the data set documentation files
But here is the names of the variables in the output data set:

tBodyAccmeanX 
tBodyAccmeanY
tBodyAccmeanZ

tBodyAccstdX
tBodyAccstdY
tBodyAccstdZ

tGravityAccmeanX
tGravityAccmeanY
tGravityAccmeanZ

tGravityAccstdX
tGravityAccstdY
tGravityAccstdZ

tBodyAccJerkmeanX
tBodyAccJerkmeanY
tBodyAccJerkmeanZ

tBodyAccJerkstdX
tBodyAccJerkstdY
tBodyAccJerkstdZ

tBodyGyromeanX
tBodyGyromeanY
tBodyGyromeanZ

tBodyGyrostdX
tBodyGyrostdY
tBodyGyrostdZ

tBodyGyroJerkmeanX
tBodyGyroJerkmeanY
tBodyGyroJerkmeanZ

tBodyGyroJerkstdX
tBodyGyroJerkstdY
tBodyGyroJerkstdZ

tBodyAccMagmean
tBodyAccMagstd

tGravityAccMagmean
tGravityAccMagstd

tBodyAccJerkMagmean
tBodyAccJerkMagstd

tBodyGyroMagmean
tBodyGyroMagstd

tBodyGyroJerkMagmean
tBodyGyroJerkMagstd


fBodyAccmeanX
fBodyAccmeanY
fBodyAccmeanZ

fBodyAccstdX
fBodyAccstdY
fBodyAccstdZ

fBodyAccmeanFreqX
fBodyAccmeanFreqY
fBodyAccmeanFreqZ

fBodyAccJerkmeanX
fBodyAccJerkmeanY
fBodyAccJerkmeanZ

fBodyAccJerkstdX
fBodyAccJerkstdY
fBodyAccJerkstdZ

fBodyAccJerkmeanFreqX
fBodyAccJerkmeanFreqY
fBodyAccJerkmeanFreqZ

fBodyGyromeanX
fBodyGyromeanY
fBodyGyromeanZ

fBodyGyrostdX
fBodyGyrostdY
fBodyGyrostdZ 

fBodyGyromeanFreqX 
fBodyGyromeanFreqY 
fBodyGyromeanFreqZ
 
fBodyAccMagmean 
fBodyAccMagstd 
fBodyAccMagmeanFreq 

fBodyBodyAccJerkMagmean 
fBodyBodyAccJerkMagstd 
fBodyBodyAccJerkMagmeanFreq 

fBodyBodyGyroMagmean 
fBodyBodyGyroMagstd 
fBodyBodyGyroMagmeanFreq 

fBodyBodyGyroJerkMagmean 
fBodyBodyGyroJerkMagstd 
fBodyBodyGyroJerkMagmeanFreq
