#!/usr/bin/env bash

set -eux
set -o pipefail

root_pass='example'
db_user='foo'
db_pass='baz'
db_name='classicmodels'

# Create the database user and database
# Note that by default, the MySQL client treats 'localhost' and '127.0.0.1' differently. To use 'localhost',  remove or
# rename `/etc/mysql/my.cnf`, let mysql use `/etc/my.cnf`.
MYSQL_PWD=$root_pass mysql --user=root --host=127.0.0.1 -e "DROP DATABASE IF EXISTS $db_name;"
MYSQL_PWD=$root_pass mysql --user=root --host=127.0.0.1 -e "DROP ROLE IF EXISTS $db_user;"





#PGPASSWORD=example psql --username=postgres --no-password --host=localhost -c "CREATE DATABASE $db_name;"
#PGPASSWORD=example psql --username=postgres --no-password --host=localhost -c "CREATE USER $db_user WITH ENCRYPTED PASSWORD '$db_pass';"
#PGPASSWORD=example psql --username=postgres --no-password --host=localhost -c "GRANT ALL PRIVILEGES ON DATABASE $db_name TO $db_user;"
#
## Restore a dump of the database
#PGPASSWORD=$db_pass psql --host=localhost --dbname=$db_name --username=$db_user -w < $db_name.pgdump
