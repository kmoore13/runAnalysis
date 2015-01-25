Raw Data Set
The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities such as WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING while wearing a Samsung Galaxy S smart phones on the waist. Using the phone embedded accelerometer and gyroscope 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. The data has been randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data. [1]

The signals were sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window at 50 Hz). [1]  Below is a list of variables that were estimated from the signals used.  [2] 
•	angle(): Angle between some vectors.
•	arCoeff(): Autoregression coefficients with Burg order equal to 4
•	bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
•	correlation(): Correlation coefficient between two signals
•	energy(): Energy measure. Sum of the squares divided by the number of values
•	entropy(): Signal entropy
•	iqr(): Interquartile range 
•	kurtosis(): Kurtosis of the frequency domain signal 
•	maxInds(): Index of the frequency component with largest magnitude
•	mad(): Median absolute deviation 
•	max(): Largest value in array
•	mean(): Mean value
•	meanFreq(): Weighted average of the frequency components to obtain a mean frequency
•	min(): Smallest value in array
•	sma(): Signal magnitude area
•	skewness(): Skewness of the frequency domain signal 
•	std(): Standard deviation

Each record contains the following [2]:
•	Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
•	Triaxial Angular velocity from the gyroscope. 
•	A 561-feature vector with time and frequency domain variables. 
•	Its activity label. 
•	An identifier of the subject who carried out the experiment.

The following files are contained in the data set [2]:
•	'features_info.txt': Shows information about the variables used on the feature vector.
•	'features.txt': List of all features.
•	'activity_labels.txt': Links the class labels with their activity name.
•	'train/X_train.txt': Training set.
•	'train/y_train.txt': Training labels.
•	'test/X_test.txt': Test set.
•	'test/y_test.txt': Test labels.

The following files are available for the train and test data sets. Their descriptions are equivalent.[2] 
•	'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
•	'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
•	'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
•	'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

Data Transformation
1.	Merges the training and the test sets to create one data set.
Data was downloaded from the link provided.  A runAnalysis.R script was created and the raw data was read and loaded into variables.  The data in the variables were merged to join the test and training data together.

2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
Only the measurements containing mean and std are extracted from the data sets.

3.	Uses descriptive activity names to name the activities in the data set
Activity names were read in from activity_lables.txt data file.  The file is joined to the data set using activity number to assign a descriptive name to the data set.

4.	Appropriately labels the data set with descriptive variable names. 
Some of the variables were labeled with more descriptive names
•	‘Acc’ to ‘Acceleration’
•	‘BodyBody’ to ‘Body’
•	‘^f’ to ‘Frequency’
•	‘Gyro’ to ‘Speed’
•	‘GyroJerk’ to ‘AccelerationSpeed’
•	‘Mag’ to ‘Magnitude’
•	‘\\.mean’ to ‘Mean’
•	‘\\.std’ to ‘StandardDeviation’
•	‘^t’ to ‘Time’

5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
An independent tidy data set with the average of each variable for each activity is created and the data is written to a file called ‘tidydata.txt’.

Analyzed Data Sample
> head(select(mergedDataSet,activityNum,activity, 1:5))			
record	activityNum	Activity	tBodyAcc-mean()-X	tBodyAcc-mean()-Y	tBodyAcc-mean()-Z	tBodyAcc-std()-X
1	5	STANDING	0.2885845	-0.02029417	-0.1329051	-0.9952786
2	5	STANDING	0.2784188	-0.01641057	-0.1235202	-0.9982453
3	5	STANDING	0.2796531	-0.01946716	-0.1134617	-0.9953796
4	5	STANDING	0.2791739	-0.02620065	-0.1232826	-0.9960915
5	5	STANDING	0.2766288	-0.01656965	-0.1153619	-0.9981386
6	5	STANDING	0.2771988	-0.01009785	-0.1051373	-0.9973350
						
> tail(select(mergedDataSet,activityNum,activity, 1:5))			
record	activityNum	Activity	tBodyAcc-mean()-X	tBodyAcc-mean()-Y	tBodyAcc-mean()-Z	tBodyAcc-std()-X
10294	2	WALKING_UPSTAIRS	0.1922746	-0.03364257	-0.10594911	0.3548408
10295	2	WALKING_UPSTAIRS	0.3101546	-0.05339125	-0.09910872	0.2878663
10296	2	WALKING_UPSTAIRS	0.3633846	-0.03921402	-0.10591509	0.305388
10297	2	WALKING_UPSTAIRS	0.3499661	0.03007744	-0.11578796	0.3296381
10298	2	WALKING_UPSTAIRS	0.2375938	0.01846687	-0.09649893	0.3231143
10299	2	WALKING_UPSTAIRS	0.1536272	-0.01843651	-0.13701846	0.330046

References
1.	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
2.	Readme and data files obtained from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
