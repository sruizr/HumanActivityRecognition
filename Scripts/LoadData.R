#Chunk 1

downloadDataset <- function(URL="", destFile="data.csv"){
# Function to download the csv file with th data
     if(!file.exists(destFile)){
          download.file(URL, destFile, method="curl")
     }else{
          message("Dataset already downloaded. Download is cancelled")
     }
}

readHARdataset  <- function(dataType = ""){
     URLfile  <- paste0("https://d396qusza40orc.cloudfront.net/predmachlearn/pml-", dataType, ".csv")
     destFile  <- paste0("./RawData/", dataType, ".csv")
     downloadDataset(URLfile, destFile)
     read.csv(destFile, header = TRUE, na.strings = c("NA", "", "#DIV/0!"))
}

library(caret)

HRdata  <- readHARdataset("training")
set.seed(1234)
train  <- createDataPartition(HRdata$classe, p=0.6, list = FALSE)
training  <- HRdata[train, ]
testing  <- HRdata[-train, ]