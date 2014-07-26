#Cookbook
## Overview
The purpose of this project is to demonstrate how to collect, work with, and clean a data set. We will prepare tidy data that can be used for later analysis.

This script looks in the current directory for a directory called "UCI HAR Dataset". If there is no such directory, it download the dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzips into "UCI HAR Dataset" directory. If the directory exists, it is assumed that that data was previously downlaoded and extracted there.

###Important: if there is an unrelated directory in the current working directory named "UCI HAR Dataset", it is important to either change the working directory or move the "UCI HAR Dataset" directory somewhere else, otherwise this script might not work correctly.


Getting and Cleaning Data (Coursera). Course Project Codebook
==============================================================


## Original problem statement

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The goal is to create one R script called run_analysis.R that does the following. 
1-Merges the training and the test sets to create one data set.
2-Extracts only the measurements on the mean and standard deviation for each measurement. 
3-Uses descriptive activity names to name the activities in the data set
4-Appropriately labels the data set with descriptive variable names. 
5-Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


### Script

There are two sets of data, test and training (train). They are loaded separately. The subject, X, and y files are loaded for both sets of data. Also, the headers for the X values are extracted from the features.txt file and applied.

The  means and standard deviations of the observations are extracted. Next, test and training data sets are merged into one unitfied set. Header names are added as SubjectID and Activity for the subject and y values respectively.

All columns of the data frame grouped by SubjectID and Activity are aggregated into the tidy_data, which is then written out to the file tidy_data.txt in the current working directory.

### Tidy_data.text file headers

