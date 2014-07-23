#Cookbook
## Overview
The purpose of this project is to demonstrate how to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

This script looks in the current directory for a directory called "UCI HAR Dataset". If there is no such directory, it download the dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzips into "UCI HAR Dataset" directory. If the directory exists, it is assumed that that data was previously downlaoded and extracted there.

###Important: if there is an unrelated directory in the working directory named "UCI HAR Dataset", it is important to change the working directory or move the "UCI HAR Dataset" directory somewhere else, otherwise this script will most likely not work correctly.

There are two sets of data, test and training (train). They are loaded separately. The subject, X, and y files are loaded for both data sets and the headers for the X values are extracted from the features.txt file and applied.

Then the means and standard deviations of the set of observations are extracted. Next, test and training data sets are merged into one unitfied set. Header names are added as SubjectID and Activity for the subject and y values respectively.

All columns of the data frame grouped by SubjectID and Activity are aggregated into the tidy_data, which is also written out the file tidy_data.txt in the working directory.

