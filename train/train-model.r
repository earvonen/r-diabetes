# Load necessary libraries
library(randomForest)
library(caret) # For data splitting and preprocessing

# Load the data
data <- read.csv("../data/diabetes.csv")

# Split the data into training and testing sets
set.seed(123) # For reproducibility
indexes <- createDataPartition(data$Column9, p=0.75, list=FALSE)
trainData <- data[indexes, ]
testData <- data[-indexes, ]

# Train a Random Forest model
# Assuming the 9th column is the target variable and the first 8 columns are predictors
rfModel <- randomForest(Column9 ~ ., data=trainData, ntree=500, mtry=2, importance=TRUE)

# Model performance on the test set
predictions <- predict(rfModel, testData)
confusionMatrix <- confusionMatrix(predictions, testData$Column9)
print(confusionMatrix)

# Importance of variables
varImpPlot(rfModel)
