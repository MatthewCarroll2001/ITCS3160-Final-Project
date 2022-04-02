DROP DATABASE IF EXISTS hospital;
CREATE DATABASE hospital;
USE hospital;

/*
*	ENTITY TABLES
*/
CREATE TABLE physician (
	physician_id INT PRIMARY KEY,
    physician_name VARCHAR(40) NOT NULL,
    certification_number INT,
    address VARCHAR(75),
    phone_number CHAR(10),
    field_of_expertise VARCHAR(20)
);

CREATE TABLE nurse (
	nurse_id INT PRIMARY KEY,
    nurse_name VARCHAR(40) NOT NULL,
    certification_number INT,
    address VARCHAR(75),
    phone_number CHAR(10)
);

CREATE TABLE patient (
	patient_id INT PRIMARY KEY,
    patient_name VARCHAR(40) NOT NULL,
    address VARCHAR(75),
    phone_number CHAR(10)
);

CREATE TABLE health_record (
	patient_id INT PRIMARY KEY,
    disease VARCHAR(20),
    record_date DATETIME NOT NULL DEFAULT NOW(),
    record_status VARCHAR(10),
    descr VARCHAR(200) NOT NULL
);

CREATE TABLE medication (
	medication_id INT PRIMARY KEY,
    medication_name VARCHAR(50)
);

CREATE TABLE instruction (
	instruction_code VARCHAR(10) PRIMARY KEY,
    descr VARCHAR(300) NOT NULL,
    fee DECIMAL(10, 2) NOT NULL,
    order_date DATE NOT NULL
);

CREATE TABLE room (
	room_number INT PRIMARY KEY,
    capacity INT NOT NULL DEFAULT 1,
    fee Decimal(10, 2) NOT NULL
);

CREATE TABLE invoice (
	invoice_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    total_cost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);

/*
*	RELATIONSHIP TABLES
*/
CREATE TABLE monitors (
	physician_id INT NOT NULL,
    patient_id INT NOT NULL,
    duration TIME NOT NULL,
    PRIMARY KEY (physician_id, patient_id),
    FOREIGN KEY (physician_id) REFERENCES physician(physician_id),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);

CREATE TABLE medicates (
	nurse_id INT NOT NULL,
    patient_id INT NOT NULL,
    medication_id INT NOT NULL,
    quantity DECIMAL(6, 2) NOT NULL,
    med_date DATETIME NOT NULL DEFAULT NOW(),
    PRIMARY KEY (nurse_id, patient_id, medication_id),
    FOREIGN KEY (nurse_id) REFERENCES nurse(nurse_id),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY (medication_id) REFERENCES medication(medication_id)
);

CREATE TABLE hospitalized (
	patient_id INT NOT NULL,
    room_number INT NOT NULL,
    num_nights INT,
    PRIMARY KEY (patient_id, room_number),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY (room_number) REFERENCES room(room_number)
);

CREATE TABLE orders (
	instruction_code VARCHAR(10) PRIMARY KEY,
    physician_id INT NOT NULL,
    patient_id INT NOT NULL,
    FOREIGN KEY (instruction_code) REFERENCES instruction(instruction_code),
    FOREIGN KEY (physician_id) REFERENCES physician(physician_id),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);

CREATE TABLE executes (
	instruction_code VARCHAR(10) NOT NULL,
    nurse_id INT NOT NULL,
    patient_id INT NOT NULL,
    PRIMARY KEY (instruction_code, nurse_id),
    FOREIGN KEY (instruction_code) REFERENCES instruction(instruction_code),
    FOREIGN KEY (nurse_id) REFERENCES nurse(nurse_id),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);

CREATE TABLE payment (
	invoice_id INT NOT NULL,
    payment_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    date_paid DATETIME NOT NULL DEFAULT NOW(),
    PRIMARY KEY (invoice_id, payment_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id)
);
