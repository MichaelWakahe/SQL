#!/usr/bin/env bash

set -eux
set -o pipefail

db_user='foo'
db_pass='baz'
db_name='sampledb'

# Create the database user and database
PGPASSWORD=example psql --username=postgres --no-password --host=localhost -c "DROP DATABASE IF EXISTS $db_name;"
PGPASSWORD=example psql --username=postgres --no-password --host=localhost -c "DROP USER IF EXISTS $db_user;"

PGPASSWORD=example psql --username=postgres --no-password --host=localhost -c "CREATE DATABASE $db_name;"
PGPASSWORD=example psql --username=postgres --no-password --host=localhost -c "CREATE USER $db_user WITH ENCRYPTED PASSWORD '$db_pass';"
PGPASSWORD=example psql --username=postgres --no-password --host=localhost -c "GRANT ALL PRIVILEGES ON DATABASE $db_name TO $db_user;"

# Restore a dump of the database
PGPASSWORD=$db_pass psql --host=localhost --dbname=$db_name --username=$db_user -w < $db_name.pgdump
