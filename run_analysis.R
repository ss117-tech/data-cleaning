library(dplyr)

# download zip file and unzip it
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "UCI HAR Dataset.zip", mode = "wb")
unzip("UCI HAR Dataset.zip")

# read training data
subjectTrain <- read.table(file.path("UCI HAR Dataset", "train", "subject_train.txt"))
Xtrain <- read.table(file.path("UCI HAR Dataset", "train", "X_train.txt"))
Ytrain <- read.table(file.path("UCI HAR Dataset", "train", "y_train.txt"))

# read test data
subjectTest <- read.table(file.path("UCI HAR Dataset", "test", "subject_test.txt"))
Xtest <- read.table(file.path("UCI HAR Dataset", "test", "X_test.txt"))
Ytest <- read.table(file.path("UCI HAR Dataset", "test", "y_test.txt"))

# read features and activity labels
features <- read.table(file.path("UCI HAR Dataset", "features.txt"), as.is = TRUE)
activityLabels <- read.table(file.path("UCI HAR Dataset", "activity_labels.txt"))
colnames(activityLabels) <- c("actId", "actLabel")

# concatenate data tables to make single data table and rename
activity <- rbind( cbind(subjectTrain, Xtrain, Ytrain),cbind(subjectTest, Xtest, Ytest))
colnames(activity) <- c("subject", features[, 2], "activity")

# keep data only for certain columns and replace activity values with named factor levels
activity <- activity[, grepl("subject|activity|mean|std", colnames(activity))]
activity$activity <- factor(activity$activity, levels = activityLabels[, 1], labels = activityLabels[, 2])

# get column names, remove special characters and clean up and assign them back
activityColumns <- colnames(activity)
activityColumns <- gsub("[\\(\\)-]", "", activityColumns)
activityColumns <- gsub("^f", "FreqDom", activityColumns)
activityColumns <- gsub("^t", "TimeDom", activityColumns)
activityColumns <- gsub("BodyBody", "Body", activityColumns)
colnames(activity) <- activityColumns

# group by subject and activity and summarise using mean
actMeans <- activity %>% group_by(subject, activity) %>% summarise_each(funs(mean))

# output to file "clean_data.txt"
write.table(actMeans, "clean_data.txt", row.names = FALSE, quote = FALSE)
