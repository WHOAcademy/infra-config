#!/bin/bash
DATESTAMP=$(date +%d-%m-%Y)

pg_dump -U $POSTGRESQL_USER -d $POSTGRESQL_DATABASE -h $POSTGRESQL_SVC_HOSTNAME > /tmp/${BACKUP_NAME}.sql

gzip -N -9 /tmp/${BACKUP_NAME}_${DATESTAMP}.sql

openssl enc -aes-256-cbc -in /tmp/${BACKUP_NAME}_${DATESTAMP}.sql -out /tmp/${BACKUP_NAME}_${DATESTAMP}.sql.aes256cbc -salt -pass pass:$ENCRYPT_PASSWORD

pip install -r /opt/backup/py-requirements.txt

export SOURCE_FILE="/tmp/${BACKUP_NAME}_${DATESTAMP}.sql.aes256cbc"

python /opt/backup/upload-blob.py
