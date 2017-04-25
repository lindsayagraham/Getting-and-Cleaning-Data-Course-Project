##      Set datalocation parent folder

dataloc <- "Coursera/r-programming/UCI HAR Dataset"

##      Get raw datasets

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

##      Find only "mean()" and "std()" features 
##      as described in the data's features_info.txt

featureswant <- grepl(paste("mean\\(\\)","std()", sep = "|"), features$V2)

##      Merge datasets

dt <- cbind(
        rbind(subjecttest,subjecttrain),
        rbind(ytest,ytrain),
        rbind(xtest[,featureswant],xtrain[,featureswant])
)

##      Rename vartiables

names(dt) <- c("subject","activity", as.character(features[featureswant,2]))

##      Rename activity values

dt$activity <- inner_join(dt, activitylabels, by = c("activity" = "V1"))$V2

##      Create summary dataset, 
##      calculating mean for each variable by subject and activity

dtsummary <- dt %>% group_by_("subject", "activity") %>% 
        summarise_all(.funs = c(mean="mean"))

dtsummary
