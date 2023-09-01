/* Database schema to keep the structure of entire database. */

CREATE TABLE IF NOT EXISTS animals (
    id INT PRIMARY KEY,
    name VARCHAR(200),
    date_of_birth date,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);

ALTER TABLE animals ADD COLUMN species VARCHAR(200);


ALTER TABLE animals DROP COLUMN species;

CREATE TABLE IF NOT EXISTS owners (
    id serial PRIMARY KEY,
    full_name VARCHAR(200),
    age INT
);

CREATE TABLE IF NOT EXISTS species (
    id serial PRIMARY KEY,
    name VARCHAR(200)
);

ALTER TABLE animals ADD COLUMN owner_id INT,
ADD CONSTRAINT fk_owner
    FOREIGN KEY (owner_id) REFERENCES owners(id);

ALTER TABLE animals ADD COLUMN species_id INT, 
ADD CONSTRAINT fk_species
    FOREIGN KEY (species_id) REFERENCES species(id);