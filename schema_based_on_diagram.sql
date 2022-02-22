CREATE TABLE patients (
     id              INT GENERATED ALWAYS AS IDENTITY NOT NULL     PRIMARY KEY,
     name            VARCHAR(50)                                      NOT NULL,
     date_of_birth   date                                             NOT NULL
)

CREATE TABLE treatments (
     id              INT                                  NOT NULL PRIMARY KEY,
     type            VARCHAR(50)                                      NOT NULL,
     name            VARCHAR(50)                                      NOT NULL
)

CREATE TABLE medical_histories (
     id              INT                                  NOT NULL PRIMARY KEY,
     admited_at      TIMESTAMP                                        NOT NULL,
     patient_id      INT                                  NOT NULL PRIMARY KEY,
     status          VARCHAR(50)                                      NOT NULL
)

ALTER TABLE medical_histories ADD CONSTRAINT patient_id_fk FOREIGN KEY (patient_id) REFERENCES patients(id);
