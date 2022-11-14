#!/bin/bash

IMPORT_FILES_DIR=$1

# IF IMPORT_FILES_DIR not set then error.
if [ -z "$IMPORT_FILES_DIR" ]; then
	echo "IMPORT_FILES_DIR not set"
	exit 1
fi

# Setup containers for the application.
docker-compose up -d
echo "Waiting for containers to start ..."

while [ $(curl -s -o /dev/null -w "%{http_code}" http://localhost:8082/wp-admin/install.php) != "200" ]; do
  printf "."
  sleep 1
done

# Do basic WordPress installation.
docker-compose run \
	--rm cli wp core install \
	--url=http://localhost:8082 \
	--title="A local site" \
	--admin_user=admin \
	--admin_email=ericbinnion@gmail.com \
	--admin_password=password

# Get current directory of this script.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CURRENT_DIR="$( pwd )"

IMPORT_FILES_DIR="$( cd "$IMPORT_FILES_DIR" && pwd )"
cd "$CURRENT_DIR" || exit

sh "$DIR/content/import.sh" "$IMPORT_FILES_DIR/wp-content.zip"
sh "$DIR/db/import.sh" "$IMPORT_FILES_DIR/dbdump.sql"
