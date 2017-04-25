#RunAnalysis.R

=========

This script is built to satisfy the criteria of the [Peer-graded Assignment of the Getting and Cleaning Data Course Project on Coursera](ttps://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project).

==========

There are five requirements for the script:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

First, the script sets the path to the raw data:

```
dataloc <- "Coursera/r-programming/UCI HAR Dataset"
```

Then, we grab the raw data and place it into dataframes:

```
xtest <- read.table(paste(dataloc, "/test/X_test.txt", sep = ""), 
                header = FALSE)
xtrain <- read.table(paste(dataloc, "/train/X_train.txt", sep = ""), 
                header = FALSE)
ytest <- read.table(paste(dataloc, "/test/Y_test.txt", sep = ""), 
                header = FALSE)
ytrain <- read.table(paste(dataloc, "/train/Y_train.txt", sep = ""), 
                header = FALSE)
activitylabels <- read.table(paste(dataloc, "/activity_labels.txt", sep = ""), 
                header=FALSE)
features <- read.table(paste(dataloc, "/features.txt", sep = ""), 
                header=FALSE)
subjecttrain <- read.table(paste(dataloc, "/train/subject_train.txt", sep = ""), 
                colClasses = "factor", header = FALSE)
subjecttest <- read.table(paste(dataloc, "/test/subject_test.txt", sep = ""), 
                colClasses = "factor", header = FALSE)
```

Notice that we force the object type in 'subjecttrain' and 'subjecttest' to be factors, instead of integers.

Before we begin our merge, let's plan aherad and define only those columns we want - just the variables with 'mean()' or 'std()' in them. The next line of code builds a logical vector from the features list that corresponds to the columns in 'xtest' and 'xtrain':

```
featureswant <- grepl(paste("mean\\(\\)","std\\(\\)", sep = "|"), features$V2)
```

Note the use of the escape characters in the character strings to capture the reserved characters "(" and ")".

Now that the data is readily available, we can begin our merge. Following tidy data rules, we want one obeservation per row, and one variable per column. To acheive that in one table, we need to nest several 'bind' commands together, using the logical vector 'featureswant' we just created to subset only the columns we're interested in:

```
dt <- cbind(
        rbind(subjecttest,subjecttrain),
        rbind(ytest,ytrain),
        rbind(xtest[,featureswant],xtrain[,featureswant])
)
```

Next, we rename variables to be descriptive:

```
names(dt) <- c("subject","activity", as.character(features[featureswant,2]))
```

And then rename the values in 'activity' by joining the original 'activity' values to the activitylables dataframe:

```
dt$activity <- inner_join(dt, activitylabels, by = c("activity" = "V1"))$V2
```

Finally, we create our summary dataframe 'dtsummary' that takes the object 'dt', groups by both 'subject' and 'activity', and then calculates the mean for all remaining variables:

```
dtsummary <- dt %>% group_by_("subject", "activity") %>% 
        summarise_all(.funs = c(mean="mean"))
```

A quick `str(dtsummary)` should show the grouped structure of 'dtsummary':

```
Classes ‘grouped_df’, ‘tbl_df’, ‘tbl’ and 'data.frame':	180 obs. of  81 variables:
 $ subject                             : Factor w/ 30 levels "10","12","13",..: 1 1 1 1 1 1 2 2 2 2 ...
 $ activity                            : Factor w/ 6 levels "LAYING","SITTING",..: 1 2 3 4 5 6 1 2 3 4 ...
 $ tBodyAcc-mean()-X_mean              : num  0.28 0.271 0.277 0.279 0.29 ...
 $ tBodyAcc-mean()-Y_mean              : num  -0.0243 -0.015 -0.0155 -0.017 -0.02 ...
 $ tBodyAcc-mean()-Z_mean              : num  -0.117 -0.104 -0.108 -0.109 -0.111 ...
 $ tBodyAcc-std()-X_mean               : num  -0.968 -0.983 -0.978 -0.179 0.296 ...
 $ tBodyAcc-std()-Y_mean               : num  -0.94645 -0.91798 -0.91956 -0.02274 0.00408 ...
 $ tBodyAcc-std()-Z_mean               : num  -0.959 -0.968 -0.941 -0.396 -0.184 ...
...
```

And we're done!
