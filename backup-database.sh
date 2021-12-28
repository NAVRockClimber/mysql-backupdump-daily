#!/bin/sh

echo "creating backup"

BACKUP_FOLDER=/opt/mysql/backup
NOW=$(date '+%d')

GZIP=$(which gzip)
MYSQLDUMP=$(which mysqldump)

### MySQL Server Login info ###
MHOST=$DB_HOST
MPASS=$MYSQL_ROOT_PASSWORD
MUSER=root

[ ! -d "$BACKUP_FOLDER" ] && mkdir --parents $BACKUP_FOLDER

FILE=${BACKUP_FOLDER}/backup-${NOW}.sql.gz
$MYSQLDUMP -h $MHOST -u $MUSER -p${MPASS} --verbose --all-databases --single-transaction --quick --lock-tables=false | $GZIP -9 > $FILE