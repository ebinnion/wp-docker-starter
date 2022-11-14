#!/bin/bash

FILE=$1

CURRENT_DIR="$( pwd )"
cd "$( dirname "${BASH_SOURCE[0]}" )" || exit;
WORDPRESS_DIR="$( cd ../../docker/wordpress && pwd )"
cd "$CURRENT_DIR" || exit

rm -rf "$WORDPRESS_DIR/wp-content/plugins"
rm -rf "$WORDPRESS_DIR/wp-content/themes"
rm -rf "$WORDPRESS_DIR/wp-content/uploads"

cp "$FILE" /tmp
unzip "/tmp/wp-content.zip" -d /tmp

mv "/tmp/wp-content/plugins" "$WORDPRESS_DIR/wp-content/plugins"
mv "/tmp/wp-content/themes" "$WORDPRESS_DIR/wp-content/themes"
mv "/tmp/wp-content/uploads" "$WORDPRESS_DIR/wp-content/uploads"

rm -rf "/tmp/wp-content"
