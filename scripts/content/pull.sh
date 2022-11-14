#!/bin/bash

IMPORT_FILES_DIR=$1

# IF IMPORT_FILES_DIR not set then error.
if [ -z "$IMPORT_FILES_DIR" ]; then
	echo "IMPORT_FILES_DIR not set"
	exit 1
fi

echo 'Pulling media ...'
ssh username@ipaddress 'cd /some/path/public && zip -r ../wp-content.zip wp-content'
rsync -chavzP --stats username@ipaddress:/some/path/wp-content.zip "$IMPORT_FILES_DIR/wp-content.zip"
ssh username@ipaddress 'cd /some/path && rm wp-content.zip'
