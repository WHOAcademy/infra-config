#!/bin/bash
set -e
DATESTAMP=$(date +%d-%m-%Y)

pg_dump -U $POSTGRESQL_USER -d $POSTGRESQL_DATABASE -h $POSTGRESQL_SVC_HOSTNAME > /tmp/${BACKUP_NAME}.sql

gzip -N -9 /tmp/${BACKUP_NAME}.sql

7za a /tmp/${BACKUP_NAME}_${DATESTAMP}.sql.gz.7z /tmp/${BACKUP_NAME}.sql.gz -p"${ENCRYPT_PASSWORD}"

export SOURCE_FILE="/tmp/${BACKUP_NAME}_${DATESTAMP}.sql.gz.aes256cbc"

python /opt/backup/upload-blob.py
