==================================================================
##Tidy Data Set “meansTidyData.txt” Codebook:  the average of each variable for each activity and each subject from the overall dataset reduced to features containing “mean” and “std” (and not “Freq”)  

==================================================================
Entirely based on “Human Activity Recognition Using Smartphones Dataset, Version 1.0”
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws

==================================================================
From “Human Activity Recognition Using Smartphones Dataset, Version 1.0”, the experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

###Raw data:  Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration, Triaxial Angular velocity from the gyroscope, a 561-feature vector with time and frequency domain variables, Its activity label, and an identifier of the subject who carried out the experiment.

The raw data includes the following files:

'README.txt'
'features_info.txt': Shows information about the variables used on the feature vector.
'features.txt': List of all features.
'activity_labels.txt': Links the class labels with their activity name.
‘train/X_train.txt': Training set.
'train/y_train.txt': Training labels.
'test/X_test.txt': Test set.
'test/y_test.txt': Test labels.
The following files are available for the train and test data. Their descriptions are equivalent. 
'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

###Creating the Tidy Datafile “meansTidyData.txt”

The procedure is closely document in the README.md file and demonstrated in “run_analysis.R”.  A high level flow is as follows:

(1) Install dplyr
(2) Read in the file with the 6 activities
(3) Read in activity observations and subject data sets, label as descriptive activity variables, and join subjects to activity labels – for train and test data sets
(4) Read in the train and test data sets while labelling these feature variables 
(5) Bind first the observation axis label data frames and second the feature variables data frames
(6) Select the measurements on the mean and standard deviation for each measurement.  Bind the complete axis label and complete feature variable dataframes together
(7) Create tidy data set of activity and subject means by feature
(8) Print “meansTidyData” to a txt file

###Variables in “run_analysis.R” and “meansTidyData.txt”

The dimensions of “meansTidyData.txt” is 36 x 67.  The 36 observations are 6 activities “meansTidyData[1:6,] and 30 subjects “meansTidyData[6:36,].  The 67 columns include the observations label “categoryMeans” for the activities and subjects, followed by 66 features selected from “features.txt” to contain “mean” and “std” – but not “Freq”.   All feature values are numeric, and the “categoryMeans” are factors.  

The data shows the averages across each subject and activity by the “mean” and “std” selected features.  Because features are normalized and bounded within [-1,1], the same goes for the averages of these units.

The variables description is best started with the original data set “features_info.txt” guidance to arrive at the 66 features we ultimately use.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

From these values the “mean” = average and “std” = standard deviation for the feature in the observation was recorded.  These “mean” and “std” variables were selected (66 of the original 561 features) and averaged for the 30 subjects (volunteers) and 6 activities to create a 36 x 66 matrix of the average values. 

