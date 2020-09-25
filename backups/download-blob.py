#!/usr/bin/env python
import os
from azure.storage.blob import BlobClient

blob = BlobClient.from_connection_string(conn_str=os.getenv('STORAGE_CONN_STR'), container_name=os.getenv('STORAGE_CONTAINER_NAME'), blob_name=os.getenv('BACKUP_NAME'))

with open(os.getenv('BACKUP_NAME'), "wb") as my_blob:
    blob_data = blob.download_blob()
    blob_data.readinto(my_blob)
