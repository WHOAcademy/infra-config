import os

from azure.storage.blob import BlobClient

source_file=os.getenv('SOURCE_FILE')
blob = BlobClient.from_connection_string(conn_str=os.getenv('STORAGE_CONN_STR'),
                                         container_name=os.getenv('STORAGE_CONTAINER_NAME'),
                                         blob_name=source_file)

with open(source_file, "rb") as data:
    blob.upload_blob(data)
