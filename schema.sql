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

ALTER TABLE animals DROP species;

ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD CONSTRAINT speicies_id_fk FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals ADD owner_id INT;
ALTER TABLE animals ADD CONSTRAINT owner_fk FOREIGN KEY (owner_id) REFERENCES owners(id);

CREATE TABLE vets (
   id                 INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
   name               VARCHAR(50)                      NOT NULL,
   age                INT                              NOT NULL,
   date_of_graduation date                             NOT NULL
);

CREATE TABLE specializations (
   vets_name          VARCHAR(50)                      NOT NULL,
   species_id         INT                              NOT NULL,
   vets_id            INT                              NOT NULL
);

ALTER TABLE specializations ALTER COLUMN species_id DROP NOT NULL;

ALTER TABLE specializations ADD CONSTRAINT specializations_fk FOREIGN KEY (species_id) REFERENCES  species(id);
ALTER TABLE specializations ADD CONSTRAINT specializations_vets_fk FOREIGN KEY (vets_id) REFERENCES  vets(id);

CREATE TABLE visits (
   animals_name  VARCHAR(50)                      NOT NULL,
   date_of_visit date                             NOT NULL,
   animals_id    INT                              NOT NULL,
   vets_id       INT                              NOT NULL
);

ALTER TABLE visits ADD CONSTRAINT visits_fk FOREIGN KEY (animals_id) REFERENCES  animals(id);
ALTER TABLE visits ADD CONSTRAINT visits_vets_fk FOREIGN KEY (vets_id) REFERENCES  vets(id);

ALTER TABLE specializations ALTER COLUMN species_id DROP NOT NULL;
