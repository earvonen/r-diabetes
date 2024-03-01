# Load necessary libraries
library(reticulate)
use_python("/usr/bin/python3.9", required=TRUE)
use_virtualenv("~/.virtualenvs/r-reticulate", required = TRUE)
library(keras)
library(readr) # For reading CSV files



# Set the path to the CSV file
filePath <- "/opt/app-root/src/r-diabetes/data/diabetes.csv"

# Load the data
data <- read_csv(filePath)

# Convert data to a matrix format for Keras
data_matrix <- data.matrix(data)

# Assuming the last column is the target variable and the rest are features
features <- data_matrix[, -ncol(data_matrix)]
target <- data_matrix[, ncol(data_matrix)]

# Normalize the features
#features <- scale(features)

# Split data into training and testing sets
set.seed(123) # For reproducibility
sample_size <- floor(0.8 * nrow(data_matrix))
train_indices <- sample(seq_len(nrow(data_matrix)), size = sample_size)

trainFeatures <- features[train_indices, ]
testFeatures <- features[-train_indices, ]
trainTarget <- target[train_indices]
testTarget <- target[-train_indices]

print(length(trainTarget))
print(length(testTarget))
print(testFeatures[1, ])

# Convert targets to categorical
trainTarget <- to_categorical(trainTarget - 1) # Subtract 1 to make classes start at 0
testTarget <- to_categorical(testTarget - 1)

# Define the model
#model <- keras_model_sequential() %>%
#  layer_dense(units = 16, activation = 'relu', input_shape = dim(trainFeatures)[2]) %>%
#  layer_dropout(rate = 0.5) %>%
#  layer_dense(units = 8, activation = 'relu') %>%
#  layer_dropout(rate = 0.5) %>%
#  layer_dense(units = 2, activation = 'softmax')

model <- keras_model_sequential() %>%
  layer_dense(units = 8 , activation = 'relu', input_shape = c(8)) %>%
  # Add other layers as necessary
  layer_dense(units = 1, activation = 'sigmoid')  # Output layer for binary classification


# Compile the model
#model %>% compile(
#  loss = 'categorical_crossentropy',
#  optimizer = optimizer_rmsprop(),
#  metrics = 'accuracy'
#)

model %>% compile(
  optimizer = 'adam',
  loss = 'binary_crossentropy',
  metrics = c('accuracy')
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
evaluation <- model %>% evaluate(testFeatures, testTarget)
print(evaluation)

# Save your model
save_model_hdf5(model, "./diabetes.h5")