1. tBodyAcc-mean()-X – time domain, body linear acceleration mean for X component
2. tBodyAcc-mean()-Y – time domain, body linear acceleration mean for Y component
3. tBodyAcc-mean()-Z – time domain, body linear acceleration mean for Z component
4. tBodyAcc-std()-X– time domain, body linear acceleration standard deviation for X component
5. tBodyAcc-std()-Y– time domain, body linear acceleration standard deviation for Y component
6. tBodyAcc-std()-Z– time domain, body linear acceleration standard deviation for Z component
7. tGravityAcc-mean()-X– time domain, gravity linear acceleration mean for X component
8. tGravityAcc-mean()-Y– time domain, gravity linear acceleration mean for Y component
9. tGravityAcc-mean()-Z– time domain, gravity linear acceleration mean for Z component
10. tGravityAcc-std()-X– time domain, gravity linear acceleration standard deviation for X component
11. tGravityAcc-std()-Y– time domain, gravity linear acceleration standard deviation for Y component
12. tGravityAcc-std()-Z– time domain, gravity linear acceleration standard deviation for Z component
13. tBodyAccJerk-mean()-X -- time domain, jerk signal linear acceleration mean for X component
14. tBodyAccJerk-mean()-Y-- time domain, jerk signal linear acceleration mean for Y component
15. tBodyAccJerk-mean()-Z-- time domain, jerk signal linear acceleration mean for Z component
16. tBodyAccJerk-std()-X-- time domain, jerk signal linear acceleration standard deviation for X component
17. tBodyAccJerk-std()-Y-- time domain, jerk signal linear acceleration standard deviation for Y component
18. tBodyAccJerk-std()-Z-- time domain, jerk signal linear acceleration standard deviation for Z component
19. tBodyGyro-mean()-X– time domain, gyro angular velocity mean for X component
20. tBodyGyro-mean()-Y– time domain, gyro angular velocity mean for Y component
21. tBodyGyro-mean()-Z– time domain, gyro angular velocity mean for Z component
22. tBodyGyro-std()-X– time domain, gyro angular velocity standard deviation for X component
23. tBodyGyro-std()-Y– time domain, gyro angular velocity standard deviation for Y component
24. tBodyGyro-std()-Z– time domain, gyro angular velocity standard deviation for Z component
25. tBodyGyroJerk-mean()-X-- time domain, jerk signal angular velocity mean for X component
26. tBodyGyroJerk-mean()-Y-- time domain, jerk signal angular velocity mean for Y component
27. tBodyGyroJerk-mean()-Z-- time domain, jerk signal angular velocity mean for Z component
28. tBodyGyroJerk-std()-X-- time domain, jerk signal angular velocity standard deviation for X component
29. tBodyGyroJerk-std()-Y-- time domain, jerk signal angular velocity standard deviation for Y component
30. tBodyGyroJerk-std()-Z-- time domain, jerk signal angular velocity standard deviation for Z component
31. tBodyAccMag-mean()- time domain, body linear acceleration mean magnitude, ie, all components
32. tBodyAccMag-std()- time domain, body linear acceleration standard deviation magnitude, ie, all components
33. tGravityAccMag-mean()– time domain, gravity linear acceleration mean magnitude, ie, all components
34. tGravityAccMag-std()– time domain, gravity linear acceleration standard deviation magnitude, ie, all components
35. tBodyAccJerkMag-mean()-time domain, jerk signal linear acceleration mean magnitude, ie, all components
36. tBodyAccJerkMag-std()-time domain, jerk signal linear acceleration standard deviation magnitude, ie, all components
37. tBodyGyroMag-mean()– time domain, gyro angular velocity mean magnitude, ie, all components
38. tBodyGyroMag-std()– time domain, gyro angular velocity standard deviation magnitude, ie, all components
39. tBodyGyroJerkMag-mean()-- time domain, jerk signal angular velocity mean magnitude, ie, all components
40. tBodyGyroJerkMag-std()- time domain, jerk signal angular velocity standard deviation magnitude, ie, all components
41. fBodyAcc-mean()-X - frequency domain, body linear acceleration mean for X component
42. fBodyAcc-mean()-Y- frequency domain, body linear acceleration mean for Y component
43. fBodyAcc-mean()-Z- frequency domain, body linear acceleration mean for Z component
44. fBodyAcc-std()-X- frequency domain, body linear acceleration standard deviation for X component
45. fBodyAcc-std()-Y- frequency domain, body linear acceleration standard deviation for Y component
46. fBodyAcc-std()-Z- frequency domain, body linear acceleration standard deviation for Z component
47. fBodyAccJerk-mean()-X-- frequency domain, jerk signal linear acceleration mean for X component
48. fBodyAccJerk-mean()-Y-- frequency domain, jerk signal linear acceleration mean for Y component
49. fBodyAccJerk-mean()-Z-- frequency domain, jerk signal linear acceleration mean for Z component
50. fBodyAccJerk-std()-X-- frequency domain, jerk signal linear acceleration standard deviation for X component
51. fBodyAccJerk-std()-Y-- frequency domain, jerk signal linear acceleration standard deviation for Y component
52. fBodyAccJerk-std()-Z-- frequency domain, jerk signal linear acceleration standard deviation for Z component
53. fBodyGyro-mean()-X– frequency domain, gyro angular velocity mean for X component
54. fBodyGyro-mean()-Y– frequency domain, gyro angular velocity mean for Y component
55. fBodyGyro-mean()-Z– frequency domain, gyro angular velocity mean for Z component
56. fBodyGyro-std()-X– frequency domain, gyro angular velocity standard deviation for X component
57. fBodyGyro-std()-Y– frequency domain, gyro angular velocity standard deviation for Y component
58. fBodyGyro-std()-Z– frequency domain, gyro angular velocity standard deviation for Z component
59. fBodyAccMag-mean()- frequency domain, body linear acceleration mean magnitude, ie, all components
60. fBodyAccMag-std()- frequency domain, body linear acceleration standard deviation magnitude, ie, all components
61. fBodyAccJerkMag-mean()-frequency domain, jerk signal linear acceleration mean magnitude, ie, all components
62. fBodyAccJerkMag-std()-frequency domain, jerk signal linear acceleration standard deviation magnitude, ie, all components
63. fBodyGyroMag-mean()– frequency domain, gyro angular velocity mean magnitude, ie, all components
64. fBodyGyroMag-std()– frequency domain, gyro angular velocity standard deviation magnitude, ie, all components
65. fBodyGyroJerkMag-mean()-- frequency domain, jerk signal angular velocity mean magnitude, ie, all components
66. fBodyGyroJerkMag-std()-- frequency domain, jerk signal angular velocity standard deviation magnitude, ie, all components

"categoryMeans" are simply the activities (class = factor)

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

####Followed by the subjects 1-30, making for indices 7-36 in the data file (integers coerced to factors).
========
License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.Enter file contents here
