/* Database schema to keep the structure of entire database. */

CREATE TABLE medical_histories (
    id INT PRIMARY KEY NOT NULL,
    admitted_at TIMESTAMP,
    patient_id INT, 
    status VARCHAR
);

CREATE TABLE patients (
    id INT PRIMARY KEY NOT NULL, 
    name VARCHAR,
    date_of_birth DATE,
    FOREIGN KEY (id) REFERENCES medical_histories (id)
);
