# getting_cleaning_data
Project for the "Getting And Cleaning Data" course in Coursera

This repo ha a main function:
run_analysis.R
This file assumes there is a directory "data_set" that has data accoding to the course guidlines
This file contains three functions:

1- run_analysis: This function calls the "merge_data" function and applies a summary operation on the merged data for each acitivty and each subject.

2- merge_data: This function reads teh "data_set" files and merge the "train" and "test" data sets. After merging, the function extracts the variables that have "mean" and "std" in the variable names. It also adds the subject and activity id as separate columns to the data.
It also makes the subject and acitivty columns factors.

3- collateral_exists: This function goes through a list of files and will only return true if all files exist. Other wise it returns false.

In order to regenerate the data, you need to:
1- clone the repo
2- cd to local copy of repo
3- run R command:
      data<- run_analysis()
4- If you want to write the output data to a file, run:
      write.table(data, "summary_data.txt", row.names = FALSE)
      where "summary_data.txt" is the name of the file that stores the data
      
      

