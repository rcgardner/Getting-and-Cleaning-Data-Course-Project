# Getting-and-Cleaning-Data-Course-Project  

##This project demonstrates my ability to collect, work with, and clean a data set.

##How the script "run_analysis.R" works:  

####The script “run_analysis.R” uses some of the files from the “Human Activity Recognition Using Smartphones” Dataset to create a tidy data set “meansTidyData.txt”.  The tidy data set is a reduction of the original 561 features to the 66 that include the phrase “mean” and “std” in the feature variable name, and the average of each 66 feature variable for each activity – 6 total -- and each subject – 30 total.  The tidy data set is thus a 36 x 66 matrix of feature averages (including label columns it is a 36 x 67 matrix).  

####The script “run_analysis.R” creates “meansTidyData.txt” through the following steps:  

(a) Install the dplyr package for access to key matrix manipulation functions  

(b) Create the axis labels for the observations using activity and subject combinations for each.  After reading in the associated files, the activity numbers “y_train.txt” and “y_test.txt” are replaced with descriptive activity names “activity_labels.txt” using “inner_join()” function.  The descriptive activity names are subsetted to only use the descriptors and not the IDs, and joined to the subject ID “subject_train.txt” and “subject_test.txt” using “cbind()”.  The result is two separate observations axis label data frames for train and test, “trainingActivitySubjects” and “testingActivitySubjects”, respectively.  

(c) Read in the train and test observations “X_train.txt” and “X_test.txt” as data frames, while naming the columns by reading as a data frame “features.txt” using the “colnames()” function.  The result is two separate data frames for train and test with descriptive features labeled variables, “trainingFeatures” and “testingFeatures”, respectively.  

(d) Bind the four dataframes by rows.  “trainingActivitySubjects” and “testingActivitySubjects” are joined by “rbind()”, and “training Features” and “testingFeatures” are joined by “rbind()”.  The resulting dataframes are “activitySubjectsAxis” for all observations, and “rawFeaturesMatrix” for all variables.  

(e) Select the measurements on the mean and standard deviation for each measurement by first selecting the subsets of “rawFeaturesMatrix” containing “mean” and “std” in column titles using “grep()”, and then removing “meanFreq” similarly by using the “-grep()” function on “Freq”.  The resulting dataframe “msFeaturesMatrix” is then joined to the observations label dataframe “activitySubjectsAxis” using the “cbind()” function, creating the dataframe “msTidyFeaturesMatrix”.  

(f) Create a new tidy data set of activity and subject means by feature.  
> 1) First, create a dataframe “activityMeans” using the “summarise_each(funs(mean))” function in conjunction with the “group_by()” function over the “Activity” variable, leaving out the “SubjectID” variable.  Rename “Activity” column using the “rename()” function to “categoryMeans” to establish a common heading when binding with the “subjectMeans” dataframe that follows.  

> 2) Similarly, create a dataframe “subjectMeans” using the “summarise_each((funs(mean))” function in conjunction with “group_by()” function over the “SubjectID” variable, leaving out the “Activity” variable.  Rename the “SubjectID” column using the “rename()” function to “categoryMeans” to establish a common heading when binding with the “activityMeans” dataframe created above.  

> 3) Finally, bind “activityMeans” to “subjectMeans” using the “rbind()” function, creating the dataframe “meansTidyData”.  

(g) Create a txt file of “meansTidyData” dataframe using the “write.table()” function and “row.name=FALSE” argument.  
