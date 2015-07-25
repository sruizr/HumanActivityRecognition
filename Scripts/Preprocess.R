downloadDataset <- function(URL="", destFile="data.csv"){
     if(!file.exists(destFile)){
          download.file(URL, destFile, method="curl")
     }else{
          message("Dataset already downloaded. Download is cancelled")
     }
}

trainingURL<-"https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv"
testingURL <-"https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv"

trainingFile  <- "./RawData/training.csv"
testingFile  <- "./RawData/testing.csv"

downloadDataset(trainingURL, trainingFile)
downloadDataset(testingURL, testingFile)

training <- read.csv("./RawData/training.csv", stringsAsFactors = FALSE)
testing <- read.csv( "./RawData/testing.csv", stringsAsFactors = FALSE)

