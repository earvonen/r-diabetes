r install-prereqs.r

pip install tensowflow
pip install boto3

/usr/bin/python3.9 -m venv ~/.virtualenvs/r-reticulate
source ~/.virtualenvs/r-reticulate/bin/activate
pip install --upgrade pip
pip install tensorflow keras
pip install tf2onnx

echo "Prereqs installed!"
