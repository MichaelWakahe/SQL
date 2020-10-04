#!/usr/bin/env bash

set -eux
set -o pipefail

db_user='foo'
db_pass='baz'
db_name='myschema'

# Create the database user who will host the tutorial database
PGPASSWORD=example psql --username=postgres --no-password --host=localhost -c "DROP DATABASE IF EXISTS $db_name;"
PGPASSWORD=example psql --username=postgres --no-password --host=localhost -c "CREATE DATABASE $db_name;"
PGPASSWORD=example psql --username=postgres --no-password --host=localhost -c "CREATE USER $db_user WITH ENCRYPTED PASSWORD '$db_pass';"
PGPASSWORD=example psql --username=postgres --no-password --host=localhost -c "GRANT ALL PRIVILEGES ON DATABASE $db_name TO $db_user;"

