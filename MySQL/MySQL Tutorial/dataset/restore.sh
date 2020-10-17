#!/usr/bin/env bash

# This sets up the database in the container fired up by docker-compose.

set -eux
set -o pipefail

root_pass='example'
db_user='foo'
db_pass='baz'
classicmodels_sampledb_name='classicmodels'
python_sampledb_name='python_mysql'

# Create the database user and database
# Note that by default, the MySQL client treats 'localhost' and '127.0.0.1' differently. To use 'localhost',  remove or
# rename `/etc/mysql/my.cnf`, let mysql use `/etc/my.cnf`.
MYSQL_PWD=$root_pass mysql --user=root --host=127.0.0.1 -e "DROP DATABASE IF EXISTS $classicmodels_sampledb_name;"
MYSQL_PWD=$root_pass mysql --user=root --host=127.0.0.1 -e "DROP DATABASE IF EXISTS $python_sampledb_name;"
MYSQL_PWD=$root_pass mysql --user=root --host=127.0.0.1 -e "DROP ROLE IF EXISTS $db_user;"

MYSQL_PWD=$root_pass mysql --user=root --host=127.0.0.1 -e "CREATE USER '$db_user' IDENTIFIED BY '$db_pass';"
MYSQL_PWD=$root_pass mysql --user=root --host=127.0.0.1 -e "GRANT ALL ON $classicmodels_sampledb_name.* TO '$db_user';"
MYSQL_PWD=$root_pass mysql --user=root --host=127.0.0.1 -e "GRANT ALL ON $python_sampledb_name.* TO '$db_user';"
#
MYSQL_PWD=$db_pass mysql --user=$db_user --host=127.0.0.1 < classicmodels_sample.sql
MYSQL_PWD=$db_pass mysql --user=$db_user --host=127.0.0.1 < python_sample.sql
