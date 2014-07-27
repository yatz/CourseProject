# Peer Assessments / Getting and Cleaning Data Course Project
# dir("./UCI HAR Dataset")

# Main Function: 5 steps to create a tidy data set
run_analysis <- function() {
        # 1.Merges the training and the test sets to create one data set.
        ds <- getMergedDataSet();
        # 2.Extracts only the measurements on the mean and standard deviation for each measurement.
        ds <- extractMeanStds(ds);
        # 3.Uses descriptive activity names to name the activities in the data set.
        ds <- nameActivities(ds);
        # 4.Appropriately labels the data set with descriptive variable names.
        ds <- nameVariables(ds);
        # 5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
        ds <- createTidyDataSet(ds);
}


# 1.Merges the training and the test sets to create one data set.
getMergedDataSet <- function() {
        x <- getMergedX()
        y <- getMergedY()
        s <- getMergedS()
        cbind(x, y, s)
}

getMergedX <- function() {
        x_trainFile <- "./UCI HAR Dataset/train/X_train.txt"
        if (!file.exists(x_trainFile)){
                print(paste0(x_trainFile, " file not found!"))
                return(invisible(NA))
        }
        
        x_testFile <- "./UCI HAR Dataset/test/X_test.txt"
        if (!file.exists(x_testFile)){
                print(paste0(x_testFile, " file not found!"))
                return(invisible(NA))
        }
        
        x_trainData <- read.table(x_trainFile)
        x_testData <- read.table(x_testFile)
        x_mergedData <- rbind(x_trainData, x_testData)
        #dim(x_trainData)  #[1] 7352    561
        #dim(x_testData)   #[1] 2947    561
        #dim(x_mergedData) #[1] 10299   561
        x_mergedData
}

getMergedY <- function() {
        y_trainFile <- "./UCI HAR Dataset/train/y_train.txt"
        if (!file.exists(y_trainFile)){
                print(paste0(y_trainFile, " file not found!"))
                return(invisible(NA))
        }
        
        y_testFile <- "./UCI HAR Dataset/test/y_test.txt"
        if (!file.exists(y_testFile)){
                print(paste0(y_testFile, " file not found!"))
                return(invisible(NA))
        }
        
        y_trainData <- read.table(y_trainFile)
        y_testData <- read.table(y_testFile)
        y_mergedData <- rbind(y_trainData, y_testData)
        #dim(y_trainData)  #[1] 7352      1
        #dim(y_testData)   #[1] 2947      1
        #dim(y_mergedData) #[1] 10299     1
        colnames(y_mergedData) <- "ACTIVITYID"
        y_mergedData
}

getMergedS <- function() {
        s_trainFile <- "./UCI HAR Dataset/train/subject_train.txt"
        if (!file.exists(s_trainFile)){
                print(paste0(s_trainFile, " file not found!"))
                return(invisible(NA))
        }
        
        s_testFile <- "./UCI HAR Dataset/test/subject_test.txt"
        if (!file.exists(s_testFile)){
                print(paste0(s_testFile, " file not found!"))
                return(invisible(NA))
        }
        
        s_trainData <- read.table(s_trainFile)
        s_testData <- read.table(s_testFile)
        s_mergedData <- rbind(s_trainData, s_testData)
        #dim(s_trainData)  #[1] 7352      1
        #dim(s_testData)   #[1] 2947      1
        #dim(s_mergedData) #[1] 10299     1
        colnames(s_mergedData) <- "SUBJECT"
        s_mergedData
}


# 2.Extracts only the measurements on the mean and standard deviation for each measurement.
extractMeanStds <- function(df) {
        featureFile <- "./UCI HAR Dataset/features.txt"
        if (!file.exists(featureFile)){
                print(paste0(featureFile, " file not found!"))
                return(invisible(NA))
        }
        
        featureData <- read.table(featureFile)
        extractedVars <- featureData[grepl('(mean|std)[(][)]', featureData$V2), ]
        extractedData <- df[, c(extractedVars$V1, grep('^[^V]', colnames(df)))]
        #dim(featureData)   #[1] 561       2
        #dim(extractedVars) #[1] 66        2
        #dim(extractedData) #[1] 10299    68
        colnames(extractedData)[1:nrow(extractedVars)] <- as.character(extractedVars$V2)
        extractedData
}


# 3.Uses descriptive activity names to name the activities in the data set.
nameActivities <- function(df) {
        activityFile <- "./UCI HAR Dataset/activity_labels.txt"
        if (!file.exists(activityFile)){
                print(paste0(activityFile, " file not found!"))
                return(invisible(NA))
        }
        
        activityData <- read.table(activityFile)
        colnames(activityData) <- c("ACTIVITYID", "ACTIVITY")
        mergedData <- merge(df, activityData, by="ACTIVITYID")
        #dim(activityData) #[1] 6         2
        #dim(mergedData)   #[1] 10299    69
        mergedData[, !names(mergedData) %in% c("ACTIVITYID")]
}


# 4.Appropriately labels the data set with descriptive variable names.
# - remove parenthesis
# - cast mead/std to upper case
# - replace hyphen '-' with underscore '_'
nameVariables <- function(df) {
        colnames(df) <- gsub("(mean|std)[(][)]", "\\U\\1", colnames(df), perl=TRUE)
        colnames(df) <- gsub("-", "_", colnames(df))
        df
}


# 5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
createTidyDataSet <- function(df) {
        tidyData <- aggregate(. ~ SUBJECT+ACTIVITY, df, mean)
        write.table(tidyData, "./tidy.txt", row.names=FALSE)
        tidyData
}
