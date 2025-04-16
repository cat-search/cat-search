#!/bin/bash
set -e

POSTGRES_USER=postgres
POSTGRES_DB=catsearch
DATA_DIR=/docker-entrypoint-initdb.d/backups

echo "Starting pg_restore ..."

pg_restore --create \
  -U "$POSTGRES_USER" \
  --dbname "$POSTGRES_DB" \
  --no-owner --format c --no-privileges \
  "$DATA_DIR/cms.dump"

pg_restore --create \
  -U "$POSTGRES_USER" \
  --dbname "$POSTGRES_DB" \
  --no-owner --format c --no-privileges \
  "$DATA_DIR/filestorage.dump"

pg_restore --create \
  -U "$POSTGRES_USER" \
  --dbname "$POSTGRES_DB" \
  --no-owner --format c --no-privileges \
  "$DATA_DIR/lists.dump"

echo "Restoration completed successfully"
