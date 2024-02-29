# Load necessary libraries
library(randomForest)
library(caret) # For data splitting and preprocessing

# Load the data
data <- read.csv("/opt/app-root/src/r-diabetes/data/diabetes.csv")

# Inspect the dataset structure
print(head(data))
print(colnames(data))

# Assuming 'Column9' is the placeholder for your actual target variable name
# Replace 'Column9' with the actual column name of the target variable
targetColumnName <- 'Outcome' # Adjust this to match your dataset

# Verify that the target variable contains at least two classes
print(table(data[[targetColumnName]]))

# Split the data into training and testing sets
set.seed(123) # For reproducibility
indexes <- createDataPartition(data[[targetColumnName]], p=0.75, list=FALSE)
trainData <- data[indexes, ]
testData <- data[-indexes, ]

# Train a Random Forest model
rfModel <- randomForest(as.formula(paste(targetColumnName, "~ .")), data=trainData, ntree=500, mtry=2, importance=TRUE)

# Model performance on the test set
predictions <- predict(rfModel, testData)
confusionMatrix <- confusionMatrix(predictions, testData[[targetColumnName]])
print(confusionMatrix)

# Importance of variables
varImpPlot(rfModel)
