-- How do I list extensions installed in a database?
SELECT * FROM pg_extension;

-- In psql that would be
-- \dx

-- If you want to know which extensions are available on your server:
SELECT * FROM pg_available_extensions;

-- After a PostGIS install, do a quick verification of the version to make sure 
-- the installation succeeded. Execute the following query:
SELECT postgis_full_version();

-- See the Postgis compatibility and support matrix here:
-- https://trac.osgeo.org/postgis/wiki/UsersWikiPostgreSQLPostGIS