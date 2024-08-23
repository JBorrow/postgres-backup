#!/bin/bash

# This script runs an extremely simple, one-off, backup
# using pg_dumpall

# Important environment variables:
# POSTGRES_USER
# POSTGRES_PASSWORD
# POSTGRES_PORT
# POSTGRES_HOST
# BACKUP_LOCATION
# BACKUP_KEY

this_date=$(date +%Y-%m-%d)
backup_name="${BACKUP_LOCATION}/${BACKUP_KEY}_${this_date}.sql.gz"

echo "Attempting to create backup with name ${backup_name}"

PGPASSWORD=${POSTGRES_PASSWORD} \
pg_dumpall -w -U $POSTGRES_USER \
	      -h $POSTGRES_HOST \
	      -p $POSTGRES_PORT \
	      | gzip > $backup_name

echo "Successfully created backup: "
du -b $backup_name

chmod 640 $backup_name
echo "Successfully changed permissions of backup to 640"
