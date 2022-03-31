/*CIS0 Project 1
Group Name
Name1: Naga Nano
Name2: Emmanuella Shokare
Name3: Edward Kiawoin
Name4: SirawDink Wolde
*/

/*creating data base 
Create DATABASE WELLNEADOWSHOSPITAL;
USE WELLMEADOWSHOSPITAL;

/*STAFF TABLE*/
CREATE TABLE STAFF (
  StaffNumber int not null,
  FirstName varchar(200),
  LastName varchar(200),
  FullAddress varchar(500),
  PhoneNumber varchar(15),
  Sex varchar(50),
  NIN int,
  Position varchar(200),
  CurrentSalary float,
  SalaryScale varchar(200),
  DateOfQualification date,
  TypeOfQualification varchar(200),
  NameOfInstitution varchar(200),
  OrganizationName varchar(200),
  OrgazationPosition varchar(200),
  FinishDate date,
  HoursPerWeek int,
  TypeOfContract varchar(50),
  TypeOfSalary Varchar(50),
  PRIMARY KEY (StaffNumber)
);
/*PATIENT TABLE*/
CREATE TABLE PATIENTS(
  PatientNumber int not null,
  PatientFirstName varchar(200),
  PatientLastName varchar(200),
  PatientAddress varchar(500),
  PhoneNumber varchar(15),
  DateOfBirth date,
  Sex varchar(50),
  DateRegistared date,
  WaitListDate date,
  WardNumber varchar(20),
  ExpectedStay int,
  DateIPlaced date,
  ActualLeave date,
  BedNumber int,
  StaffNumber int,
  PRIMARY KEY (PatientNumber),
   FOREIGN KEY (StaffNumber) References STAFF (StaffNumber),
    FOREIGN KEY (WardNumber) References WARD (WardNumber)
);

/*WARD TABLE*/
CREATE TABLE WARD (
  WardNumber varchar(20) NOT NULL,
  WardName varchar(200),
  WardLocation varchar(200),
  NumberOfBeds int,
  PhoneExtension int,
  PRIMARY KEY (WardNumber)
);
/*PATIENTAPPOINTMENT TABLE*/
CREATE TABLE PATIENTAPPOINTMENT (
  AppointmentNumber int NOT NULL,
  PatientFirstName varchar(200),
  PatientLastName varchar(200),
  StaffNumber int,
  AppointmentDate date,
  AppointmentTime time,
  RoomNumber Int,
  PatientNumber int,
  PRIMARY KEY (AppointmentNumber),
  FOREIGN KEY (PatientNumber) References PATIENT (PatientNumber),
  FOREIGN KEY (StaffNumber) References STAFF (StaffNumber)
);

/*LOCALDOCTORS TABLE*/
CREATE TABLE LOCALDOCTORS (
  DoctorName varchar(200),
  ClinicNumber varchar(50)  NOT NULL,
  ClinicAddress varchar(500),
  ClinicPhoneNumber varchar(15),
  PatientNumber int,
  PRIMARY KEY (ClinicNumber),
  FOREIGN KEY (PatientNumber) References PATIENT (PatientNumber)
);
/*PATIENTSNEXTKIN TABLE*/
CREATE TABLE PATIENTSNEXTKIN (
  PatientNextKinName varchar(200),
  RelatioshipToPatient varchar(200),
  PatientNextKinAddress varchar(500),
  PatientNextKinPhone varchar(15),
  PatientNumber int,
  Primary Key (PatientNextKinName),
  FOREIGN KEY (PatientNumber) References PATIENT (PatientNumber)
);
/*MEDICATION TABLE*/
CREATE TABLE MEDICATION (
  MedicationNumber int not null,
  PatientNumber int,
  UnitsPerDay int,
  Methods varchar(50),
  StartDate date,
  EndDate date,
  PRIMARY KEY (MedicationNumber),
  FOREIGN KEY (PatientNumber) References PATIENT (PatientNumber)
);
/*SUPPLIER TABLE*/
CREATE TABLE SUPPLIER (
  SupplierNumber int not null,
  SupplierName varchar(200),
  SupplierAddress varchar(200),
  SupplierPhoneNumber varchar(15),
  SupplierFaxNumber Varchar(20),
  PRIMARY KEY (SupplierNumber)
);
/*PHARMACEUTICALSUPPLIES TABLE*/
CREATE TABLE PHARMACEUTICALSUPPLIES (
  DrugNumber int not null ,
  DrugName varchar(200),
  DrugDescription varchar(500),
  Dosage varchar(500),
  Method varchar(50),
  QuantityInStock int,
  RecorderLeve int,
  CostPerUnit float,
  SupplierNumber int,
  PRIMARY KEY (DrugNumber),
  FOREIGN KEY (SupplierNumber) References SUPPLIER (SupplierNumber)
);

/*SURGICALANDNONSURGICALSUPPLIES TABLE*/
CREATE TABLE SURGICALANDNONSURGICALSUPPLIES (
  ItemNumber int NOT NULL,
  ItemName varchar(200),
  ItemDescription varchar(500),
  QuantityInStock int,
  RecorderLevel int,
  CostPerUnit int,
  SupplierNumber int,
  PRIMARY KEY (ItemNumber),
  FOREIGN KEY (SupplierNumber) References Supplier (SupplierNumber)
);

/* WARDREQUISITIONS TABLE*/
CREATE TABLE  WARDREQUISITIONS(
  RequisitionNumber int not null,
  StaffName varchar(200),
  WardName varchar(200),
  WardNumber  int,
  ItemNumber int,
  DrugNumber int,
  QuantityOfDrug int,
  DateOrdered date,
  StaffNumber int,
  PRIMARY KEY (RequisitionNumber),
  FOREIGN KEY (WardNumber) References WARD (WardNumber),
  FOREIGN KEY (ItemNumber) References SURGICALANDNONSURGICALSUPPLIES  (	ItemNumber),
  FOREIGN KEY (DrugNumber) References pharmaceuticalssupplies (DrugNumber)
);










