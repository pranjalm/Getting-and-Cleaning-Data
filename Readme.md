Workflow of Assignment is underwritten.
1. Check if HAR data is present in working directory else change it.
2. Download and unzip data files
3. Reading all required data from training and testing sets.
4. Assign Proper names to Activites according to their numbers.
5. Assign column names to  "activity" , "subject" and test and train data frames.
6. Join activity subject and readings for test and train data.
7. Now both test and train data are merged wrt column names.
8. Select data for mean and standard deviation readings.
9. Aggregate data for mean wrt activity and subject. 
10. Write a text file of our final tidy data.

Underwritten are explanations of Rdata used in analysis.

"actvty_test" - activity list of test subjects.
"actvty_train" - activity list of training subjects.
"x_test" - initial experimental data of test subject.
"x_train" - initial experimental data of training subject.
"trn_sub" - list of training subjects.
"tst_sub" - list of testing subjects. 
"feat" - string names of activities. 
"mean_std_data" - data for only mean and standard deviation.
"mrg_trn_tst" - merged data of traing and testing sets.
"temp" - temporary file used to download data.       
"test_data" - final experimental data of test subject.
"train_data" - final experimental data of training subject.
"tidy_data" - final tidy data averaged wrt activity and subject.
      
