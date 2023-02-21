/*Queries that provide answers to the questions from all projects.*/

SELECT *
FROM animals
WHERE pet_name LIKE '%mon';

SELECT pet_name 
FROM animals 
WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT pet_name 
FROM animals 
WHERE neutered = true AND escape_attempts < 3;

SELECT date_of_birth 
FROM animals 
WHERE pet_name IN ('Agumon', 'Pikachu');

SELECT pet_name, escape_attempts
FROM animals
WHERE weight_kg > 10.5;

SELECT * 
FROM animals
WHERE neutered = true;

SELECT * 
FROM animals
WHERE pet_name <> 'Gabumon';

SELECT * 
FROM animals 
WHERE weight_kg BETWEEN 10.4 AND 17.3;
