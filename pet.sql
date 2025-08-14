
CREATE TABLE animal (
  name VARCHAR(50) PRIMARY KEY,
  age INTEGER,
  type VARCHAR(20),
  breed VARCHAR(50)
);


CREATE TABLE owner (
  owner_id INTEGER PRIMARY KEY,
  name VARCHAR(50),
  phone VARCHAR(15)
);

CREATE TABLE pet_owner (
  animal_name VARCHAR(50),
  owner_id INTEGER,
  FOREIGN KEY (animal_name) REFERENCES animal(name),
  FOREIGN KEY (owner_id) REFERENCES owner(owner_id)
);


CREATE TABLE visit (
  visit_id INTEGER PRIMARY KEY,
  animal_name VARCHAR(50),
  visit_date DATE,
  reason TEXT,
  cost DECIMAL(10,2),
  FOREIGN KEY (animal_name) REFERENCES animal(name)
);


CREATE TABLE treatment (
  treatment_id INTEGER PRIMARY KEY,
  visit_id INTEGER,
  description TEXT,
  medicine TEXT,
  FOREIGN KEY (visit_id) REFERENCES visit(visit_id)
);


CREATE TABLE appointment (
  appointment_id INTEGER PRIMARY KEY,
  animal_name VARCHAR(50),
  owner_id INTEGER,
  appointment_date DATE,
  purpose TEXT,
  FOREIGN KEY (animal_name) REFERENCES animal(name),
  FOREIGN KEY (owner_id) REFERENCES owner(owner_id)
);


INSERT INTO animal(name, age, type, breed) VALUES
('Whiskers', 3, 'Dog', 'Labrador Retriever'),
('Mittens', 2, 'Cat', 'Tabby Cat'),
('Boots', 4, 'Dog', 'German Shepherd'),
('Shadow', 3, 'Cat', 'Persian Cat'),
('Tiger', 5, 'Dog', 'Golden Retriever'),
('Mochi', 1, 'Cat', 'Siamese Cat'),
('Noodle', 2, 'Dog', 'Beagle'),
('Pickles', 4, 'Cat', 'Maine Coon'),
('Pudding', 6, 'Dog', 'Bulldog'),
('Pax', 2, 'Cat', 'British Shorthair');


INSERT INTO owner(owner_id, name, phone) VALUES
(1, 'mahi', '9876543210'),
(2, 'pavithra', '9123456789'),
(3, 'karki', '9988776655'),
(4, 'ravi', '9012345678'),
(5, 'anita', '9098765432'),
(6, 'suresh', '9345678901'),
(7, 'deepa', '9456781234'),
(8, 'arjun', '9567892345'),
(9, 'neha', '9678903456'),
(10, 'vijay', '9789014567');


INSERT INTO pet_owner(animal_name, owner_id) VALUES
('Whiskers', 1),
('Mittens', 2),
('Boots', 3),
('Shadow', 4),
('Tiger', 5),
('Mochi', 6),
('Noodle', 7),
('Pickles', 8),
('Pudding', 9),
('Pax', 10);


INSERT INTO visit(visit_id, animal_name, visit_date, reason, cost) VALUES
(1, 'Pax', '2025-08-01', 'Vaccination', 800),
(2, 'Whiskers', '2025-08-03', 'Checkup', 300),
(3, 'Tiger', '2025-08-05', 'Injury', 1200),
(4, 'Shadow', '2025-08-10', 'Dental Cleaning', 600),
(5, 'Mittens', '2025-08-13', 'Vaccination', 700),
(6, 'Boots', '2025-08-14', 'Checkup', 300),
(7, 'Mochi', '2025-08-17', 'Injury', 1200),
(8, 'Noodle', '2025-08-18', 'Fever', 400),
(9, 'Pickles', '2025-08-19', 'Vaccination', 800),
(10, 'Pudding', '2025-08-20', 'Checkup', 350);


INSERT INTO treatment(treatment_id, visit_id, description, medicine) VALUES
(1, 1, 'DAP Vaccine','distemper'),
(2, 2, 'Leptospirosis', 'bacterial disease'),
(3, 3, 'Canine Influenza Vaccine', 'respiratory'),
(4, 4, 'Lyme Disease', 'fever'),
(5, 5, 'Rabies Vaccine', 'antiviral'),
(6, 6, 'General Checkup', 'none'),
(7, 7, 'Wound Dressing', 'antiseptic'),
(8, 8, 'Fever Treatment', 'paracetamol'),
(9, 9, 'FVRCP Vaccine', 'viral'),
(10, 10, 'Weight Monitoring', 'none');


INSERT INTO appointment(appointment_id, animal_name, owner_id, appointment_date, purpose) VALUES
(1, 'Whiskers', 1, '2025-08-22', 'Annual Checkup'),
(2, 'Mittens', 2, '2025-08-23', 'Vaccination'),
(3, 'Boots', 3, '2025-08-24', 'Grooming'),
(4, 'Shadow', 4, '2025-08-25', 'Dental Cleaning'),
(5, 'Tiger', 5, '2025-08-26', 'Injury Follow-up'),
(6, 'Mochi', 6, '2025-08-27', 'Behavioral Consultation'),
(7, 'Noodle', 7, '2025-08-28', 'Flea Treatment'),
(8, 'Pickles', 8, '2025-08-29', 'Vaccination'),
(9, 'Pudding', 9, '2025-08-30', 'Weight Check'),
(10, 'Pax', 10, '2025-08-31', 'Eye Exam');


SELECT * FROM animal WHERE age > 4;
SELECT * FROM visit WHERE cost < 500;
SELECT * FROM appointment WHERE appointment_date = '2025-08-28';


SELECT * FROM owner WHERE name LIKE 'ka%';


SELECT animal_name, SUM(cost) AS total_spent
FROM visit
WHERE animal_name = 'Tiger'
GROUP BY animal_name;


SELECT a.name AS pet_name, a.type, o.name AS owner_name, o.phone
FROM pet_owner po
JOIN animal a ON po.animal_name = a.name
JOIN owner o ON po.owner_id = o.owner_id;


SELECT v.animal_name, v.visit_date, v.reason, v.cost, t.description, t.medicine
FROM visit v
JOIN treatment t ON v.visit_id = t.visit_id;


