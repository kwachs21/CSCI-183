setwd("C:/Users/Emily/Desktop/Documents/_Spring 2015/cs183/kaggle3")

# trainData <- read.csv("train.csv", header = TRUE, stringsAsFactors = FALSE)
# testData <- read.csv("test.csv", header = TRUE, stringsAsFactors = FALSE)

# for (i in 1:nrow(trainData)){
#   trainData$count1[i]<- gsub('\\[','',trainData$POLYLINE[i])
#   trainData$count2[i]<-nchar(trainData$POLYLINE[i])-nchar(trainData$count1[i])
#   trainData$total[i] <- (trainData$count2[i] - 1)*15
# }

classifier_1 <-lm(total ~ CALL_TYPE + TAXI_ID, data=trainData)
# summary(classifier_1)

#CALL_TYPE + TAXI_ID

for (i in 1:nrow(testData)){
  testData$count1[i]<- gsub('\\[','',testData$POLYLINE[i])
  testData$count2[i]<-nchar(testData$POLYLINE[i])-nchar(testData$count1[i])
  testData$total[i] <- (testData$count2[i] - 1)*15
}

testData$total2 <- predict(classifier_1, newdata=testData, type="response") 

for (i in 1:nrow(testData)){
  testData$total3[i] <- testData$total[i] + testData$total2[i]
}

# + TAXI_ID + TIMESTAMP + DAY_TYPE

taxi.sub <- cbind(testData$TRIP_ID,testData$total3)
colnames(taxi.sub) <- c("TRIP_ID", "TRAVEL_TIME")
write.csv(taxi.sub, file = "taxi6_4.csv", row.names = FALSE)
