subtest=read.table("UCI HAR Dataset/test/subject_test.txt")
xtest=read.table("UCI HAR Dataset/test/X_test.txt")
ytest=read.table("UCI HAR Dataset/test/y_test.txt")
subtrain=read.table("UCI HAR Dataset/train/subject_train.txt")
xtrain=read.table("UCI HAR Dataset/train/X_train.txt")
ytrain=read.table("UCI HAR Dataset/train/y_train.txt")
features=read.table("UCI HAR Dataset/features.txt")
activities <- read.table("UCI HAR Dataset/activity_labels.txt")

xall <- rbind(xtrain, xtest)
yall <- rbind(ytrain, ytest)
suball <- rbind(subtrain, subtest)
allofit <- cbind(suball, yall, xall)

featureNames <- as.character(features[,2])
newCols <- c("subject", "activity", featureNames)
colnames(allofit) <- newCols

onlyMeans <- grep("mean()", colnames(allofit))
onlyStDevs <- grep("std()", colnames(allofit))
revisedColumns <- c(onlyMeans, onlyStDevs)
revisedColumns2 <- sort(revisedColumns) 
newDataFrame <- allofit[, c(1,2,revisedColumns2)]
newDataFrame2 <- newDataFrame[, !grepl("Freq", colnames(newDataFrame))] #get rid of the meanFreq columns

rm(newDataFrame, allofit)  # more housecleaning, those data frames are taking up a lot of space/RAM

tidyframe <- data.frame()
for (i in 1:30) {
        subj<- subset(newDataFrame2,subject==i)
        for (j in 1:6){
                actv<- subset(subj, activity==j)
                myresult<-as.vector(apply(actv,2,mean))
                tidyframe<-rbind(tidyframe,myresult) 
        }
        
}

colnames(tidyframe)<-colnames(newDataFrame2)
levels(tidyframe[,2])<-c('walk','upstairswalk','downstairswalk', 'sit','stand', 'lay')
write.table(tidyframe, "Samsung_Data.txt", sep = "")
