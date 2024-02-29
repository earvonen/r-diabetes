# Load necessary libraries
library(keras)
library(readr) # For reading CSV files
library(caret) # For data splitting

# Set the path to the CSV file
filePath <- "/mnt/data/diabetes.csv"

# Load the data
data <- read_csv(filePath)

# Split the data into features and target
features <- data[, -ncol(data)] # Assuming the last column is the target
target <- data[, ncol(data)]

# Normalize the features
features <- scale(features)

# Split data into training and testing sets
set.seed(123) # For reproducibility
indexes <- createDataPartition(target, p = 0.8, list = FALSE)
trainFeatures <- features[indexes, ]
testFeatures <- features[-indexes, ]
trainTarget <- target[indexes]
testTarget <- target[-indexes]

# Convert targets to categorical
trainTarget <- to_categorical(trainTarget)
testTarget <- to_categorical(testTarget)

# Define the model
model <- keras_model_sequential() %>%
  layer_dense(units = 16, activation = 'relu', input_shape = dim(trainFeatures)[2]) %>%
  layer_dropout(rate = 0.5) %>%
  layer_dense(units = 8, activation = 'relu') %>%
  layer_dropout(rate = 0.5) %>%
  layer_dense(units = 2, activation = 'softmax')

# Compile the model
model %>% compile(
  loss = 'categorical_crossentropy',
  optimizer = optimizer_rmsprop(),
  metrics = 'accuracy'
)

# Train the model
history <- model %>% fit(
  trainFeatures,
  trainTarget,
  epochs = 100,
  batch_size = 32,
  validation_split = 0.2
)

# Evaluate the model
model %>% evaluate(testFeatures, testTarget)
