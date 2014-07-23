#Cookbook
## Overview
The purpose of this project is to demonstrate how to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

This script looks in the current directory for a directory called "UCI HAR Dataset". If there is no such directory, it download the dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzips into "UCI HAR Dataset" directory. If the directory exists, it is assumed that that data was previously downlaoded and extracted there.

###Important: if there is an unrelated directory with in the working directory named "UCI HAR Dataset", it is important to change the working directory or move the "UCI HAR Dataset" directory somewhere else, otherwise this script will not work correctly.

