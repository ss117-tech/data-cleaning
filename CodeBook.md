1. Data Set Information:


The raw dataset included the following files:
•	‘README.txt’
•	‘features_info.txt’- Shows information about the variables used for features.
•	‘features.txt’- List of all features.
•	‘activity_labels.txt’- Links the class labels with their activity name.
•	‘train/X_train.txt’- Training set.
•	‘train/y_train.txt’- Training labels.
•	‘test/X_test.txt’- Test set.
•	‘test/y_test.txt’- Test labels.

2. Variables 

Each row contains, for a given subject and activity, 79 averaged signal measurements.
Identifiers 

•	subject
Subject identifier, integer, ranges from 1 to 30.

•	activity
Activity identifier, string with 6 possible values:
o	WALKING
o	WALKING_UPSTAIRS
o	WALKING_DOWNSTAIRS
o	SITTING
o	STANDING
o	LAYING

•	Mean and standard deviation for the following features
o	TimeDomBodyAcc
o	TimeDomGravityAcc
o	TimeDomBodyAccJerk
o	TimeDomBodyGyro
o	TimeDomBodyGyroJerk
o	TimeDomBodyAcc
o	TimeDomGravityAcc
o	TimeDomBodyAccJerk
o	TimeDomBodyGyroMag
o	TimeDomBodyGyroJerk
o	FreqDomBodyAcc
o	FreqDomBodyAccJerk
o	FreqDomBodyGyro
o	FreqDomBodyAcc
o	FreqDomBodyAccJerk
o	FreqDomBodyGyro
o	FreqDomBodyGyroJerk


3. Transformations

•	Download the provided source data and upzip the file.
•	Read and merge the test and train data into one data frame.
•	Relabel the data frame and extract required measurements.
•	Clean the data set and export.
