/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%\mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' and '2020-01-01';
SELECT * FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT *  FROM animals WHERE neutered;
SELECT *  FROM animals WHERE name NOT LIKE 'Gabumon';
SELECT *  FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

SELECT COUNT(*) FROM animals;
SELECT * FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT name, neutered, MAX(escape_attempts) FROM animals GROUP BY name, neutered, escape_attempts ORDER BY escape_attempts DESC LIMIT 1;
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
SELECT name, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' and '2000-01-01' GROUP BY name;