
# Loading testing data
submission <- readHARdataset( "testing")

# Predicting answers
answers  <-  predict(rfModel, submission[,mainFeatures])

#Creating files for submission
pml_write_files = function(x){
     n = length(x)
     for(i in 1:n){
          filename = paste0("./Submission/problem_id_",i,".txt")
          write.table(x[i],file=filename,quote=FALSE,row.names=FALSE,col.names=FALSE)
     }
}
 
pml_write_files(answers)