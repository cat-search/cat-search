#!/bin/bash
set -e

POSTGRES_USER=postgres
$POSTGRES_DB=postgres

echo "Starting pg_restore"

pg_restore --create \
  -U "$POSTGRES_USER" \
  -dbname "$POSTGRES_DB" \
  --no-owner --format c --no-privileges \
  /opt/catsearch/import_data/cms.dump

pg_restore --create \
  -U "$POSTGRES_USER" \
  -dbname "$POSTGRES_DB" \
  --no-owner --format c --no-privileges \
  /opt/catsearch/import_data/filestorage.dump

pg_restore --create \
  -U "$POSTGRES_USER" \
  -dbname "$POSTGRES_DB" \
  --no-owner --format c --no-privileges \
  /opt/catsearch/import_data/lists.dump

echo "Restoration completed successfully"
