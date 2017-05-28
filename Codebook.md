# CodeBook

This CodeBook describes the variables, transformations that were executed to clean up the data using *run_analysis.R* script and the output data variables in *TidyData.txt*

##DataSources

* Source DataSet: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

* DataSet Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Input Data Set

Following listed files are used as input from the source data set:

- `X_train.txt` contains Training data set features observations
- `y_train.txt` contains Training data set activities related to `X_train.txt`
- `subject_train.txt` contains Training data set Subjects information
- `X_test.txt` contains Test data set features observations
- `y_test.txt` contains Test data set activities related to `X_test.txt`
- `subject_test.txt` contains Test data set Subjects information
- `activity_labels.txt` describe various types of activities
- `features.txt` states the features names in the data sets

## Transformation Details

- `subTrn` is used for reading `subject_train.txt`
- `actTrn` is used for reading `y_train.txt`
- `ftTrn` is used for reading `X_train.txt`
- `subTst` is used for reading `subject_test.txt`
- `actTst` is used for reading `y_test.txt`
- `ftTst` is used for reading `X_test.txt`
- Subjects in Training and Test data sets are merged in `subData`
- Activities in Training and Test data sets are merged in `actData`
- Features of Training and Test data sets are merged in `ftData`
- `ftNames` is used for reading Features Names from `features.txt`
- Column names are assigned to `subData`, `actData`, `ftData` and finally merged to form full data set `fullData`
- Indices of columns containing Mean or Standard Deviations are extracted in `meanSTD`
- Mean or Standard Deviations columns indices along with Subject and Activity column indices are collated in `neededColumns` 
- Data requested for Analysis is prepared in `analysisData` by filtering on indices information in `neededColumns`
- `actLabels` is used for reading  descriptive activity names from `activity_labels.txt`
- `Activity` column in `analysisData` is updated with descriptive names from `actLabels`
- Acronyms such as 't', 'f', 'Acc', 'Gyro', 'Mag' in the variable names are replaced with descriptive labels viz. 'Time', 'Frequency', 'Accelerometer', 'Gyroscpoe', 'Magnitude'
- `tidyData` is created with average of each variable for each activity and each subject of `analysisData`, followed by subsequent ordering on the same
- Lastly, data from `tidyData` is written into `TidyData.txt`


## Output Data Set

`TidyData.txt` is the Output data set file. Its a space-delimited file containing variable names in the header line, along with average information of each variable for each Activity and each Subject.