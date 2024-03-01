from tensorflow.keras.models import load_model

# Load the Keras model from the HDF5 file
model = load_model('diabetes.h5')

# Define the path to save the TensorFlow SavedModel
saved_model_dir = './diabetes'

# Save the model in TensorFlow SavedModel format
model.save(saved_model_dir, save_format='tf')
