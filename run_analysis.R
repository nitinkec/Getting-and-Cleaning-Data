##Assumption : This Script assumes that the zip file (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
## has already been downloaded and extracted in the R Working Directory

## loading libraries
library(data.table)

#######################################################################
## Q1 - Merge the training and the test  datasets to create one data set

## Reading Train data
subTrn <- read.table("UCI HAR Dataset/train/subject_train.txt")
actTrn <- read.table("UCI HAR Dataset/train/y_train.txt")
ftTrn <- read.table("UCI HAR Dataset/train/X_train.txt")

## Reading Test data
subTst <- read.table("UCI HAR Dataset/test/subject_test.txt")
actTst <- read.table("UCI HAR Dataset/test/y_test.txt")
ftTst <- read.table("UCI HAR Dataset/test/X_test.txt")

## Merge training and test data in one dataset
subData <- rbind(subTrn, subTst)
actData <- rbind(actTrn, actTst)
ftData <- rbind(ftTrn, ftTst)

##Reading Supporting Metadata
ftNames <- read.table("UCI HAR Dataset/features.txt")[,2]

## Assigning Column Names
colnames(ftData) <- ftNames
colnames(actData) <- "Activity"
colnames(subData) <- "Subject"

## Complete (Full) Merged Data
fullData <- cbind(ftData,actData,subData)

#######################################################################
##Q2 - Extracts only the measurements on the mean and standard deviation for each measurement

meanSTD <- grep(".*Mean.*|.*Std.*", names(fullData), ignore.case=TRUE)

## Adding Activity and Subject columns
neededColumns <- c(meanSTD, 562, 563)

## Columns required for Data Analysis
analysisData <- fullData[,neededColumns]

#######################################################################
##Q3 - Uses descriptive activity names to name the activities in the data set

actLabels <- read.table("UCI HAR Dataset/activity_labels.txt")[,2]

analysisData$Activity <- as.character(analysisData$Activity)

for (j in 1:6){
analysisData$Activity[analysisData$Activity == j] <- as.character(actLabels[j])
}

#######################################################################
##Q4 - Appropriately labels the data set with descriptive variable names

#Character 'f' will be expanded to Frequency
#Character 't' will be expanded to Time
#Acc will be expanded to Accelerometer
#Gyro will be expanded to Gyroscope
#BodyBody will be extacted to Body
#Mag will be expanded to Magnitude
#angle, gravity will be updated to Angle, Gravity respectively
#-mean() can be replaced with Mean
#-std() can be replaced with STD
#-freq() can be replaced with Frequency

names(analysisData)<-gsub("Acc", "Accelerometer", names(analysisData))
names(analysisData)<-gsub("Gyro", "Gyroscope", names(analysisData))
names(analysisData)<-gsub("BodyBody", "Body", names(analysisData))
names(analysisData)<-gsub("Mag", "Magnitude", names(analysisData))
names(analysisData)<-gsub("^t", "Time", names(analysisData))
names(analysisData)<-gsub("^f", "Frequency", names(analysisData))
names(analysisData)<-gsub("tBody", "TimeBody", names(analysisData))
names(analysisData)<-gsub("-mean()", "Mean", names(analysisData), ignore.case = TRUE)
names(analysisData)<-gsub("-std()", "STD", names(analysisData), ignore.case = TRUE)
names(analysisData)<-gsub("-freq()", "Frequency", names(analysisData), ignore.case = TRUE)
names(analysisData)<-gsub("angle", "Angle", names(analysisData))
names(analysisData)<-gsub("gravity", "Gravity", names(analysisData))

# New variable names
names(analysisData)

#######################################################################
##Q5 - From the data set in step 4, creates a second, independent tidy data set
##with the average of each variable for each activity and each subject

# Creating Factors
analysisData$Activity <- as.factor(analysisData$Activity)
analysisData$Subject <- as.factor(analysisData$Subject)

analysisData <- data.table(analysisData)

# Creating Tidy Data containing average of each variable for each activity and each subject
tidyData <- aggregate(. ~Subject + Activity, analysisData, mean)

# Ordering tidyData
tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity),]

# Writing Tidy Data to the output file
write.table(tidyData, file = "TidyData.txt", row.names = FALSE)