library(dplyr)

# Download the file, unzip it, and load the data
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile ="getdata_projectfiles_UCI_HAR_Dataset.zip", mode = "wb")

if (file.exists("getdata_projectfiles_UCI_HAR_Dataset.zip")) {
  print("The zip file was downloaded successfully!")
} else {
  print("The file was NOT downloaded.")
}

unzip("getdata_projectfiles_UCI_HAR_Dataset.zip")

if (file.exists("UCI HAR Dataset")) {
  print("The 'UCI HAR Dataset' folder was unzipped successfully!")
} else {
  print("Could not unzip the folder.")
}

# Load features and activity labels
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# Load train data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Load test data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")


# Assign column names to x_train and x_test using the features list
colnames(x_train) <- features$V2
colnames(x_test) <- features$V2

# Name the column of y_train and y_test data as "activity"
colnames(y_train) <- "activity"
colnames(y_test) <- "activity"

# Name the column of subject_train and subject_test data as "subject"
colnames(subject_train) <- "subject"
colnames(subject_test) <- "subject"

#  Merge the training and the test sets to create one data set.
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)
merged_data <- cbind(subject_data, y_data, x_data)

# Extract only the measurements on the mean and standard deviation for each measurement.
# Select the subject and activity columns, along with any column containing "mean" or "std" (excluding "meanFreq()")
data_mean_std <- merged_data %>% select(subject, activity, contains("mean("), contains("std("))

# Use descriptive activity names to name the activities in the data set
# Match the activity names based on the activity ID and replace the values in the "activity" column
tidy_data <- data_mean_std %>%
  mutate(activity = activity_labels$V2[activity])

# Appropriately label the data set with descriptive variable names. 
# The descriptive variables are: Time, Frequency, Accelerometer, Gyroscope, Magnitude, Body
names(tidy_data) <- gsub("^t", "Time", names(tidy_data))
names(tidy_data) <- gsub("^f", "Frequency", names(tidy_data))
names(tidy_data) <- gsub("Acc", "Accelerometer", names(tidy_data))
names(tidy_data) <- gsub("Gyro", "Gyroscope", names(tidy_data))
names(tidy_data) <- gsub("Mag", "Magnitude", names(tidy_data))
names(tidy_data) <- gsub("BodyBody", "Body", names(tidy_data))

#  From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
final_tidy_data <- tidy_data %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), mean), .groups = 'drop')

write.table(final_tidy_data, "final_tidy_data.txt", row.name = FALSE)
