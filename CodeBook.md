
# CodeBook.md - Human Activity Recognition Using Smartphones

This code book describes the data, variables, and transformations performed to clean up the data and generate the final tidy dataset.

## 1. Dataset Description

The source data comes from the "Human Activity Recognition Using Smartphones Dataset", which contains tracking data from 30 volunteers aged 19-48 performing six activities while wearing a Samsung Galaxy S II smartphone on their waist. 

## 2. Transformations and Work Performed
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

## 3. Variables in the Tidy Dataset

### Identifiers
* **`subject`**: The ID of the volunteer participant. 
  * *Data Type:* Integer (Range: 1 to 30).  
* **`activity`**: The specific activity performed by the subject while wearing the smartphone.
  * *Data Type:* Factor / String.
  * *Values:* `WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`, `LAYING`.

### Signal Measurements (Averages)
All remaining 66 variables represent the **average** of the mean and standard deviation measurements for each subject and activity. 

* *Data Type:* Numeric / Float.

#### Time Domain Signals (Prefix: `time`)
* `timeBodyAccelerometerMeanX` / `Y` / `Z`: Average body acceleration mean on the X, Y, and Z axes.
* `timeBodyAccelerometerStdX` / `Y` / `Z`: Average body acceleration standard deviation on the X, Y, and Z axes.
* `timeGravityAccelerometerMeanX` / `Y` / `Z`: Average gravity acceleration mean on the X, Y, and Z axes.
* `timeGravityAccelerometerStdX` / `Y` / `Z`: Average gravity acceleration standard deviation on the X, Y, and Z axes.
* `timeBodyAccelerometerJerkMeanX` / `Y` / `Z`: Average body linear acceleration Jerk signals on the X, Y, and Z axes.
* `timeBodyAccelerometerJerkStdX` / `Y` / `Z`: Average body linear acceleration Jerk standard deviation on the X, Y, and Z axes.
* `timeBodyGyroscopeMeanX` / `Y` / `Z`: Average body angular velocity mean on the X, Y, and Z axes.
* `timeBodyGyroscopeStdX` / `Y` / `Z`: Average body angular velocity standard deviation on the X, Y, and Z axes.
* `timeBodyGyroscopeJerkMeanX` / `Y` / `Z`: Average body angular velocity Jerk signals on the X, Y, and Z axes.
* `timeBodyGyroscopeJerkStdX` / `Y` / `Z`: Average body angular velocity Jerk standard deviation on the X, Y, and Z axes.
* `timeBodyAccelerometerMagnitudeMean` / `Std`: Average magnitude of body acceleration (mean and standard deviation).
* `timeGravityAccelerometerMagnitudeMean` / `Std`: Average magnitude of gravity acceleration.
* `timeBodyAccelerometerJerkMagnitudeMean` / `Std`: Average magnitude of body acceleration Jerk signals.
* `timeBodyGyroscopeMagnitudeMean` / `Std`: Average magnitude of body angular velocity.
* `timeBodyGyroscopeJerkMagnitudeMean` / `Std`: Average magnitude of body angular velocity Jerk signals.

#### Frequency Domain Signals (Prefix: `frequency`)
*(These variables represent the Fast Fourier Transform (FFT) applied to the time domain signals)*
* `frequencyBodyAccelerometerMeanX` / `Y` / `Z`: Average FFT of body acceleration mean on the X, Y, and Z axes.
* `frequencyBodyAccelerometerStdX` / `Y` / `Z`: Average FFT of body acceleration standard deviation on the X, Y, and Z axes.
* `frequencyBodyAccelerometerJerkMeanX` / `Y` / `Z`: Average FFT of body linear acceleration Jerk signals.
* `frequencyBodyAccelerometerJerkStdX` / `Y` / `Z`: Average FFT of body linear acceleration Jerk standard deviation.
* `frequencyBodyGyroscopeMeanX` / `Y` / `Z`: Average FFT of body angular velocity mean.
* `frequencyBodyGyroscopeStdX` / `Y` / `Z`: Average FFT of body angular velocity standard deviation.
* `frequencyBodyAccelerometerMagnitudeMean` / `Std`: Average FFT magnitude of body acceleration.
* `frequencyBodyAccelerometerJerkMagnitudeMean` / `Std`: Average FFT magnitude of body acceleration Jerk signals.
* `frequencyBodyGyroscopeMagnitudeMean` / `Std`: Average FFT magnitude of body angular velocity.
* `frequencyBodyGyroscopeJerkMagnitudeMean` / `Std`: Average FFT magnitude of body angular velocity Jerk signals.
