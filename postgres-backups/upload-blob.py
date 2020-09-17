import os

from azure.storage.blob import BlobClient


blob = BlobClient.from_connection_string(conn_str=os.getenv('STORAGE_CONN_STR'),
                                         container_name=os.getenv('STORAGE_CONTAINER_NAME'),
                                         blob_name="my_folder/my_file")

with open("./my_file.txt", "rb") as data:
    blob.upload_blob(data)
