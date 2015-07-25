downloadDataset <- function(URL="", destFile="data.csv"){
# Function to download the csv file with th data
     if(!file.exists(destFile)){
          download.file(URL, destFile, method="curl")
     }else{
          message("Dataset already downloaded. Download is cancelled")
     }
}

trainingURL<-"https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv"
trainingFile  <- "./RawData/training.csv"
downloadDataset(trainingURL, trainingFile)
training <- read.csv("./RawData/training.csv", stringsAsFactors = FALSE)

