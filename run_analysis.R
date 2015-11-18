run_analysis <- function() {
  ## packages to use
  library (matrixStats) 
    
  ## first task is to read raw data into variables
  subject_test <- read.table("~/UCI HAR Dataset/test/subject_test.txt", header=FALSE)
  x_test <- read.table("~/UCI HAR Dataset/test/x_test.txt", header=FALSE)
  y_test <- read.table("~/UCI HAR Dataset/test/y_test.txt", header=FALSE)
  subject_train <- read.table("~/UCI HAR Dataset/train/subject_train.txt", header=FALSE)
  x_train <- read.table("~/UCI HAR Dataset/train/x_train.txt", header=FALSE)
  y_train <- read.table("~/UCI HAR Dataset/train/y_train.txt", header=FALSE)
  activity_labels <- read.table("~/UCI HAR Dataset/activity_labels.txt", header=FALSE)
  ## only need row mean and SD (which will apply to X_ data)
  ## rowsSds needs matrix so make sure we have first
  x_test <- data.matrix(x_test, rownames.force = NA)
  x_train <- data.matrix(x_train, rownames.force = NA)
  test_mean <- rowMeans(x_test,na.rm=TRUE)
  train_mean <- rowMeans(x_train, na.rm=TRUE)
  test_SD=rowSds(x_test, na.rm=TRUE)
  train_SD=rowSds(x_train, na.rm=TRUE)
    ## then join the two data sets to single data frame 
  acceleration_data<- cbind(subject_test, y_test, test_mean, test_SD)           
  acceleration_data_test <- cbind(subject_train, y_train, train_mean, train_SD) 
  names(acceleration_data) <- c("subject", "activity", "average", "standardD")
  names(acceleration_data_test) <- c("subject", "activity", "average", "standardD")
  acceleration_data <- rbind(acceleration_data_test, acceleration_data)
  
  ## remove the parent data sets to free memory
  rm (subject_test)
  rm (x_test)
  rm (y_test)
  rm (test_mean)
  rm (test_SD)
  rm (acceleration_data_test)
  rm (subject_train)
  rm (x_train)
  rm (y_train)
  rm (train_mean)
  rm (train_SD)
  ## specification is for test to be readable, so need to swap numbers using activity_lables
  acceleration_data$activity <- activity_labels[match(acceleration_data$activity, activity_labels[ , 1]) , 2]
  
  ## need to generate a second data table summarizing means by subject and activity
  summary_data <- aggregate(acceleration_data$average, list(subject = acceleration_data$subject, activity = acceleration_data$activity), FUN="mean")
  names(summary_data)[3] <- "average"
  
  ## write a copy of summary_data to upload
  write.table(summary_data, file = "tidy_data.txt", row.names = FALSE)
  
  }