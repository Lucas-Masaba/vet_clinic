/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2021-01-07', 1, true, 8);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-11-15', 2, false, 15.04);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, true, 12);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '2020-02-08', 0, true, -11);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '2022-11-15', 2, true, -5.7);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '1993-04-02', 3, false, -12.13);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '2005-06-12', 1, true, -45);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '2005-06-07', 7, true, 20.4);
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', '1998-10-13', 3, true, 17);

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT species FROM animals;
ROLLBACK;
SELECT species FROM animals;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%\mon';
UPDATE animals SET species = 'pokemon' WHERE name NOT LIKE '%\mon';
SELECT species FROM animals;
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT species FROM animals;


BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT sp1;
UPDATE animals SET weight_kg = weight_kg * -1;
SELECT weight_kg FROM animals;
ROLLBACK TO sp1;
SELECT weight_kg FROM animals;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
SELECT weight_kg FROM animals;
COMMIT;
SELECT weight_kg FROM animals;

INSERT INTO owners (full_name, age) VALUES ('SAM SMITH', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

UPDATE animals SET species_id = 2 WHERE name LIKE '%\mon';
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%\mon';

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';

INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Thatcher', 45, '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (vets_name, species_id, vets_id) VALUES ('William Thatcher', 1, 1);
INSERT INTO specializations (vets_name, species_id, vets_id) VALUES ('Stephanie Mendez', 2, 3);
INSERT INTO specializations (vets_name, species_id, vets_id) VALUES ('Stephanie Mendez', 1, 3);
INSERT INTO specializations (vets_name, species_id, vets_id) VALUES ('Jack Harkness', 2, 4);
INSERT INTO specializations (vets_name, species_id, vets_id) VALUES ('Maisy Smith', NULL, 2);

INSERT INTO visits (animals_name, date_of_visit, animals_id, vets_id) VALUES ('Agumon', '2020-05-24', 1, 1);
INSERT INTO visits (animals_name, date_of_visit, animals_id, vets_id) VALUES ('Agumon', '2020-07-22', 1, 3);
INSERT INTO visits (animals_name, date_of_visit, animals_id, vets_id) VALUES ('Gabumon', '2021-02-02', 2, 4);
INSERT INTO visits (animals_name, date_of_visit, animals_id, vets_id) VALUES ('Pickachu', '2020-01-05', 3, 2);
INSERT INTO visits (animals_name, date_of_visit, animals_id, vets_id) VALUES ('Pickachu', '2020-03-08', 3, 2);
INSERT INTO visits (animals_name, date_of_visit, animals_id, vets_id) VALUES ('Devimon', '2021-05-04', 4, 3);
INSERT INTO visits (animals_name, date_of_visit, animals_id, vets_id) VALUES ('Charmander', '2021-02-24', 5, 4);
INSERT INTO visits (animals_name, date_of_visit, animals_id, vets_id) VALUES ('Squirtle', '2019-09-29', 7, 3);
INSERT INTO visits (animals_name, date_of_visit, animals_id, vets_id) VALUES ('Angemon', '2020-10-03', 8, 4);
INSERT INTO visits (animals_name, date_of_visit, animals_id, vets_id) VALUES ('Angemon', '2020-11-04', 8, 4);
INSERT INTO visits (animals_name, date_of_visit, animals_id, vets_id) VALUES ('Boarmon', '2019-01-24', 9, 2);
INSERT INTO visits (animals_name, date_of_visit, animals_id, vets_id) VALUES ('Boarmon', '2019-05-15', 9, 2);
INSERT INTO visits (animals_name, date_of_visit, animals_id, vets_id) VALUES ('Boarmon', '2020-02-27', 9, 2);
INSERT INTO visits (animals_name, date_of_visit, animals_id, vets_id) VALUES ('Boarmon', '2020-08-03', 9, 2);
INSERT INTO visits (animals_name, date_of_visit, animals_id, vets_id) VALUES ('Blossom', '2020-05-24', 10, 3);
INSERT INTO visits (animals_name, date_of_visit, animals_id, vets_id) VALUES ('Blossom', '2020-01-11', 10, 1);











