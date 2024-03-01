# Load the Keras library
library(keras)

# Path to your saved model
model_path <- "./diabetes.h5"

# Load the model
model <- load_model_hdf5(model_path)


# Example values for the 8 features
feature_values <- c(1,85,66,29,0,26.6,0.351,31)

# Create a dataframe with these values
new_data <- data.frame(t(feature_values))
colnames(new_data) <- c("Pregnancies","Glucose","BloodPressure","SkinThickness","Insulin","BMI","DiabetesPedigreeFunction","Age")

# Print the new_data dataframe
print(new_data)
# Assuming new_data is a dataframe of new instances you want to predict
# Convert new_data to a matrix format
new_data_matrix <- data.matrix(new_data)

# Normalize the features if your model was trained on normalized data
new_data_normalized <- scale(new_data_matrix)

predictions <- model %>% predict(new_data_normalized)

predicted_classes <- ifelse(predictions > 0.5, 1, 0)
print(predicted_classes)
