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
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT name, neutered, MAX(escape_attempts) FROM animals GROUP BY name, neutered, escape_attempts ORDER BY escape_attempts DESC LIMIT 1;
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;
SELECT name, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' and '2000-01-01' GROUP BY name;

SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';
SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
SELECT species.name, COUNT(animals.id) FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Jennifer Orwell' AND species_id = 2;
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Wincheser' AND escape_attempts = 0;
SELECT owners.full_name, MAX(animals.id) FROM animals JOIN owners ON animals.owner_id = owners.id GROUP BY owners.full_name, animals.id ORDER BY animals.id DESC LIMIT 1;

SELECT visits.animals_name, vets.id, MAX(visits.date_of_visit) FROM visits JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'William Thatcher' GROUP BY visits.animals_name, vets.id, visits.date_of_visit ORDER BY visits.date_of_visit DESC LIMIT 1;
SELECT vets.name, COUNT(DISTINCT visits.animals_name) FROM vets JOIN visits ON visits.vets_id = vets.id WHERE vets.name = 'Stephanie Mendez' AND vets_id = 3 GROUP BY vets.name;
SELECT vets.name, specializations.vets_id, specializations.species_id FROM vets JOIN specializations ON specializations.vets_id = vets.id GROUP BY vets.name, specializations.vets_id, specializations.species_id;
SELECT visits.animals_name FROM vets JOIN visits ON visits.vets_id = vets.id WHERE vets.name = 'Stephanie Mendez' AND vets_id = 3 AND visits.date_of_visit BETWEEN '2020-04-01' and '2020-08-30' GROUP BY visits.animals_name;
SELECT visits.animals_name, COUNT(visits.animals_name) FROM visits GROUP BY visits.animals_id ORDER BY `value_occurrence` DESC LIMIT 1;
SELECT visits.animals_name, COUNT(visits.animals_name) FROM visits GROUP BY visits.animals_name ORDER BY COUNT(visits.animals_name) DESC LIMIT 1;
SELECT visits.animals_name, vets.id, MIN(visits.date_of_visit) FROM visits JOIN vets ON vets.id = visits.vets_id WHERE vets.name = 'Maisy Smith' GROUP BY visits.animals_name, vets.id, visits.date_of_visit ORDER BY MIN(visits.date_of_visit) ASC LIMIT 1;
SELECT * FROM animals  JOIN visits ON animals.id = visits.animals_id  JOIN vets ON vets.id = visits.vets_id  ORDER BY visits.date_of_visit DESC  LIMIT 1;
SELECT vets.name, species.name, COUNT(visits.date_of_visit) FROM vets  LEFT JOIN specializations ON vets.id = specializations.vets_id  LEFT JOIN species ON species.id = specializations.species_id  JOIN visits ON visits.vets_id = vets.id  WHERE species.name IS NULL  GROUP BY vets.name, species.name;
SELECT species.name, count(species.name) FROM animals  JOIN visits ON animals.id = visits.animals_id  JOIN vets ON vets.id = visits.vets_id  JOIN species ON animals.species_id = species.id  WHERE vets.name = 'Maisy Smith'  GROUP BY species.name  LIMIT 1;