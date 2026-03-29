#!/bin/bash
BACKUP_DIR=~/backups/newsblur_$(date +%Y%m%d)
mkdir -p $BACKUP_DIR

# Config files
cp ~/NewsBlur/docker-compose.yml $BACKUP_DIR/
cp ~/NewsBlur/newsblur_web/local_settings.py $BACKUP_DIR/
cp ~/NewsBlur/newsblur_web/docker_local_settings.py $BACKUP_DIR/
cp ~/NewsBlur/docker/nginx/nginx.local.conf $BACKUP_DIR/
cp /etc/caddy/Caddyfile $BACKUP_DIR/

# Postgres dump
docker exec newsblur_db_postgres pg_dump -U newsblur newsblur > $BACKUP_DIR/postgres.sql

# MongoDB dump
docker exec newsblur_db_mongo mongodump --port 29019 --out /data/db/mongodump
docker cp newsblur_db_mongo:/data/db/mongodump $BACKUP_DIR/mongodump

echo "Backup complete: $BACKUP_DIR"
