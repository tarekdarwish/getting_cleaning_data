run_analysis <- function() {
  merged_data <- merge_data("./")
  merged_data <- tbl_df(merged_data)
  write.table(merged_data, "merged_data.txt", row.names = FALSE)
  summary_data <- merged_data %>% group_by(subject, activity) %>% summarise_each(funs(mean))
  summary_data
  
  
}
merge_data <- function (data_pointer) {
  # Given the data_pointer (which is directory pointer)
  # construct the paths to the different files needed by the analysis
  
  # Path to file that has the name of the features recorded
  features_names_file <- paste0 (data_pointer, "/features.txt")
  # Path to the file that has the name of the activities
  labels_file <- paste0 (data_pointer, "/activity_labels.txt")
  
  # Training data files
  train_data_file <- paste0 (data_pointer, "/train/X_train.txt")
  train_activity_file <- paste0(data_pointer, "/train/y_train.txt")
  train_subjects_file <- paste0(data_pointer, "/train/subject_train.txt")
  
  # Test data files
  test_data_file <- paste0 (data_pointer, "/test/X_test.txt")
  test_activity_file <- paste0(data_pointer, "/test/y_test.txt")
  test_subjects_file <- paste0(data_pointer, "/test/subject_test.txt")
  
  # Creat a vector for all the files
  files_list <- c(features_names_file, labels_file, train_data_file,
                  train_activity_file, train_subjects_file, test_data_file,
                  test_activity_file, test_subjects_file)
  
  # check fo the existance of all files before starting analysis
  # any file that does not exist, will cause the function to return FALSE
  # and thus function returns to user with message and no analysis
  if (collateral_exists(files_list)) {
    # load feature names
    features_names <- read.table(features_names_file)
    names(features_names) <- c("id", "feature")
    # load activity names
    activity_names <- read.table(labels_file)
    names(activity_names) <- c("id", "activity")

    # load train data
    train_data <- read.table(train_data_file)
    names(train_data) <- features_names[,2]
    train_activity <- read.table(train_activity_file)
    names(train_activity) <- "activity"
    train_subjects <- read.table(train_subjects_file)
    names(train_subjects) <- "subject"
    
    #load test data
    test_data <- read.table(test_data_file)
    names(test_data) <- features_names[,2]
    test_activity <- read.table(test_activity_file)
    names(test_activity) <- "activity"
    test_subjects <- read.table(test_subjects_file)
    names(test_subjects) <- "subject"
    
    # extract columns corresponding to mean and std deviations
    subset_train_data <- train_data[,grep("mean|std", names(train_data))]
    subset_test_data <- test_data[,grep("mean|std", names(test_data))]
    
    # add columns for the subjects and activities for both test and train data
    subset_train_data <- cbind(train_subjects, train_activity, subset_train_data)
    subset_test_data <- cbind(test_subjects, test_activity, subset_test_data)
    # merge the train and test data
    merged_data <- rbind(subset_train_data, subset_test_data)
    merged_data <- tbl_df(merged_data)
    
    # change the acitivity column to use actual names instead of numbers
    # And make this column factor
    merged_data$activity <- as.factor(merged_data$activity)
    levels(merged_data$activity) <- activity_names[,2]
    
    # Make subjects column sa factor as well
    merged_data$subject <- as.factor(merged_data$subject)
    
    # cleanup variables names from "()" and "-"
    names(merged_data) <- gsub("[()-]", "", names(merged_data))
    merged_data
  }
}



collateral_exists <- function (files) {
  allexists <- TRUE
  for (file in files) {
    if (!file.exists(file)) {
      allexists <- FALSE
      print (paste0 ("Cannot find the following: \"", file, "\" Bye!"))
      break
    }
  }
  allexists
}