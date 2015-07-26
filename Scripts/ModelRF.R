# Chunk 1

model <- train(classe ~ ., data = training, method = "rf", prox = TRUE, 
               trControl = trainControl(method = "cv", number = 4, allowParallel = TRUE))
