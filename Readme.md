# Getting and Cleaning Data Assignment


## Course Project Goals

The aim of the project is to clean and extract useable data using R script, `run_analysis.R`. The script showcases following capabilites:

- Merges the training and the test sets to create one data set
- Extracts only the measurements on the mean and standard deviation for each measurement 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

## Repository contents:

- *run_analysis.R* : the R script used to clean and extract useable data on the Source data set

- *TidyData.txt* : the cleaned Tidy data extracted from the original source dataset using *run_analysis.R*

- *CodeBook.md* : the CodeBook reference to the variables used in *run_analysis.R* and *TidyData.txt*

- *README.md* : Assignment Artifacts overview and usage details of the script to be executed

## Execution Pre-requisites:

- Before execution of the script *run_analysis.R*, the Source data set zip file (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) needs to be downloaded and extracted. Once extraction is completed, ```UCI HAR Dataset``` folder will be created.
- As a next step, place the script ```run_analysis.R``` in the parent folder of ```UCI HAR Dataset``` and set this parent folder as the R working directory
- R script will load `data.table` package during  script execution. Ensure that this package is already installed, else it needs to be installed prior to script execution

## Execution Procedure and Output

After ensuring script *run_analysis.R* pre-requistes stated above are met, start the script execution. Once execution completes successfully, *TidyData.txt* output file containing the Tidy data set will be generated within the same parent folder of  ```UCI HAR Dataset``` folder. This output file can now be used for any further analysis.

