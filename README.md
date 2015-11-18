SCOPE:

Script to produce tidy data set for Data Science week 3 project.

ASSUMPTIONS:

Data to be in default directory. Assume downloaded downloaded files have retained folder structure (data set has been unzipped to working directory but no other manipulation).

CODE:

Function Name: run_analysis
Function Input: Function has no input parameters as given that data set will be in working directory and no user defined functions required.
Function Returns: None
Function Output: Tidy data set as summary_data containing;
	: subject (numeric reference)
	: activity (text description)
	: average (numeric average of acceleration data for 				observation) 
Summary: reads subject, activity and acceleration data from known file structure and file names. Creates  combined data table with named columns for each subject and activity and calculates SD and mean for each observation.
Creates second data table with mean for each subject and activity and writes to a text file.

Function steps:

1/ reads data into R so it can be manipulated. Six data files have been provided, these are cleaned up data from the inertial data so inertial data not inculded (ref also course Forum responses)  Maintains file names as variable names for raw data;
	subject_test
	x_test
	y_test
	subject_train
	x_train
	y_train
also reads activity_labels into a table.

2/ from the dataset readme;
	subject identifies the subject for each test
	x is the training data for each test
	y is the test label for each test

3/ only need mean and SD for each row, so calculates vectors for each from x_test / x_train (NA is removed for all calculations)

4/ combines the observation data into one table with 4 columns (subject, activity, accelaration mean and acceleration SD) for training and test data sets. Names the columns (subject, activity, average and standardD)

We now have a single data set with only the mean and SD for each observation (requirements step 1 and 2) with descriptive variable names (requirement step 4)

5/ requirement is for activities to be descriptive, so numbers are replaced with text from activity_lablels

We now have descriptive activity names (requirement step 3) 
acceleration_data meets the requirements specification parts 1 thru 4

6/ creates table summary_data with only mean for each activity for each subject, column names set to reflect parent (subject, activity, average)

We now have a second data set which meets the requirements specification part 5

7/ writes a copy of summary_data table to tidy_data.txt to meet upload requirements