/* Database schema to keep the structure of entire database. */

CREATE TABLE patients (
    id INT PRIMARY KEY NOT NULL, 
    name VARCHAR,
    date_of_birth DATE
);

CREATE TABLE medical_histories (
    id INT PRIMARY KEY NOT NULL,
    admitted_at TIMESTAMP,
    patient_id INT REFERENCES patients (id), 
    status VARCHAR
);



CREATE TABLE invoices (
    id INT PRIMARY KEY NOT NULL, 
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_histories_id INT REFERENCES medical_histories (id)
);

CREATE TABLE treatments (
    id INT PRIMARY KEY NOT NULL,
    type VARCHAR(150),
    name VARCHAR(150)
);
CREATE TABLE invoice_items (
    id INT PRIMARY KEY NOT NULL, 
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT REFERENCES invoices (id),
    treatment_id INT REFERENCES treatments (id)
);

CREATE TABLE medical_histories_has_treatments (
    medical_history_id int REFERENCES medical_histories(id),
    treatment_id int REFERENCES treatments(id)
);

CREATE INDEX invoice_index on invoices(medical_histories_id)

CREATE INDEX patient_id_index on medical_histories(patient_id);
