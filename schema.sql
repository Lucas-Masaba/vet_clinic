/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
   id              INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
   name            TEXT                                             NOT NULL,
   date_of_birth   date                                             NOT NULL,
   escape_attempts INT                                              NOT NULL,
   neutered        BOOLEAN                                          NOT NULL,
   weight_kg       DECIMAL                                          NOT NULL
);

ALTER TABLE animals ADD species TEXT;

BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%\mon';
UPDATE animals SET species = 'pokemon' WHERE name NOT LIKE '%\mon';
COMMIT;

BEGIN;
DELETE * FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT sp1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO sp1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;