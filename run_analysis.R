## I am going to make this code a little more verbose than I normally would
## The reason for this is simply readability.  I don't want you to have to
## decypher my code just to grade it.

## So, I am going to write this like a script, Basically a real life sinaro.
## Mostly on the job you will not create a complex application to clean a specific 
## data set. This is a one-off, down and dirty clean this data script.

## The only differance is that I am going to include the project requirement as an
## indecator of each step in the process.  And, add a lot more commenting than I 
## normally would in such a case.

## I am also going to write this in the order of the instructions.

## Data Locations

## These are the absolute paths to the data files.

  TraningFiles <- "train/"
  TestingFiles <- "test/"


## Let's load some libraries and set our working path to the script location.
## Remember, this is all reletive to my hard drive

  library(sqldf)

## I like to init my vars 
## Later these will become Data.Frames, also the variables TrainingData and TestingData will
## be cleared after the merge.
  TrainingData <- NULL
  TestingData <- NULL
  CleanData <- NULL


## Load in the data. Like I said, verbose :)
## The .x and .y on TrainingData and TestingData holds temporary data.

## At the point this executes, the environment will have the following:
## TrainingData.x 7352 obs. of 561 variables
## TrainingData.y 7532 obs. of 1 variables
## TrainingData NULL (empty) 

## TestingData.x 2947 obs. of 561 variables
## TestingData.y 2947 obs. of 1 variables
## TestingData NULL (empty) 

## There will be a total of 1122 columns of data

## P.S. This is a memory hog, I will null this data out after the merge

  TrainingData.x <- read.table(paste(TraningFiles,"X_train.txt",sep=""))
  TrainingData.y <- read.table(paste(TraningFiles,"y_train.txt",sep=""))
  TrainingData.subjects <- read.table(paste(TraningFiles,"subject_train.txt",sep=""))
  
  TestingData.x <- read.table(paste(TestingFiles,"X_test.txt",sep=""))
  TestingData.y <- read.table(paste(TestingFiles,"y_test.txt",sep=""))
  TestingData.subjects <- read.table(paste(TestingFiles,"subject_test.txt",sep=""))
  
  # Here I am going to load the extra data needed to apply columnn names and what not.
  
  # The complete list of variables of each feature vector is available in 'features.txt'
  FeatureVars <- read.table("features.txt")
  
## Read in the Activity Labels.
  ActivityLabels <- read.table("activity_labels.txt")

## Create Activity tables

  TestingData.Activity <- sqldf("select t.v1 as ActivityCode,ActivityLabels.v2 as Activity, 'test' as Datatype from `TestingData.y` as t inner join ActivityLabels on t.v1 = ActivityLabels.v1")
  TrainingData.Activity <- sqldf("select t.v1 as ActivityCode,ActivityLabels.v2 as Activity, 'train' as Datatype from `TrainingData.y` as t inner join ActivityLabels on t.v1 = ActivityLabels.v1")


## There are 561 feature lables, they will be applied to both the training and test (.x) data sets.
  names(TrainingData.x) <- FeatureVars[,2]
  names(TestingData.x) <- FeatureVars[,2]
  names(TrainingData.subjects) <- c("Subject")
  names(TestingData.subjects) <- c("Subject")

## Reduce the data sets to Mean and STD only
  TestingData.x <- TestingData.x[,grep("mean\\(\\)|std\\(\\)", FeatureVars[,2])]
  TrainingData.x <- TrainingData.x[,grep("mean\\(\\)|std\\(\\)", FeatureVars[,2])]

 
##1.Merges the training and the test sets to create one data set.
## Merge data in the order described.

  TestingData.x <- cbind(TestingData.Activity,TestingData.x)
  TestingData.x <- cbind(TestingData.subjects,TestingData.x)
  
  TrainingData.x <- cbind(TrainingData.Activity,TrainingData.x)
  TrainingData.x <- cbind(TrainingData.subjects,TrainingData.x)
  
  CleanData <- rbind(TrainingData.x,TestingData.x)

## NULL out unessessary data to release memory.
  TrainingData.x <- NULL
  TestingData.x <- NULL
  TrainingData.y <- NULL
  TestingData.y <- NULL
  TrainingData.subjects <- NULL
  TestingData.subjects <- NULL
  TrainingData.Activity <- NULL
  TestingData.Activity <- NULL
  ActivityLabels <- NULL
  FeatureVars <- NULL


##2.Extracts only the measurements on the mean and standard deviation for each measurement.

## This was already done in the table reduction setp before the merge


##3.Uses descriptive activity names to name the activities in the data set

## Completed in the Data Prep phase.

##4.Appropriately labels the data set with descriptive activity names. 

## Just removing unwanted characters and replacing - with _
## This make the column names compatible with MySQL
  
  names(CleanData) <- gsub("\\(|\\)", "", names(CleanData))
  names(CleanData) <- gsub("\\-", "_", names(CleanData))
  Columns <- names(CleanData)


##5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Creating the select list for sqldf
  
  SelectList <- NULL
  for (i in 5:70) {
    SelectList <- paste(SelectList,", avg(",Columns[i],") as ",Columns[i], sep="")
  }
  
## I am using sqldf to create the tidy data set.  
  TidyDataSet <- fn$sqldf("select Subject,ActivityCode,Activity $SelectList from CleanData group by subject, activity order by subject, ActivityCode")

## Clear Memory
  Columns <- NULL
  SelectList <- NULL

## Write out the Clean and Tidy data sets
  write.table(CleanData,"cleandata.csv",sep=",",col.names=TRUE)
  write.table(TidyDataSet,"TidyDataSet.csv",sep=",",col.names=TRUE)


