# Getting and cleaning data project
#
# The present script reads datasets (loaded from
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
# combines train and test datasets, select mean and std values
# and finaly creates a tidy dataset file (.txt) containing mean values
#
# set the path to txt files
dataPath<- "UCI HAR Dataset"
#
# get feature and activity labels
feature<- read.table(paste(dataPath, "/features.txt", sep=""))
activity<- read.table(paste(dataPath, "/activity_labels.txt", sep=""))
#
# function for reading data from datasets (X, Y, subject)
readData<- function(dataset) {
      print(paste("Reading data from:", dataset))
      #
      # reading activity from dataset and assigning activity labels
      filePath<- paste(dataPath,"/",dataset,"/Y_", dataset,".txt", sep="")
      print(filePath)
      Y<- read.table(filePath, col.names="activity")
      Y<- lapply(Y, function(i) activity[i,2])
      #
      # reading accelerometer from dataset and assigning feature labels
      filePath<- paste(dataPath,"/",dataset,"/X_", dataset,".txt", sep="")
      print(filePath)
      X<- read.table(filePath)
      names(X)<- feature[,2]
      #
      # reading subject from dataset
      filePath<- paste(dataPath,"/",dataset,"/subject_", dataset,".txt", sep="")
      print(filePath)
      subject<- read.table(filePath, col.names="subject")
      #
      #construct the table
      cbind(Y, subject, X)
}
#
# running analysis
#
# read test data
tableTest<- readData("test")
#read train data
tableTrain<- readData("train")
# merge test and train data
completeTable<- rbind(tableTest, tableTrain)
# select column of interest and reduce the table
selectCol<- c(1, 2, grep("mean\\(\\)|std\\(\\)", names(completeTable)))
selectTable<- completeTable[,selectCol]
#
# build and write tidy data
tidyData<- aggregate(.~activity+subject, selectTable, mean)
write.table(tidyData, file="tidyData.txt", row.names = FALSE)
print("the file 'tidyData.txt' has been created !")
#
# end of script