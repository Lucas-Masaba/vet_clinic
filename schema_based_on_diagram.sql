CREATE TABLE patients (
     id              INT GENERATED ALWAYS AS IDENTITY NOT NULL     PRIMARY KEY,
     name            VARCHAR(50)                                      NOT NULL,
     date_of_birth   date                                             NOT NULL
);

CREATE TABLE treatments (
     id              INT GENERATED ALWAYS AS IDENTITY NOT NULL     PRIMARY KEY,
     type            VARCHAR(50)                                      NOT NULL,
     name            VARCHAR(50)                                      NOT NULL
);

CREATE TABLE medical_histories (
     id              INT GENERATED ALWAYS AS IDENTITY NOT NULL     PRIMARY KEY,
     admited_at      TIMESTAMP                                        NOT NULL,
     patient_id      INT                                              NOT NULL,
     status          VARCHAR(50)                                      NOT NULL,
     FOREIGN KEY (patient_id) REFERENCES patients(id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE invoices (
     id              INT GENERATED ALWAYS AS IDENTITY NOT NULL     PRIMARY KEY,
     total_amount    DECIMAL                                        NOT NULL,
     generated_at    TIMESTAMP                                      NOT NULL,
     payed_at        TIMESTAMP                                      NOT NULL,
     medical_history_id        INT                                      NOT NULL,
     FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE invoice_items (
     id              INT GENERATED ALWAYS AS IDENTITY NOT NULL     PRIMARY KEY,
     unit_price      DECIMAL                                        NOT NULL,
     quantity        INT                                      NOT NULL,
     total_price     DECIMAL                                      NOT NULL,
     invoice_id        INT                                      NOT NULL,
     treatment_id      INT                                      NOT NULL,
     FOREIGN KEY (invoice_id) REFERENCES invoices(id) ON DELETE RESTRICT ON UPDATE CASCADE
     FOREIGN KEY (treatment_id) REFERENCES treatments(id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE medical_histories_treatments (
     id              INT GENERATED ALWAYS AS IDENTITY NOT NULL     PRIMARY KEY,
     medical_history_id        INT                                      NOT NULL,
     treatment_id      INT                                      NOT NULL,
     FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id) ON DELETE RESTRICT ON UPDATE CASCADE
     FOREIGN KEY (treatment_id) REFERENCES treatments(id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE INDEX  medical_histories_patient_id_idx  ON medical_histories(patient_id);
CREATE INDEX  invoices_medical_history_id_idx  ON invoices(medical_history_id);
CREATE INDEX  invoice_items_invoice_id_idx  ON invoice_items(invoice_id);
CREATE INDEX  invoice_items_treatment_id_idx  ON invoice_items(treatment_id);
CREATE INDEX  medical_histories_treatments_medical_history_id_idx  ON medical_histories_treatments(medical_history_id);
CREATE INDEX  medical_histories_treatments_treatment_id_idx  ON medical_histories_treatments(treatment_id);
