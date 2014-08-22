tidydata
========

for cours project in getting and cleaning data in R

[step 1]()

##Merges the training and the test sets to create one data set##



**read test**

> test.X<-read.table("test/X_test.txt")

> test.Y<-read.table("test/y_test.txt")

> test.S<-read.table("test/subject_test.txt")

**read training**

> training.X<-read.table("train/X_train.txt")

> training.Y<-read.table("train/y_train.txt")

> training.S<-read.table("train/subject_train.txt")


**make data by column , and by row**

> data.1<- rbind(cbind(test.S, test.Y, test.X),
>   cbind(training.S, training.Y, training.X))


[step 2]()

## Extracts only the measurements on the mean and standard deviation for each measurement##
              
**use egular expressixon function to find word with mean and sd in second value of features.**

?grep
see code

[step 3]()

##Uses descriptive activity names to name the acti vity in the data set##
**see code**

[step 4]()

##Appropriately labels the data set with descriptive variable names.##
 **for me I do  step 3 and 4 at once.**
 see code
 
 
[step 5]()


##Creates a second, independent tidy data set with the average of each variable for each activity and each subject.##
