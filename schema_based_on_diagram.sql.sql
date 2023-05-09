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
    medical_histories REFERENCES medical_histories (id)
);


CREATE TABLE invoice_items (
    id INT PRIMARY KEY NOT NULL, 
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT REFERENCES invoices (id),
    treatment_id INT REFERENCES treatments (id)
);
