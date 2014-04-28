Getting and Cleaning Data Project
==

run_analysis.R
---

### Program functions:

Run analysis uses the Human Activity Recognition Using Smartphones Data Set, collected from the UCI Machine Learning Repository.

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The program extracts the Mean and Standard Deviation from the "Training" and "Testing" datasets and combines them along with the supporting data: Activities and Subjects to create a single data set.

The program then creates a second data set, aka, a Tidy data set which contains the averages of the initial data.

After creating a clean version of the original data and then a tidy version of the clean data, the program writes two tables to the hard drive.

Created files: cleandata.csv and TidyDataSet.csv

These files are created in the current working directory.

Please refer to the code book for further data information.

### Run Analysis program usage:

#### Prerequsets

You must have R installed on your system before you can run the program.
The R language can be found here: http://www.r-project.org/index.html

You must also have the **sqldf package** installed.
The sqldf package can be installed in RStudio by selecting Tools->Install Packages.
Information on sqldf can be found here: http://cran.r-project.org/web/packages/sqldf/index.html

You must have the UCI HAR Dataset loaded on your computer.
The UCI HAR Dataset my be downloaded from the following URL: 
http://archive.ics.uci.edu/ml/machine-learning-databases/00240/


#### Working directory.
For the program to function, you must have the working directory set to the **UCI HAR Dataset** folder on your computer.

The program will not function otherwise.


#### Usage.

Download the file: **run_analysis.R** from this repository and load it into RStudio.

Set your working directory to the **UCI HAR Dataset**
Make sure you can see the testing and training folders in this directory.

If the program is loaded in the editor, you may do one of the following actions to execute it:

* Check the "**Source on save**" checkbox next to the save icon and simply save the file.
* Press: **Ctrl+Shift+S** to source the program
* Type **source('run_analysis.R')** into the console window and press enter.

The program should take several minutes to execute.

If an error occurs, please recheck you environment:
* Make sure sqldf and it's supporting packages are installed. 
* Make sure the UCI HAR Dataset is loaded on your computer
* Make sure the UCI HAR Dataset is your current working directory


Every effort has been made to ensure the program will function properly in RStudio.
If there is an unforeseen issue with running this program, please attempt to resolve it before grading the project.

Thank You





