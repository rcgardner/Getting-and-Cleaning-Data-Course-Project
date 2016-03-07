# run_analysis.R performs the following tasks to a set of datafiles outlined in README.md

# include dplyr and read in the activity label file 
	require(dplyr)
	activityLabels<-read.table("activity_labels.txt")

# read in activity observations and subject data sets, label as descriptive 
# activity variables, and join subjects to activity labels.  for train and test.	
	trainingActivityIDs<-read.table("y_train.txt")
	trainingActivityLabels<-inner_join(trainingActivityIDs,activityLabels)
	trainingSubjectIDs<-read.table("subject_train.txt")
	trainingActivitySubjects<-cbind(trainingSubjectIDs,trainingActivityLabels[,2])
	colnames(trainingActivitySubjects)<-c("SubjectID","Activity")

	testingActivityIDs<-read.table("y_test.txt")
	testingActivityLabels<-inner_join(testingActivityIDs,activityLabels)
	testingSubjectIDs<-read.table("subject_test.txt")
	testingActivitySubjects<-cbind(testingSubjectIDs,testingActivityLabels[,2])
	colnames(testingActivitySubjects)<-c("SubjectID","Activity")

# read in the test and train data sets while labelling these feature variables
	featureNames<-read.table("features.txt")
	colnames(featureNames)<-c("ID","Feature")
	trainingFeatures<-read.table("X_train.txt",col.names=featureNames$Feature)
	testingFeatures<-read.table("X_test.txt",col.names=featureNames$Feature)

# bind first the observation axis label data frames and second the feature variables data frames
	activitySubjectsAxis<-rbind(trainingActivitySubjects,testingActivitySubjects)
	rawFeaturesMatrix<-rbind(trainingFeatures,testingFeatures)

# select the measurements on the mean and standard deviation for each measurement
# bind the complete axis label and complete feature variable dataframes together
	msfFeaturesMatrix<-select(rawFeaturesMatrix,grep("mean|std",names(rawFeaturesMatrix)))
	msFeaturesMatrix<-select(msfFeaturesMatrix,-grep("Freq",names(msfFeaturesMatrix)))
	msTidyFeaturesMatrix<-cbind(activitySubjectsAxis,msFeaturesMatrix)

# create tidy data set of activity and subject means by feature
	by_activity <- msTidyFeaturesMatrix %>% group_by(Activity)
	activityMeans<-by_activity %>% summarise_each(funs(mean), -SubjectID)
	activityMeans<-rename(activityMeans,categoryMeans = Activity)

	by_subject <- msTidyFeaturesMatrix %>% group_by(SubjectID)
	subjectMeans<-by_subject %>% summarise_each(funs(mean), -Activity)
	subjectMeans<-rename(subjectMeans,categoryMeans = SubjectID)
	subjectMeans$categoryMeans<-as.factor(subjectMeans$categoryMeans)
	
	meansTidyData<-rbind(activityMeans,subjectMeans)

# print "meansTidyData" to a txt file
	write.table(meansTidyData,file="meansTidyData.txt",row.name=FALSE)

