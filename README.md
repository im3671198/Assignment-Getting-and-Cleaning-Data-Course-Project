# Assignment-Getting-and-Cleaning-Data-Course-Project

The script `run_analysis.R` executes the following data cleaning steps:

0 - Download the file, unzip it, and load the data
0.1 - Load features and activity labels
0.2 - Load train data
0.3 - Load test data
0.4 - Assign column names to x_train and x_test using the features list
0.5 - Name the column of y_train and y_test data as "activity"
0.6 - Name the column of subject_train and subject_test data as "subject"

1 - Merge the training and the test sets to create one data set.

2 - Extract only the measurements on the mean and standard deviation for each measurement. 
2.1 - Select the subject and activity columns, along with any column containing "mean" or "std" (excluding "meanFreq()")

3 - Use descriptive activity names to name the activities in the data set
3.1 - Match the activity names based on the activity ID and replace the values in the "activity" column

4 - Appropriately label the data set with descriptive variable names. 
4.1 - The descriptive variables are: Time, Frequency, Accelerometer, Gyroscope, Magnitude, Body

5 - From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

