#!/bin/sh

# local settings
LOCAL_DB_USER='user'
LOCAL_DB_PASS='*'
LOCAL_DB_NAME='sample_db'

# server setting
SSH_USER='sshuser'
SERVER_DB_USER='dbserver'
SERVER_DB_PASS='passerver'
SERVER_DB_NAME='dbname'
SERVER_ADDRESS='1.1.1.1'

# common
PREFIX='serverDb'
BACKUP_FILE=$PREFIX_$(date +"%d_%m_%Y").sql

echo 'create mysql backup on server..'
ssh $SSH_USER@$SERVER_ADDRESS 'mysqldump -u$SERVER_DB_USER -p$SERVER_DB_PASS $SERVER_DB_NAME > $BACKUP_FILE'

echo 'transfer backup from server..'
ssh $SSH_USER@$SERVER_ADDRESS 'tar zcf - $BACKUP_FILE' | tar zxvf -


echo 'import mysql backup..'
mysql -u$LOCAL_DB_USER -p$LOCAL_DB_PASS  $LOCAL_DB_NAME < $BACKUP_FILE
echo 'completed'
