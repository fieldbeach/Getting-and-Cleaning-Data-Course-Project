library(plyr)

if(!file.exists("./data")){dir.create("./data")}

file_url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(url = file_url, destfile = "data/data_file.zip", method = "curl")

unzip(zipfile = "data/data_file.zip", exdir = "data/data_file")

#1
x_train <- read.table("data/data_file/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("data/data_file/UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("data/data_file/UCI HAR Dataset/train/subject_train.txt")
x_test <- read.table("data/data_file/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("data/data_file/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("data/data_file/UCI HAR Dataset/test/subject_test.txt")
features <- read.table("data/data_file/UCI HAR Dataset/features.txt")
activity_labels <- read.table("data/data_file/UCI HAR Dataset/activity_labels.txt")

#4
colnames(x_train) <- features[, 2]
colnames(y_train) <- "activity_id"
colnames(subject_train) <- "subject_id"
colnames(x_test) <- features[, 2]
colnames(y_test) <- "activity_id"
colnames(subject_test) <- "subject_id"

colnames(activity_labels) <- c("activity_id", "activity_type")

train <- cbind(y_train, subject_train, x_train)
test <- cbind(y_test, subject_test, x_test)

data_set <- rbind(train, test)

#2
pattern = c("activity_id", "subject_id", "mean", "std")
data_set <- data_set[, grep(paste(pattern, collapse = "|"), x = names(data_set))]

#3
data_set <- activity_labels %>% 
  inner_join(data_set, by = "activity_id") %>%
  select(-activity_id)

#4
second_set <- data_set %>% 
  group_by(subject_id, activity_type) %>%
  dplyr::summarise(across(everything(), mean))

write.table(second_set, "second_set.txt", row.names = FALSE)
