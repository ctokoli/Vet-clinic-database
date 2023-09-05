/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';

SELECT name FROM animals WHERE name LIKE '%mon';

SELECT name from animals WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 2016 AND 2019;

SELECT name FROM animals WHERE neutered = 'true' AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = 'true';

SELECT * FROM animals WHERE name <> 'Gabumon';

SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;


BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;


ROLLBACK;
SELECT * FROM animals;


BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
COMMIT;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
COMMIT;
SELECT * FROM animals;


BEGIN;
SAVEPOINT my_savepoint;
UPDATE animals SET weight_kg = weight_kg * -1;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET weight_kg = weight_kg * -1 
WHERE weight_kg < 0;
SELECT * FROM animals;


SELECT name
FROM animals 
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT animals.name
FROM animals 
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT o.full_name, a.name
FROM owners AS o
LEFT JOIN animals AS a ON o.id = a.owner_id
ORDER BY o.full_name, a.name;

SELECT animals.species_id, COUNT(*) as animal_count
FROM animals
GROUP BY species_id;

SELECT a.name
FROM animals AS a
JOIN owners AS o ON a.owner_id = o.id
JOIN species AS s ON a.species_id = s.id
WHERE o.full_name = 'Jennifer Orwell'
AND s.name = 'Digimon';

SELECT a.name
FROM animals AS a
JOIN owners AS o ON a.owner_id = o.id
WHERE o.full_name = 'Dean Winchester'
AND a.escape_attempts < 10;

SELECT o.full_name, COUNT(*) AS animal_count
FROM owners AS o
JOIN animals AS a ON o.id = a.owner_id
GROUP BY o.full_name
ORDER BY animal_count DESC
LIMIT 1;

