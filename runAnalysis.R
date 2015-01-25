library('plyr')
library('dplyr')

##1. Merges the training and the test sets to create one data set.##
#Read the Data Into Variables
data_file_path <- file.path("./data" , "UCI HAR Dataset")
activityTestData  <- read.table(file.path(data_file_path,"test","y_test.txt" ),header=FALSE)
activityTrainData <- read.table(file.path(data_file_path,"train","y_train.txt"),header=FALSE)

subjectTrainData <- read.table(file.path(data_file_path,"train","subject_train.txt"),header=FALSE)
subjectTestData  <- read.table(file.path(data_file_path,"test","subject_test.txt"),header=FALSE)

featureTestData  <- read.table(file.path(data_file_path,"test","x_test.txt" ),header=FALSE)
featureTrainData <- read.table(file.path(data_file_path,"train","x_train.txt"),header=FALSE)


subjectMergedData <- rbind(subjectTrainData,subjectTestData)
activityMergedData<- rbind(activityTrainData,activityTestData)
featureMergedData<- rbind(featureTrainData, featureTestData)

#Set Variable Names
names(subjectMergedData)<-c("subject")
names(activityMergedData)<- c("activityNum")
featureDataNames <- read.table(file.path(data_file_path, "features.txt"),head=FALSE)
names(featureMergedData)<- featureDataNames$V2


#Merge columns to get the data frame
subjectActivityData <- cbind(subjectMergedData, activityMergedData)
mergedDataSet <- cbind(featureMergedData, subjectActivityData)


##2. Extracts only the measurements on the mean and standard deviation for each measurement. ##
featureNamesSubset<-featureDataNames$V2[grep("mean\\(\\)|std\\(\\)", featureDataNames$V2)]
selectNames<-c(as.character(featureNamesSubset), "subject", "activityNum" )
mergedDataSet<-subset(mergedDataSet,select=selectNames)


##3. Uses descriptive activity names to name the activities in the data set ##
activity_labels <- read.table(file.path(data_file_path, "activity_labels.txt"), col.names = c("activityNum", "activity"))
mergedDataSet <- join(mergedDataSet, activity_labels, by = "activityNum", match = "first")

#head(mergedDataSet[, 1:5], n=3) ##dispalys output for verification purposes

##4. Appropriately labels the data set with descriptive variable names. ##
names(mergedDataSet)<-gsub('Acc',"Acceleration",names(mergedDataSet))
names(mergedDataSet)<-gsub('BodyBody',"Body",names(mergedDataSet))
names(mergedDataSet)<-gsub('^f',"Frequency",names(mergedDataSet))
names(mergedDataSet)<-gsub('Gyro',"Speed",names(mergedDataSet))
names(mergedDataSet)<-gsub('GyroJerk',"AccelerationSpeed",names(mergedDataSet))
names(mergedDataSet)<-gsub('Mag',"Magnitude",names(mergedDataSet))
names(mergedDataSet)<-gsub('\\.mean',"Mean",names(mergedDataSet))
names(mergedDataSet)<-gsub('\\.std',"StandardDeviation",names(mergedDataSet))
names(mergedDataSet)<-gsub('^t',"Time",names(mergedDataSet))

##5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.##
#Create a copy of the Tidy Data Set with the Average of each Variable
library(plyr);
tidyDataSet<-aggregate(. ~subject + activity, mergedDataSet, mean)
tidyDataSet<-tidyDataSet[order(tidyDataSet$subject,tidyDataSet$activity),]
write.table(tidyDataSet, file = "tidydata.txt",row.name=FALSE)
