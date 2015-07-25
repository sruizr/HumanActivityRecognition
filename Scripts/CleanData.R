cleanHARdata  <- function(HARdata){
#Clean data: remove NAs columns & correct columns to suitable classes
     
     # Change outcome (classe) to a readable factor
     if ( "classe" %in% names(HARdata)) {
          HARdata$classe  <-  as.factor(HARdata$classe)
          levels(training$classe)  <- 
               c("sitting-down", "standing-up", "standing", "walking", "sitting")  
     } 
     
     
     
     # Remove columns with more than 95% with NAs
     
     
     
     
}