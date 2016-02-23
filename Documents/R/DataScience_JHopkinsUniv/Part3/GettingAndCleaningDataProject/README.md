# Instruction for using run_analysis.R

The script `run_analysis.R` is used to manage data collected from the
accelerometers from the Samsung Galaxy S smartphone. A full description 
is available at the site where the data was obtained:
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>.

The data was obtained from 30 subject, and 6 activities:  
+ walking  
+ walking upstairs  
+ walking downstairs  
+ sitting  
+ standing  
+ laying  

## Load and save the datasets
Load the datasets at <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>.  

Unzip the dataset and save the directory "UCI HAR dataset" in your working directory.
The directory should contain:  
* **test** : sub-directory containing the dataset for the test subjects  
* **train** : sub-directory containing the dataset for the train subjects  
* **activity_labels.txt** : activity labels  
* **features.txt** : feature labels (561 variables)  
* **feature_info.txt** : details about features  
* **README.txt** : details about the dataset provided 

The two sub-directories **train** and **test** contain the files *X_dataset.txt*, 
*Y_dataset.txt* and *subject_dataset.txt* (*dataset* is 'train' or 'test').

## running `run_analysis.R` script
The whole dataset contains data from 30 subjects enrolled in either 'test' 
or 'train' study. The script creates first a complete data set containing
all the data, and then select specific data of interest.

Feature and activity labels are extracted respectively from
`feature.txt` and `activity_labels.txt`.

The `readData` function is in charge of:  
* reading activity number from *Y_dataset.txt* and assigning activity labels  
* reading accelerometer data from *X_dataset.txt* and assigning features labels  
* reading subject number from *subject_dataset.txt*  
Data from these 3 files are bind together to make a table (563 variables, 
the two first ones are the *activity labels* and *subject numbers*).

The script is build as following:  
1. extract data from *test* dataset, return `tableTest`  
2. extract data from *train* dataset, return `tableTrain`  
3. combine both to construct the complete data table `completeTable`  
4. select only 'mean' and 'std' variables, return `selectTable`  

From the data table thus obtain, mean values are calculated for each
('activity', 'subject') and the result is written in a new data table
by using `write.table` function. The output file created is `tidyData.txt`.
More detail is provided in the `codeBook.md` for this file.

## output from console
The console script output is as following:

```{r}
[1] "Reading data from: test"
[1] "UCI HAR Dataset/test/Y_test.txt"
[1] "UCI HAR Dataset/test/X_test.txt"
[1] "UCI HAR Dataset/test/subject_test.txt"
[1] "Reading data from: train"
[1] "UCI HAR Dataset/train/Y_train.txt"
[1] "UCI HAR Dataset/train/X_train.txt"
[1] "UCI HAR Dataset/train/subject_train.txt"
[1] "the file 'tidyData.txt' has been created !"
```

