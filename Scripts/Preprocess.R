getFeatures  <- function(data) {
# Return a logical array with all active features for modelling HAR
# Input shall be the training set
     
     featureNames  <- names(data)
    
     # Remove outcome
     features  <- !(featureNames %in% "classe")
     
     # Remove features with non-sense in the model
     # X: sequential number
     # user_name: We want to have a general model for all users..
     # raw_timestamp_part_1 : the model doesn't depends on time
     # raw_timestamp_part_2: the model doesn't depends on time
     # cvtd_timestamp: the model doesn't depends on time
     nonSenseFeatures  <- c("X", "user_name", "raw_timestamp_part_1",
                              "raw_timestamp_part_2", "cvtd_timestamp")
     features  <-  features & !(featureNames %in% nonSenseFeatures)
     message("5 non-sense features has been removed")
     
     # Remove features with more than 95% with NAs
     rowCounts  <- nrow(data)
     NAcounts  <- colSums(is.na(data))
     NAfeatures  <- NAcounts > 0.95*rowCounts
     message(paste(sum(NAfeatures),"columns has more than 95% with NAs"))
     features  <- features & !NAfeatures
     
     # Remove features with Zero varianze
     nz  <- nearZeroVar(data, saveMetrics = TRUE)$nzv
     message(paste(sum(nz),"columns are near to zero value"))
     features  <- features & !nz
     
    
     # Remove correlated features 
     data  <- data[,features]
     newFeatureNames  <- names(data)
     correlatedFeatures  <-  findCorrelation(cor(data), cutoff = 0.90)
     message(length(correlatedFeatures), " features have high correlation to others")
     features  <- features & !(featureNames %in% newFeatureNames[correlatedFeatures])
     
     features
}

filter  <- getFeatures(training)
filter[160]  <- TRUE #Added outcome
training  <- training[filter]

