-- angelegt von Oman
-- angelgeg am 13.2.23
-- Quelle: Gerhard Lanzenberger
-- \source C:\Users\morit\Documents\3AHIT\INSY\gkk_tables_oman.sql


drop database if exists gkk;
create database gkk;

use gkk;

create table patient(
    SVNR VARCHAR (10) not null primary key,
    firstName VARCHAR (100),
    lastName VARCHAR (100),
    streetnumber VARCHAR (10),
    street VARCHAR (30),
    postcode VARCHAR (10),
    area VARCHAR (30),
    birthday date
);

create table hasAllergyTo(
    SVNR INT NOT NULL REFERENCES patient (SVNR),
    IID INT NOT NULL REFERENCES ingredient (IID),
    PRIMARY KEY (SVNR, IID)
);

create table doctor(
    physicianNumber int auto_increment not null primary key,
    firstName VARCHAR (100),
    lastName VARCHAR (100),
    streetnumber VARCHAR (10),
    street VARCHAR (30),
    postcode VARCHAR (10),
    area VARCHAR (30),
    birthday date
);

create table visit(
    visit_id int not null auto_increment primary key,
    visit_date date,
    main_diagnosis varchar(255),
    SVNR char(10) not null references patient(SVNR),
    physicianNumber int not null references doctor(physicianNumber),
    ICDNr int not null references ICD(ICDNr)
);

create table ICD(
    ICDNr int not null primary key,
    description varchar(255)
);

create TABLE secondaryDiagnosis(
    ICDNr INT NOT NULL REFERENCES ICD (ICDNr),
    visit_id INT NOT NULL REFERENCES visit (visit_id),
    PRIMARY KEY (ICDNr, visit_id)
);

CREATE TABLE PharmaCompany (
    PCid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(30)
);

create table Drug(
    drugID int(10) not null primary key auto_increment,
    name varchar(50),
    color varchar(20),
    shape varchar(50),
    size varchar(50),
    type varchar(50),
    price decimal(5, 3),
    PCid int(10),
    foreign key (PCid) references PharmaCompany(PCid),
    isGenericaOf int references Drug(drugID)
);

create table Ingredient(
    IID int not null auto_increment primary key,
    ingredientDescription varchar(100)
);

CREATE TABLE relat_drug_ingr (
    quantity float,
    drugID INT NOT NULL REFERENCES Drug (drugID),
    IID INT NOT NULL REFERENCES ingredient (IID),
    PRIMARY KEY (drugID, IID)
);

CREATE TABLE packaging (
    packid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(20),
    size VARCHAR(20),
    storage VARCHAR(20),
    color VARCHAR(20),
    drugID INT,
    FOREIGN KEY (drugID)
        REFERENCES Drug (drugID)
);

create table Medication(
    MedicationId int not null auto_increment,
    typeOfMedication varchar(50),
    morning boolean,
    noon boolean,
    evening boolean,
    visit_id int,
    packid int not null references packaging(packid),
    primary key(MedicationId, packid),
    foreign key(visit_id) references visit (visit_id)
);

show tables;
