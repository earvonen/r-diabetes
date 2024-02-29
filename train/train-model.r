# Load necessary libraries
library(randomForest)
library(caret) # For data splitting and preprocessing

# Set the path to the CSV file
filePath <- "/opt/app-root/src/r-diabetes/data/diabetes.csv"

# Load the data
data <- read.csv(filePath)

# Convert 'Outcome' to a factor with explicit levels
data$Outcome <- factor(data$Outcome, levels = unique(data$Outcome))

# Split the data into training and testing sets
set.seed(123) # For reproducibility
indexes <- createDataPartition(data$Outcome, p=0.75, list=FALSE)
trainData <- data[indexes, ]
testData <- data[-indexes, ]

# Ensure the target variable has the same factor levels in both sets
trainData$Outcome <- factor(trainData$Outcome, levels = levels(data$Outcome))
testData$Outcome <- factor(testData$Outcome, levels = levels(data$Outcome))

# Train a Random Forest model
rfModel <- randomForest(Outcome ~ ., data=trainData, ntree=500, mtry=2, importance=TRUE)

# Predictions
predictions <- predict(rfModel, testData)

# Ensure predictions are factors with the same levels as the target variable
predictions <- factor(predictions, levels = levels(testData$Outcome))

# Evaluate model performance
confusionMatrix <- confusionMatrix(predictions, testData$Outcome)
print(confusionMatrix)

# Importance of variables
varImpPlot(rfModel)
