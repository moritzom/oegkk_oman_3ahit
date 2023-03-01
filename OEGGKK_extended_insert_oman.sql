-- \source C:\Users\morit\Documents\3AHIT\INSY\OEGGKK_extended_insert_oman.sql
INSERT INTO patient (SVNR, firstName, lastName, streetnumber, street, postcode, area, birthday)
VALUES ('1234567890', 'Moritz', 'Oman', '10', 'Bauordenstr', '4600', 'Wels', '2006-09-14');


INSERT INTO doctor (firstName, lastName, streetnumber, street, postcode, area, birthday)
VALUES ('Sarah', 'Smith', '5', 'Broadway', '23456', 'New York', '1980-05-05');


INSERT INTO hasAllergyTo (SVNR, IID)
VALUES ('1234567890', 1);


INSERT INTO visit (visit_date, main_diagnosis, SVNR, physicianNumber, ICDNr)
VALUES ('2023-02-20', 'Flu', '1234567890', 1, 1),
('2023-02-25', 'Migraine', '1234567890', 1, 2);


INSERT INTO ICD (ICDNr, description)
VALUES (1, 'Influenza due to unidentified influenza virus with pneumonia'),
(2, 'Migraine without aura, intractable, with status migrainosus'),
(3, 'Chronic obstructive pulmonary disease');


INSERT INTO secondaryDiagnosis (ICDNr, visit_id)
VALUES (3, 1);


INSERT INTO PharmaCompany (Name) VALUES
('Pfizer'),
('Novartis'),
('Roche'),
('Bayer'),
('GSK');

INSERT INTO Drug (name, color, shape, size, type, price, PCid)
VALUES ('Aspirin', 'White', 'Round', 'Small', 'Tablet', 0.50, 1),
('Lisinopril', 'Yellow', 'Oval', 'Medium', 'Tablet', 2.50, 2),
('Metoprolol', 'Pink', 'Round', 'Medium', 'Tablet', 1.50, 2),
('Simvastatin', 'Blue', 'Oval', 'Large', 'Tablet', 3.50, 3),
('Omeprazole', 'Purple', 'Round', 'Small', 'Capsule', 4.50, 4);


INSERT INTO ingredient (ingredientDescription)
VALUES ('Aspirin'),
('Lisinopril'),
('Metoprolol'),
('Simvastatin'),
('Omeprazole'),
('Acetaminophen'),
('Ibuprofen'),
('Diphenhydramine'),
('Guaifenesin'),
('Pseudoephedrine');


INSERT INTO packaging (type, size, storage, color, drugID)
VALUES ('Bottle', 'Small', 'Cool and dry place', 'Blue', 1),
('Box', 'Medium', 'Cool and dry place', 'Green', 2),
('Blister', 'Large', 'Cool and dry place', 'Red', 3);


INSERT INTO Medication (typeOfMedication, morning, noon, evening, visit_id, packid)
VALUES ('Painkiller', true, false, false, 1, 1),
('Blood press. med.', true, true, false, 2, 2);