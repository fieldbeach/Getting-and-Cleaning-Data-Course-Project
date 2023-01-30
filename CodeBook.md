The source data is from the Human Activity Recognition Using Smartphones Data Set. A full description is available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones Used data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Execute the R script "run_analysis.R" to receive the tidy dataset.

run_analysis.R does the following
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

About variables:
x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.
x_data, y_data and subject_data merge the previous datasets to further analysis.
features contains the correct names for the x_data dataset, which are applied to the column names stored in
