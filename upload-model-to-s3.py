import os
import boto3

source_path = "model.onnx"
s3_destination_path = "models/model.onnx"

key_id = os.getenv("AWS_ACCESS_KEY_ID")
secret_key = os.getenv("AWS_SECRET_ACCESS_KEY")
endpoint = os.getenv("AWS_S3_ENDPOINT")
bucket_name = os.getenv("AWS_S3_BUCKET")

s3 = boto3.client(
   "s3",
   aws_access_key_id=key_id,
   aws_secret_access_key=secret_key,
   endpoint_url=endpoint,
   use_ssl=True)

s3.upload_file(source_path, bucket_name, Key=s3_destination_path)
