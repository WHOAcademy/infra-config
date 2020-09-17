import os

from azure.storage.blob import ContainerClient


container_client = ContainerClient.from_connection_string(conn_str=os.getenv('STORAGE_CONN_STR'),
                                                          container_name=os.getenv('STORAGE_CONTAINER_NAME'))

container_client.create_container()
