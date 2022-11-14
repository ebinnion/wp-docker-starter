#!/bin/bash

IMPORT_FILES_DIR=$1

# IF IMPORT_FILES_DIR not set then error.
if [ -z "$IMPORT_FILES_DIR" ]; then
	echo "IMPORT_FILES_DIR not set"
	exit 1
fi

echo 'Pulling db ...'
ssh username@ipaddress 'cd /some/path/public && wp db export ../dbdump.sql'
rsync -chavzP --stats username@ipaddress:/some/path/dbdump.sql "$IMPORT_FILES_DIR/dbdump.sql"
ssh username@ipaddress 'cd /some/path && rm dbdump.sql'
