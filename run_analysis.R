library('dplyr')

# Download

UCIzip = "./UCI HAR Dataset.zip"
UCIdir = "./UCI HAR Dataset/"
if(!file.exists(UCIdir)) {
  url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  file<-download.file(url, destfile = UCIzip, method = "curl")
  unzip(UCIzip)
}

# Function to map index to name, given a key-value dictionary
map <- function(code, dict) {dict[match(code,dict[,1]),2]}

############################################################################################
# 1. Merges the training and the test sets to create one data set.
############################################################################################

x_data<-rbind(
  read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE),
  read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)
)

# Reads in the table of feature (variable) names
feature_dict <- read.table('UCI HAR Dataset/features.txt', stringsAsFactors=FALSE, header=FALSE)

# Renames columns by mapping feature index to feature (variable) name
colnames(x_data)<-map(c(1:561),feature_dict)

# Merges the subject and activity information witht he x variable names
merged_data<-cbind(
  rbind(
    read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE, col.names=c('subject')),
    read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE, col.names=c('subject'))
  ),
  rbind(
    read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE, col.names=c('activity')),
    read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE, col.names=c('activity'))
  ),
  x_data
)

############################################################################################
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
############################################################################################

colnames(merged_data)<-gsub("-mean\\(\\)", "MEAN", colnames(merged_data))
colnames(merged_data)<-gsub("-std\\(\\)","STD", colnames(merged_data))
colnames(merged_data)<-make.names(colnames(merged_data), unique=TRUE)
merged_data <- select(merged_data, matches('subject|activity|MEAN|STD', ignore.case=FALSE))

############################################################################################
# 3. Uses descriptive activity names to name the activities in the data set.
############################################################################################

activity_dict <- read.table('UCI HAR Dataset/activity_labels.txt', stringsAsFactors=FALSE, header=FALSE)

merged_data$activity <- sapply(merged_data$activity, function(x) {map(x,activity_dict)})

############################################################################################
# 4. Appropriately labels the data set with descriptive variable names. 
############################################################################################

colnames(merged_data)<-gsub("Acc", "Acceleration", colnames(merged_data))
colnames(merged_data)<-gsub("fBody", "FourierBody", colnames(merged_data))
colnames(merged_data)<-gsub("tBody", "TimeBody", colnames(merged_data))
colnames(merged_data)<-gsub("tGravity", "TimeGravity", colnames(merged_data))
colnames(merged_data)<-gsub("Mag", "Magnitude", colnames(merged_data))

############################################################################################
# 5. From the data set in step 4, creates a second, independent tidy data set with the 
#    average of each variable for each activity and each subject.
############################################################################################

final_data <- merged_data %>%
  group_by(subject, activity) %>%
  summarize_each(funs(mean))

write.table(final_data, 'tidy.txt')


