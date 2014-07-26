#Cookbook
## Overview
The purpose of this project is to demonstrate how to collect, work with, and clean a data set. We will prepare tidy data that can be used for later analysis.

This script looks in the current directory for a directory called "UCI HAR Dataset". If there is no such directory, it download the dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzips into "UCI HAR Dataset" directory. If the directory exists, it is assumed that that data was previously downlaoded and extracted there.

###Important: if there is an unrelated directory in the current working directory named "UCI HAR Dataset", it is important to either change the working directory or move the "UCI HAR Dataset" directory somewhere else, otherwise this script might not work correctly.

There are two sets of data, test and training (train). They are loaded separately. The subject, X, and y files are loaded for both sets of data. Also, the headers for the X values are extracted from the features.txt file and applied.

The  means and standard deviations of the observations are extracted. Next, test and training data sets are merged into one unitfied set. Header names are added as SubjectID and Activity for the subject and y values respectively.

All columns of the data frame grouped by SubjectID and Activity are aggregated into the tidy_data, which is then written out to the file tidy_data.txt in the current working directory.

