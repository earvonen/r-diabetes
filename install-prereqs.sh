r install-prereqs.r

/usr/bin/python3.9 -m venv ~/.virtualenvs/r-reticulate
source ~/.virtualenvs/r-reticulate/bin/activate
pip install --upgrade pip
pip install tensorflow keras
pip install tf2onnx

echo "Prereqs installed!"
