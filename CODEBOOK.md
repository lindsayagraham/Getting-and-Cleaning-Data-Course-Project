#Data set Information
##For the summary data frame produced by the script run_analysis.R

This is a summary if a subset of data from the original dataset provided at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

In this summary dataset, there are two factor variables:

'subject'	Factor w/ 30 levels 
			"1" through "30"
'activity'	Factor w/ 6 levels
			"WALKING",
			"WALKING_UPSTAIRS",
			"WALKING_DOWNSTAIRS",
			"SITTING",
			"STANDING",
			"LAYING"

And there are 66 numeric variables constructed from the original dataset mean() and std() variables. Units for the following variables are as their original (see note below):

 tBodyAcc-mean()-X_mean
 tBodyAcc-mean()-Y_mean
 tBodyAcc-mean()-Z_mean
 tBodyAcc-std()-X_mean
 tBodyAcc-std()-Y_mean
 tBodyAcc-std()-Z_mean
 tGravityAcc-mean()-X_mean
 tGravityAcc-mean()-Y_mean
 tGravityAcc-mean()-Z_mean
 tGravityAcc-std()-X_mean
 tGravityAcc-std()-Y_mean
 tGravityAcc-std()-Z_mean
 tBodyAccJerk-mean()-X_mean
 tBodyAccJerk-mean()-Y_mean
 tBodyAccJerk-mean()-Z_mean
 tBodyAccJerk-std()-X_mean
 tBodyAccJerk-std()-Y_mean
 tBodyAccJerk-std()-Z_mean
 tBodyGyro-mean()-X_mean
 tBodyGyro-mean()-Y_mean
 tBodyGyro-mean()-Z_mean
 tBodyGyro-std()-X_mean
 tBodyGyro-std()-Y_mean
 tBodyGyro-std()-Z_mean
 tBodyGyroJerk-mean()-X_mean
 tBodyGyroJerk-mean()-Y_mean
 tBodyGyroJerk-mean()-Z_mean
 tBodyGyroJerk-std()-X_mean
 tBodyGyroJerk-std()-Y_mean
 tBodyGyroJerk-std()-Z_mean
 tBodyAccMag-mean()_mean
 tBodyAccMag-std()_mean
 tGravityAccMag-mean()_mean
 tGravityAccMag-std()_mean
 tBodyAccJerkMag-mean()_mean
 tBodyAccJerkMag-std()_mean
 tBodyGyroMag-mean()_mean
 tBodyGyroMag-std()_mean
 tBodyGyroJerkMag-mean()_mean
 tBodyGyroJerkMag-std()_mean
 fBodyAcc-mean()-X_mean
 fBodyAcc-mean()-Y_mean
 fBodyAcc-mean()-Z_mean
 fBodyAcc-std()-X_mean
 fBodyAcc-std()-Y_mean
 fBodyAcc-std()-Z_mean
 fBodyAccJerk-mean()-X_mean
 fBodyAccJerk-mean()-Y_mean
 fBodyAccJerk-mean()-Z_mean
 fBodyAccJerk-std()-X_mean
 fBodyAccJerk-std()-Y_mean
 fBodyAccJerk-std()-Z_mean
 fBodyGyro-mean()-X_mean
 fBodyGyro-mean()-Y_mean
 fBodyGyro-mean()-Z_mean
 fBodyGyro-std()-X_mean
 fBodyGyro-std()-Y_mean
 fBodyGyro-std()-Z_mean
 fBodyAccMag-mean()_mean
 fBodyAccMag-std()_mean
 fBodyBodyAccJerkMag-mean()_mean
 fBodyBodyAccJerkMag-std()_mean
 fBodyBodyGyroMag-mean()_mean
 fBodyBodyGyroMag-std()_mean
 fBodyBodyGyroJerkMag-mean()_mean
 fBodyBodyGyroJerkMag-std()_mean

NOTE: Original data description:

"The features selected for this data come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix ‘t’ to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

"Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

"Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the ‘f’ to indicate frequency domain signals).

"These signals were used to estimate variables of the feature vector for each pattern:
‘-XYZ’ is used to denote 3-axial signals in the X, Y and Z directions."