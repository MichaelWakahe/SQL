#!/usr/bin/env bash

# This sets up the database in the container fired up by docker-compose.

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

MYSQL_PWD=$root_pass mysql --user=root --host=127.0.0.1 -e "CREATE USER '$db_user' IDENTIFIED BY '$db_pass';"
MYSQL_PWD=$root_pass mysql --user=root --host=127.0.0.1 -e "GRANT ALL ON $db_name.* TO '$db_user';"

MYSQL_PWD=$db_pass mysql --user=$db_user --host=127.0.0.1 < mysqlsampledatabase.sql
