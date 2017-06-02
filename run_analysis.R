## run_analysis.R

## Read in data from test set

test_path <- "data/UCI HAR Dataset/test"

subject_test <- read.table(paste0(test_path, "/subject_test.txt"))
X_test <- read.table(paste0(test_path, "/X_test.txt"))
y_test <- read.table(paste0(test_path, "/y_test.txt"))

## Read in data from training set

train_path <- "data/UCI HAR Dataset/train"

subject_train <- read.table(paste0(train_path, "/subject_train.txt"))
X_train <- read.table(paste0(train_path, "/X_train.txt"))
y_train <- read.table(paste0(train_path, "/y_train.txt"))

## Read in feature names

data_path <- "data/UCI HAR Dataset"

features <- read.table(paste0(data_path, "/features.txt"), stringsAsFactors = FALSE)
activity_labels <- read.table(paste0(data_path, "/activity_labels.txt"))

## Build the test data set

test_data <- cbind(y_test, X_test, subject_test)
colnames(test_data) <- c("V1", features$V2, "subject_id")
test_data <- merge(activity_labels, test_data, by = "V1")

## Build the train data set

train_data <- cbind(y_train, X_train, subject_train)
colnames(train_data) <- c("V1", features$V2, "subject_id")
train_data <- merge(activity_labels, train_data, by = "V1")

## Vertically combine the test and train data sets

all_data <- rbind(test_data, train_data)
colnames(all_data)[1:2] <- c("activity_id", "activity_type")

## Find variables that measure mean, standard deviation and activity type

mean_indecies <- grep("mean", names(all_data), ignore.case = TRUE)
std_indecies <- grep("std", names(all_data), ignore.case = TRUE)
activity_index <- 2
subject_index <- 564

col_indecies <- c(mean_indecies, std_indecies, activity_index, subject_index)

## Select a subset of the data with only the relevant column indecies

selected_data <- all_data[,col_indecies]


## Descriptive activity names and subject_ids were already provided with the merge above

## Clean up the data and compute averages among subjects and activities

tidy_data <- selected_data %>%
        gather(variable, value, -subject_id, -activity_type) %>%
        group_by(activity_type, subject_id, variable) %>%
        summarize(value = mean(value)) %>%
        arrange(activity_type, subject_id, value)

## Finally, return the data_tbl

write.csv(tidy_data, "tidy_data.csv")


