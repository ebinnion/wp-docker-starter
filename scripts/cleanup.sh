#!/bin/bash

docker-compose down --volumes --remove-orphans
rm -rf docker/db
rm -rf docker/wordpress
