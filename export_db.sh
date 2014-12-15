#! /bin/sh

# Settings
BACKUP_DIR="."
DB_USER="root"
DB_PASS="1"
DB="darip"
DB_DUMP="$BACKUP_DIR/$DB.sql"
BRANCH="db-dev" 

echo "\r\ndumping DB..."
# Dump the database
mysqldump -u $DB_USER -p$DB_PASS --skip-extended-insert $DB > $DB_DUMP
echo "db dump completed"

# switch to branch
git checkout $BRANCH

echo "\r\nadding changed file"
git add $DB_DUMP -f

read -p "\r\nEnter comment if needed: " answer
git commit -m "Update database dump $answer"

echo "\r\ncompressing git database..."
git gc

echo "\r\npushing changes to remote"
git push origin $BRANCH 

echo "\r\nnow you can start import_db.sh on remote server"
