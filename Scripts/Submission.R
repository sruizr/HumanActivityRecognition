
# Loading testing data
testingFile  <- "./RawData/testing.csv"
testingURL <-"https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv"
downloadDataset(testingURL, testingFile) # function defined on LoadTrainingData.R
testing <- read.csv( "./RawData/testing.csv", stringsAsFactors = FALSE)

# Predicting answers
testing <- preprocess(testing)
answers  <-  predict(randomForest, testing)

#Creating files for submission
pml_write_files = function(x){
     n = length(x)
     for(i in 1:n){
          filename = paste0("./Submission/problem_id_",i,".txt")
          write.table(x[i],file=filename,quote=FALSE,row.names=FALSE,col.names=FALSE)
     }
}
 
pml_write_files(answers)