#! /bin/sh

# Settings
BACKUP_DIR="."
DB_USER="root"
DB_PASS="1"
DB="darip"
DB_DUMP="$BACKUP_DIR/$DB.sql"
BRANCH="db-dev" 

echo "\r\n\pulling changes and switch to branch..."
git pull origin $BRANCH -f
git checkout $BRANCH


echo "\r\n import database..."
mysql -u $DB_USER -p$DB_PASS $DB > $DB_DUMP
echo "completed"