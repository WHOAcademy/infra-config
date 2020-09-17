#!/bin/bash
openssl enc -aes-256-cbc -in $BACKUP_NAME -out $BACKUP_NAME.aes256cbc -salt -pass pass:$ENCRYPT_PASSWORD
