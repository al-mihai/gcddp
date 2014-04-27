#!/usr/bin/env Rscript

print("Loading features.txt, activity_labels.txt ...")
features<-read.table("features.txt", colClasses<-c("numeric","character"), header=FALSE, sep="")
activities<-read.table("activity_labels.txt")
names(features)<-c("id","name")
names(activities)<-c("id","name")
featureNames<-as.character(features[,2])
activitiesNames<-as.character(activities[,2])

print("Loading train data ...")
trainSet<-read.table("train/X_train.txt")
trainLabels<-read.table("train/y_train.txt")
trainSubjects<-read.table("train/subject_train.txt")

print("Loading test data ...")
testSet<-read.table("test/X_test.txt")
testLabels<-read.table("test/y_test.txt")
testSubjects<-read.table("test/subject_test.txt")

print("Create full data set as train and test datasets merged ...")
fullSet<-rbind(trainSet, testSet)
print("Create full Subjects.")
fullSubjects<-rbind(trainSubjects, testSubjects)
names(fullSubjects)<-c("subjects")
print("Create full Activities Labels.")
fullActivitiesLabels<-rbind(trainLabels, testLabels)

#add column names to the full set
names(fullSet)<-featureNames
print("Selecting only the mean and std related features ...")
meanParams<-featureNames[grepl("mean()", featureNames, fixed=TRUE)]
stdParams<-featureNames[grepl("std()", featureNames, fixed=TRUE)]
keepParams<-c(meanParams,stdParams)

print("Reducing the full dataset to only the demaded columns ...")
fullSet <- subset(fullSet, select = keepParams)

fullActivities<-as.numeric(unlist(fullActivitiesLabels))

print("Adding Activities and Subjects to the full data set ...")
fullActivitiesNames<-activitiesNames[fullActivities]
fullSet <- cbind(fullActivitiesNames, fullSet)
fullSet <- cbind(fullSubjects, fullSet)

print("Computing the result ...")
library(data.table)
dt<-data.table(fullSet)
dtcol<-names(dt)
keys<-dtcol[3:68]
result<-dt[, lapply(.SD, mean), by=list(fullSet$subjects, fullSet$fullActivitiesNames), .SDcols=keys]
print("Result size:")
dim(result)
resultNames<-c("subjects", "activities", keepParams)
setnames(result, resultNames)
print("Writing RESULT.txt file ...")
write.table(result, "RESULT.txt")
print("... Done!")