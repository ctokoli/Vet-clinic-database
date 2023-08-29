id/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';

SELECT name FROM animals WHERE name LIKE '%mon';

SELECT name from animals WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 2016 AND 2019;

SELECT name FROM animals WHERE neutered = 'true' AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = 'true';

SELECT * FROM animals WHERE name != 'Gabumon';

SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;