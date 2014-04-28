Code Book for Clean Data and Tidy Data Set
==

Data created by run_analysis.
--
### cleandata.csv (Clean Data) and TidyDataSet.csv (Tidy Data)

The Clean Data set contains the full processed data relating to the analysis, this table has multiple rows of signal data per subject and activity.

The Tidy Data set contains one row for each subject and activity, each column in the row represents the average of the data in the Clean Data set corresponding to the subject and activity.

Both Clean and Tidy data sets contain the mean and std column only.  All other columns in the original data set have been removed.
Column names in both Clean and Tidy data sets have been altered from the original names in the following manner: Parentheses have been removed and dashes have been replaced with under scores, this has been done to provide compatibility with the MySQL naming conventions.

Example: tBodyAcc-mean()-X has become tBodyAcc_mean_X

The data columns selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.



```
 [1]  Subject  
 			Unique identifier for test subject.
 			Integer Value 1 - n
 			                                  
 [2]  ActivityCode
 			Unique identifier for the activity
 			Integer value 1 - 6
 			                         
 [3]  Activity 
 			Descriptive name of the activity
 			Character Value
 				1 WALKING
				2 WALKING_UPSTAIRS
				3 WALKING_DOWNSTAIRS
				4 SITTING
				5 STANDING
				6 LAYING
                                 
 [4]  Datatype (not available in tidy data set)
 			Indicates category of data in the row
 			Character Value
 			train, test
 			         
The following columns of data represent the mean and standard deviation
of the measurement taken on each subject.
                         
 [5]  tBodyAcc_mean_X                    
 [6]  tBodyAcc_mean_Y                    
 [7]  tBodyAcc_mean_Z                    
 [8]  tBodyAcc_std_X                      
 [9]  tBodyAcc_std_Y                      
[10]  tBodyAcc_std_Z                      
[11]  tGravityAcc_mean_X              
[12]  tGravityAcc_mean_Y              
[13]  tGravityAcc_mean_Z              
[14]  tGravityAcc_std_X                
[15]  tGravityAcc_std_Y                
[16]  tGravityAcc_std_Z                
[17]  tBodyAccJerk_mean_X            
[18]  tBodyAccJerk_mean_Y            
[19]  tBodyAccJerk_mean_Z            
[20]  tBodyAccJerk_std_X              
[21]  tBodyAccJerk_std_Y              
[22]  tBodyAccJerk_std_Z              
[23]  tBodyGyro_mean_X                  
[24]  tBodyGyro_mean_Y                  
[25]  tBodyGyro_mean_Z                  
[26]  tBodyGyro_std_X                    
[27]  tBodyGyro_std_Y                    
[28]  tBodyGyro_std_Z                    
[29]  tBodyGyroJerk_mean_X          
[30]  tBodyGyroJerk_mean_Y          
[31]  tBodyGyroJerk_mean_Z          
[32]  tBodyGyroJerk_std_X            
[33]  tBodyGyroJerk_std_Y            
[34]  tBodyGyroJerk_std_Z            
[35]  tBodyAccMag_mean                  
[36]  tBodyAccMag_std                    
[37]  tGravityAccMag_mean            
[38]  tGravityAccMag_std              
[39]  tBodyAccJerkMag_mean          
[40]  tBodyAccJerkMag_std            
[41]  tBodyGyroMag_mean                
[42]  tBodyGyroMag_std                  
[43]  tBodyGyroJerkMag_mean        
[44]  tBodyGyroJerkMag_std          
[45]  fBodyAcc_mean_X                    
[46]  fBodyAcc_mean_Y                    
[47]  fBodyAcc_mean_Z                    
[48]  fBodyAcc_std_X                      
[49]  fBodyAcc_std_Y                      
[50]  fBodyAcc_std_Z                      
[51]  fBodyAccJerk_mean_X            
[52]  fBodyAccJerk_mean_Y            
[53]  fBodyAccJerk_mean_Z            
[54]  fBodyAccJerk_std_X              
[55]  fBodyAccJerk_std_Y              
[56]  fBodyAccJerk_std_Z              
[57]  fBodyGyro_mean_X                  
[58]  fBodyGyro_mean_Y                  
[59]  fBodyGyro_mean_Z                  
[60]  fBodyGyro_std_X                    
[61]  fBodyGyro_std_Y                    
[62]  fBodyGyro_std_Z                    
[63]  fBodyAccMag_mean                  
[64]  fBodyAccMag_std                    
[65]  fBodyBodyAccJerkMag_mean  
[66]  fBodyBodyAccJerkMag_std    
[67]  fBodyBodyGyroMag_mean        
[68]  fBodyBodyGyroMag_std          
[69]  fBodyBodyGyroJerkMag_mean
[70]  fBodyBodyGyroJerkMag_std 
```