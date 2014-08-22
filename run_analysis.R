

##step 1
#########################################
    ##read test
test.X<-read.table("test/X_test.txt")
test.Y<-read.table("test/y_test.txt")
test.S<-read.table("test/subject_test.txt")

    ##read training
training.X<-read.table("train/X_train.txt")
training.Y<-read.table("train/y_train.txt")
training.S<-read.table("train/subject_train.txt")

    ##Merges the training and the test sets to create one data set.
data.1 <- rbind(cbind(test.S, test.Y, test.X),
              cbind(training.S, training.Y, training.X))


##step 2
#####################################
    ##read the features
features <- read.table("features.txt", strip.white=TRUE, stringsAsFactors=FALSE)
features.names<-features$V2
names(data.1)<-c("subject","activity",features.names) 

### only  features wih mean and sd
features.mean.sd <- features[grep("mean\\(\\)|std\\(\\)", features$V2), ]

##add names to all colun
features.mean.sd.names<-features.mean.sd$V2
data.mean.sd<-data.1[,c("subject","activity",features.mean.sd.names)]

##step 3
#####################################

activity<-read.table("activity_labels.txt", stringsAsFactors=FALSE)
data.mean.sd$activity <- activity[data.mean.sd$activity, 2]


##step 4 
#####################################


 ## oh yes, pardon  I have done it in step 2 and 3


##step 5
#####################################

data.each.average <- aggregate(data.mean.sd[, 3:ncol(data.mean.sd)],
                       by=list(subject = data.mean.sd$subject,
                               activity = data.mean.sd$activity),
                       mean)
## and for seeing
write.table(format(data.each.average, scientific=T), "tidydata.txt",
            row.names=F, col.names=T, quote=2)
