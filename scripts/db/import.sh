#!/bin/bash

FILE=$1

CURRENT_DIR="$( pwd )"
cd "$( dirname "${BASH_SOURCE[0]}" )" || exit;
WORDPRESS_DIR="$( cd ../../docker/wordpress && pwd )"
cd "$CURRENT_DIR" || exit

cp "$FILE" "$WORDPRESS_DIR/dbdump.sql"

docker-compose run --rm cli wp db import /var/www/html/dbdump.sql
docker-compose run --rm cli wp plugin --skip-plugins deactivate redis-cache # Do not have redis cache in the container.
docker-compose run --rm cli wp search-replace --skip-plugins https://theoldurl.com http://localhost:8082

rm docker/wordpress/dbdump.sql
