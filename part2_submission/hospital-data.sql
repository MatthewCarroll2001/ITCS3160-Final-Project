USE hospital;

/*
*	INSERT 5 TUPLES FOR EACH ENTITY AND RELATIONSHIP TABLE
*/

-- Physicians
INSERT INTO physician VALUES
	(1, 'Doctor Strange', 5, '6789 Wake Hostpital Lane', '9193335555', 'Surgery'),
	(2, 'Doctor Who', 10, '1111 Who Knows Where', '1014325678', 'Neuroscience'),
    (3, 'Doctor Weird', 3, '404 Stay Away Road', '4444444444', 'Anatomy'),
    (4, 'Dr. Top Hat', 8, '123 Dr. Seuss Lane', '1230984567', 'Epidemiology'),
    (5, 'Dr. Anderson', 1, '171 Neighborhood Street', '5107889823', 'Biology');
    
-- Nurses
INSERT INTO nurse VALUES
	(1, 'Nurse Nina', 2, 'Some Way Here 1212', '7407044007'),
    (2, 'Gina Georgina Nursina', 11, 'Hometown Road', '4567891234'),
    (3, 'Nurse Simone Biles', 77, 'Grand Canyon', '5454545454'),
    (4, 'Nurse John Cena', 19, '100 WWE Lane', '6666666666'),
    (5, 'Nurse Evelina Ileena', 12, '6767 Mount Everest', '1000000000');

-- Patients
INSERT INTO patient VALUES 
	(1, 'Matthew Carroll', '1100 Johnson Alumni Way', '1110001111'),
	(2, 'Jeffrey Jeffman', '5588 Main Street', '9409994400'),
	(3, 'Payton Manning', '1234 Five Six Lane', '0123456789'),
	(4, 'George Jr.', '1010 Binary Street', '1110000110'),
	(5, 'Neil Armweak', '4004 Moon Court', '6574731223');
    
-- Health Records
INSERT INTO health_record VALUES
	(1, 'Bronchitis', '2019-05-01', 'Inactive', 'Cannot breathe keep coughing'),
    (2, 'Influenza Virus', '2013-07-29', 'Inactive', 'Hurt body'),
    (3, 'Sleepy', '2002-12-29', 'Inactive', 'In a state of non-awakeness: tired, if you will'),
    (4, 'Bubonic Plague', '1347-01-01', 'Inactive', 'Boils and lumps and throwing up'),
    (5, 'Leg Gone', '2022-03-31', 'Active', 'Leg fell off');

-- Medications ordered for patients
INSERT INTO medication VALUES
	(1, 'Zithromax'),
    (2, 'Oseltamivir phosphate'),
    (3, 'Caffeine'),
    (4, 'Streptomycin'),
    (5, 'Morphine');
    
-- Records of nurses medicating patients
INSERT INTO medicates VALUES
	(5, 1, 1, 20.00, '2019-05-02'),
	(4, 2, 2, 12.50, '2013-07-29'),
    (3, 3, 3, 230.00, '2002-12-29'),
    (2, 4, 4, 10.00, '1347-01-01'),
    (1, 5, 5, 1000.00, '2022-03-31');
    
-- Instructions given to patients with a fee
INSERT INTO instruction VALUES
	('i3ep56a', 'check lung health and monitor breathing of patient', 100.00, '2019-05-01'),
    ('rt0o4p2', 'give cough medicine and check for other signs of illness', 50.00, '2013-08-02'),
    ('fgq7654', 'wake him up', 1000.00, '2002-12-29'),
    ('01lw3e5', 'check to see if the boils are going down', 150.00, '1347-01-05'),
    ('qly6i7o', 'try to find another leg', 200.00, '2022-04-01');
	
-- Rooms that can house patients with a fee per night
INSERT INTO room VALUES
	(1010, 2, 400.00),
    (2010, 2, 500.00),
    (3005, 1, 700.00),
    (3006, 3, 200.00),
    (4545, 3, 250.00);
	
-- Represents who is in what room for how many nights
INSERT INTO hospitalized VALUES
	(1, 1010, 3),
    (2, 1010, 10),
    (3, 2010, 1),
    (4, 3005, 14),
    (5, 2010, 2);
    
-- How long patients are being monitored by physicians
INSERT INTO monitors VALUES
	(5, 1, '01:10:00'),
    (4, 2, '00:30:00'),
    (3, 3, '01:30:00'),
    (2, 4, '00:00:12'),
    (1, 5, '4:00:00');
    
-- Record of instructions ordered by physicians for patients
INSERT INTO orders VALUES
	('i3ep56a', 1, 1),
    ('rt0o4p2', 2, 2),
    ('fgq7654', 3, 3),
    ('01lw3e5', 4, 4),
    ('qly6i7o', 5, 5);
    
-- Record of instructions executed by a number of nurses for patients
INSERT INTO executes VALUES
	('i3ep56a', 1, 1),
    ('i3ep56a', 2, 1),
    ('rt0o4p2', 2, 2),
    ('fgq7654', 3, 3),
    ('01lw3e5', 4, 4),
    ('qly6i7o', 2, 5),
    ('qly6i7o', 4, 5),
    ('qly6i7o', 5, 5);
    
-- Creates an invoice for each patient that includes the cost of rooming and instructions
INSERT INTO invoice (patient_id, total_cost)
	SELECT p.patient_id, (r.fee*h.num_nights + i.fee) AS total_cost 
    FROM room r
    JOIN hospitalized h ON h.room_number = r.room_number
    JOIN patient p ON p.patient_id = h.patient_id
    JOIN orders o ON o.patient_id = p.patient_id
    JOIN instruction i ON i.instruction_code = o.instruction_code;
    
-- Payments made by patients for the invoices
INSERT INTO payment VALUES
	(1, 001, 1000.00, '2019-05-21'),
    (1, 002, 300.00, '2019-05-31'),
    (2, 001, 4050.00, '2013-09-15'),
    (3, 001, 750.00, '2003-01-07'),
    (3, 002, 750.00, '2003-02-03'),
    (4, 001, 8000.00, '1347-05-10'),
    (4, 002, 1950.00, '1347-11-28');
