#!/usr/bin/env bash

set -eux
set -o pipefail

POSTGRES_PASSWORD='example'
DB_USER='foo'
DB_PASS='baz'
DB_NAME='postgis_in_action'


# Create the database user and database
#PGPASSWORD=$POSTGRES_PASSWORD psql --username=postgres --no-password --host=localhost -c "DROP DATABASE IF EXISTS $DB_NAME;"
#PGPASSWORD=$POSTGRES_PASSWORD psql --username=postgres --no-password --host=localhost -c "DROP USER IF EXISTS $DB_USER;"

PGPASSWORD=$POSTGRES_PASSWORD psql --username=postgres --no-password --host=localhost -c "CREATE DATABASE $DB_NAME;"
PGPASSWORD=$POSTGRES_PASSWORD psql --username=postgres --no-password --host=localhost -c "CREATE USER $DB_USER WITH ENCRYPTED PASSWORD '$DB_PASS';"
PGPASSWORD=$POSTGRES_PASSWORD psql --username=postgres --no-password --host=localhost -c "GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;"

# Create the database
PGPASSWORD=$DB_PASS psql --host=localhost --dbname=$DB_NAME --username=$DB_USER -w < Chapter1/Ch1.sql
