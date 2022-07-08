-- Run this to create your new database, then create a new connection to this database.
-- In PostgreSQL you cannot change to use a new database using an existing connection.
CREATE DATABASE postgis_in_action;

-- Enable PostGIS in the database
CREATE EXTENSION postgis;

-- Check that it is now available
SELECT * FROM pg_extension;
SELECT postgis_full_version();

CREATE SCHEMA ch01;


CREATE TABLE ch01.lu_franchises (
	id char(3) PRIMARY KEY, 
	franchise varchar(30));

	
INSERT INTO ch01.lu_franchises(id, franchise) 
VALUES 
  ('BKG', 'Burger King'), ('CJR', 'Carl''s Jr'),
  ('HDE', 'Hardee'), ('INO', 'In-N-Out'), 
  ('JIB', 'Jack in the Box'), ('KFC', 'Kentucky Fried Chicken'),
  ('MCD', 'McDonald'), ('PZH', 'Pizza Hut'),
  ('TCB', 'Taco Bell'), ('WDY', 'Wendys');
  
  
CREATE TABLE ch01.restaurants
(
  id serial primary key, 
  franchise char(3) NOT NULL, 
  geom geometry(point,2163) 
);