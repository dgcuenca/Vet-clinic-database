/* Populate database with sample data. */
INSERT INTO animals (pet_name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals (pet_name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Gabumon', '2018-11-15', 2, true, 8);
INSERT INTO animals (pet_name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals (pet_name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Devimon', '2017-05-14', 5, true, 11);
INSERT INTO animals (pet_name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Charmander', '2020-02-08', 0, FALSE, -11);
INSERT INTO animals (pet_name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Plantmon', '2021-11-15', 2, TRUE, -5.7);
INSERT INTO animals (pet_name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Squirtle', '1993-04-02', 3, FALSE, -12.13);
INSERT INTO animals (pet_name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Angemon', '2005-06-12', 1, TRUE, -45);
INSERT INTO animals (pet_name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Boarmon', '2005-06-07', 7, TRUE, 20.4);
INSERT INTO animals (pet_name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Blossom', '1998-10-13', 3, TRUE, 17);
INSERT INTO animals (pet_name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Ditto', '2022-05-14', 4, TRUE, 22);
INSERT INTO owners (full_name, age) VALUES
  ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);
INSERT INTO species (name) VALUES
  ('Pokemon'),
  ('Digimon');
-- update species_id based on pet_name
UPDATE animals
SET species_id =(CASE
                WHEN pet_name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
                ELSE (SELECT id FROM species WHERE name = 'Pokemon')
                END);

-- Update Sam Smith's animal
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE pet_name = 'Agumon';

-- Update Jennifer Orwell's animals
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE pet_name IN ('Gabumon', 'Pikachu');

-- Update Bob's animals
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE pet_name IN ('Devimon', 'Plantmon');

-- Update Melody Pond's animals
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE pet_name IN ('Charmander', 'Squirtle', 'Blossom');

-- Update Dean Winchester's animals
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE pet_name IN ('Angemon', 'Boarmon');
