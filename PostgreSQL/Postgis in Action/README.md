# README

<<<<<<< HEAD
These are sample code from the book: PostGIS in Action, 3rd Edition by Leo S. Hsu, Regina Obe
=======
Examples here are derived from the book `PostGIS in Action, Third Edition by Leo S. Hsu, Regina Obe`.

Run the commands: 
docker rm postgis_in_actionc
docker-compose  -f docker-compose.yml up --build
./bootstrap.sh


# Commands to test setup
docker exec -ti postgis_in_actionc /bin/bash
docker exec -ti postgis_in_actionc psql -U postgres

PGPASSWORD=baz psql --host=localhost --dbname=sampledb --username=foo -w
>>>>>>> d4703b458b6956d8b8e207937426ed24a7ed17cf
