/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
   id              INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
   name            VARCHAR(50)                                      NOT NULL,
   date_of_birth   date                                             NOT NULL,
   escape_attempts INT                                              NOT NULL,
   neutered        BOOLEAN                                          NOT NULL,
   weight_kg       DECIMAL                                          NOT NULL
);

CREATE TABLE owners (
   id        INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
   full_name VARCHAR(50)                                  NOT NULL,
   age       INT                                          NOT NULL
);

CREATE TABLE species (
   id        INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
   name      VARCHAR(50)                               NOT NULL
);

ALTER TABLE animals ADD species TEXT;

ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD CONSTRAINT speicies_id_fk FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals ADD owner_id INT;
ALTER TABLE animals ADD CONSTRAINT owner_fk FOREIGN KEY (owner_id) REFERENCES owners;
