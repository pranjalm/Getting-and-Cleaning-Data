# Check if HAR data is present in working directory else change it.
dir()
setwd("/home/pranjal/Downloads")

# Download and unzip data files

temp <- tempfile()
download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              temp)
unz(temp,"UCI HAR Dataset")

# Reading all required data from training and testing sets.

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")

actvty_test <- read.table("UCI HAR Dataset/test/y_test.txt")
actvty_train <- read.table("UCI HAR Dataset/train/y_train.txt")

tst_sub <- read.table("UCI HAR Dataset/test/subject_test.txt")
trn_sub <- read.table("UCI HAR Dataset/train/subject_train.txt")

feat <- read.table("UCI HAR Dataset/features.txt" )

# Assign Proper names to Activites according to their numbers.

map = setNames(c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"),
               c(1,2,3,4,5,6))
actvty_test <- data.frame(map[unlist(actvty_test)])
actvty_train <- data.frame(map[unlist(actvty_train)])

# Assign column names to  "activity" , "subject" and test and train data frames.

colnames(actvty_test) <- colnames(actvty_train) <- "activity"
colnames(tst_sub) <- colnames(trn_sub) <- "subject"
names(x_test) <- names(x_train) <- feat[,2]

# Join activity subject and readings for test and train data.

test_data <- cbind(actvty_test,tst_sub,x_test) 
train_data <- cbind(actvty_train,trn_sub,x_train)

# Now both test and train data are merged wrt column names.

mrg_trn_tst <- rbind(test_data,train_data)

# Select data for mean and standard deviation readings.

mean_std_data <- mrg_trn_tst[ , (names(mrg_trn_tst) %in% c("activity","subject")) | (grepl("mean|std",names(mrg_trn_tst)))]

# Aggregate data for mean wrt activity and subject. 

tidy_data <- aggregate(.~(activity+subject),data = mean_std_data,mean)

# Write a text file of our final tidy data.
write.table(tidy_data,"get_data.txt",row.name=FALSE)
