#'
#' You should create one R script called run_analysis.R that does the
#' following. 
#' 
#' 1-Merges the training and the test sets to create one data set.
#' 2-Extracts only the measurements on the mean and standard deviation for each measurement. 
#' 3-Uses descriptive activity names to name the activities in the data set
#' 4-Appropriately labels the data set with descriptive variable names. 
#' 5-Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#'
#' 
#' Here is the data set for the project: 
#'
#' https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

#' make sure everything is set up correctly and is clean


if (!require("reshape2")) {
  install.packages("reshape2")
}
library(reshape2)

# Clean up workspace
rm(list=ls())

####### helper function to download and unzip data file if needed
downloadAndUnzipFile <- function(zipUrl, destDir) {
  if (!file.exists(destDir)) {    
    temp <- tempfile()
    download.file(url = zipUrl, destfile = temp)
    unzip(temp)
    unlink(temp)
  }
}


#' Download the the data file and unzip it if needed
#'
########################################################################
#'                            PLEASE NOTE
#' If in the work directory there is a directory named "UCI HAR Dataset"
#' it is assumed that the dataset was previously downloaded and extracted
#' there. If it is not found, data will be downloaded unziped.
#' 
#########################################################################

url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dir <- "./UCI HAR Dataset"

downloadAndUnzipFile(url, dir)

#load the test dataset
subject_test <- read.table(paste(dir, "/test/subject_test.txt", sep = ""))
X_test <- read.table(paste(dir, "/test/X_test.txt", sep=""))
y_test <- read.table(paste(dir, "/test/y_test.txt", sep =""))


#load the feature names
features <- read.table(paste(dir, "/features.txt", sep = ""))$V2

#load the training dataset
subject_train <- read.table(paste(dir, "/train/subject_train.txt", sep = ""))
X_train <- read.table(paste(dir, "/train/X_train.txt", sep = ""))
y_train <- read.table(paste(dir, "/train/y_train.txt", sep = ""))

#'
#' 1-Merges the training and the test sets to create one data set.
#'
subject_all <- rbind(subject_test, subject_train)

#load the activity names
activity_labels <- read.table(paste(dir, "/activity_labels.txt", sep = ""))$V2

#' 4-Appropriately labels the data set with descriptive variable names. 
names(X_test) <- features
names(X_train) <- features

#' 2-Extracts only the measurements on the mean and standard deviation for each measurement. 
mean_and_std <- grepl("mean\\(\\)|std\\(\\)", features)
X_test_mean_and_std <- X_test[,mean_and_std]
X_train_mean_and_std <- X_train[,mean_and_std]

#merge all test and train rows
X_all <- rbind(X_test_mean_and_std, X_train_mean_and_std)
y_all <- rbind(y_test, y_train)

#combine all vectors/data.frames into one data.frame
merged <- cbind(subject_all, y_all, X_all)

#' Uses descriptive activity names to name the activities in the data set
names(merged)[1:2] <- c("SubjectID", "Activity")

#' Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_data <- aggregate(. ~ SubjectID + Activity, data=merged, FUN = mean)

#give activities better names
tidy_data$Activity <- factor(tidy_data$Activity, labels=activity_labels)

write.table(tidy_data, file="./tidy_data.txt", sep="\t", row.names=FALSE)

#### That is all folks!