| Variable | Details
| -------- |---------
| SubjectID | The ID of the test subject
| Activity | The specific activity
| tBodyAcc-mean()-X | Mean time for acceleration of body for X direction.
| tBodyAcc-mean()-Y | Mean time for acceleration of body for Y direction.
| tBodyAcc-mean()-Z | Mean time for acceleration of body for Z direction.
| tBodyAcc-std()-X | Standard deviation of time for acceleration of body for X direction.
| tBodyAcc-std()-Y | Standard deviation of time for acceleration of body for Y direction.
| tBodyAcc-std()-Z | Standard deviation of time for acceleration of body for Z direction.
| tGravityAcc-mean()-X | Mean time of acceleration of gravity for X direction.
| tGravityAcc-mean()-Y | Mean time of acceleration of gravity for Y direction.
| tGravityAcc-mean()-Z | Mean time of acceleration of gravity for Z direction.
| tGravityAcc-std()-X | Standard deviation of time of acceleration of gravity for X direction.
| tGravityAcc-std()-Y | Standard deviation of time of acceleration of gravity for Y direction.
| tGravityAcc-std()-Z | Standard deviation of time of acceleration of gravity for Z direction.
| tBodyAccJerk-mean()-X | Mean time of body acceleration jerk for X direction. 
| tBodyAccJerk-mean()-Y | Mean time of body acceleration jerk for Y direction
| tBodyAccJerk-mean()-Z | Mean time of body acceleration jerk for Z direction
| tBodyAccJerk-std()-X | Standard deviation of time of body acceleration jerk for X direction. 
| tBodyAccJerk-std()-Y | Standard deviation of time of body acceleration jerk for Y direction. 
| tBodyAccJerk-std()-Z | Standard deviation of time of body acceleration jerk for Z direction. 
| tBodyGyro-mean()-X | Mean body gyroscope measurement for X direction.
| tBodyGyro-mean()-Y | Mean body gyroscope measurement for Y direction.
| tBodyGyro-mean()-Z | Mean body gyroscope measurement for Z direction.
| tBodyGyro-std()-X | Standard deviation of body gyroscope measurement for X direction.
| tBodyGyro-std()-Y | Standard deviation of body gyroscope measurement for Y direction.
| tBodyGyro-std()-Z | Standard deviation of body gyroscope measurement for Z direction.
| tBodyGyroJerk-mean()-X | Mean jerk signal of body for X direction.
| tBodyGyroJerk-mean()-Y | Mean jerk signal of body for Y direction.
| tBodyGyroJerk-mean()-Z | Mean jerk signal of body for Z direction.
| tBodyGyroJerk-std()-X | Standard deviation of jerk signal of body for X direction.
| tBodyGyroJerk-std()-Y | Standard deviation of jerk signal of body for Y direction.
| tBodyGyroJerk-std()-Z | Standard deviation of jerk signal of body for Z direction.
| tBodyAccMag-mean() | Mean magnitude of body acceleration.
| tBodyAccMag-std() | Standard deviation of magnitude of body acceleration.
| tGravityAccnMag-mean() | Mean gravity acceleration magnitude.
| tGravityAccMag-std() | Standard deviation of gravity acceleration magnitude.
| tBodyAccJerkMag-mean() | Mean magnitude of body acceleration jerk.
| tBodyAccJerkMag-std() | Standard deviation of magnitude of body acceleration jerk.
| tBodyGyroMag-mean() | Mean magnitude of body gyroscope measurement.
| tBodyGyroMag-std() | Standard deviation of magnitude of body gyroscope measurement.
| tBodyGyroJerkMagn-mean() | Mean magnitude of body body gyroscope jerk measurement.
| tBodyGyroJerkMag-std() | Standard deviation of magnitude of body body gyroscope jerk measurement.
| fBodyAcc-mean.X() | Mean frequency of body acceleration for X direction. 
| fBodyAcc-mean.Y() | Mean frequency of body acceleration for Y direction. 
| fBodyAcc.mean.Z() | Mean frequency of body acceleration for Z direction. 
| fBodyAcc.std.X() | Standard deviation of frequency of body acceleration for X direction. 
| fBodyAcc.std.Y() | Standard deviation of frequency of body acceleration for Y direction. 
| fBodyAcc.std.Z() | Standard deviation of frequency of body acceleration for Z direction. 
| fBodyAccJerk-mean-X() | Mean frequency of body accerlation jerk for X direction.
| fBodyAccJerk-mean-Y() | Mean frequency of body accerlation jerk for Y direction.
| fBodyAccJerk-mean-Z() | Mean frequency of body accerlation jerk for Z direction.
| fBodyAccJerk-std-X() | Standard deviation frequency of body accerlation jerk for X direction.
| fBodyAccJerk-std-Y() | Standard deviation frequency of body accerlation jerk for Y direction.
| fBodyAccJerk-std-Z() | Standard deviation frequency of body accerlation jerk for Z direction.
| fBodyGyro-mean-X() | Mean frequency of body gyroscope measurement for X direction.
| fBodyGyro-mean-Y() | Mean frequency of body gyroscope measurement for Y direction.
| fBodyGyro-mean-Z() | Mean frequency of body gyroscope measurement for Z direction.
| fBodyGyro-std-X() | Standard deviation frequency of body gyroscope measurement for X direction.
| fBodyGyro-std-Y() | Standard deviation frequency of body gyroscope measurement for Y direction.
| fBodyGyro-std-Z() | Standard deviation frequency of body gyroscope measurement for Z direction.
| fBodyAccMag-mean | Mean frequency of body acceleration magnitude.
| fBodyAccMag-std | Standard deviation of frequency of body acceleration magnitude.
| fBodyBodyAccJerkMag-mean | Mean frequency of body acceleration jerk magnitude.
| fBodyBodyAccJerkMag-std | Standard deviation of frequency of body acceleration jerk magnitude.
| fBodyBodyGyroMag-mean | Mean frequency of magnitude of body gyroscope measurement.
| fBodyBodyGyroMag-std | Standard deviation of frequency of magnitude of body gyroscope measurement.
| fBodyBodyGyroJerkMag-mean | Mean frequency of magnitude of body gyroscope jerk measurement.
| fBodyBodyGyroJerkMag-std | Standard deviation of frequency of magnitude of body gyroscope jerk measurement.
 
 