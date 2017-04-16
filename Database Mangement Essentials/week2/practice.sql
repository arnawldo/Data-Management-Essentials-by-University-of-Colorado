USE practice;

DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS OrderTbl;

CREATE TABLE Customer
(
CustNo varchar(10),
CustFisrtName varchar(20) NOT NULL,
CustLastName varchar(20) NOT NULL,
CustCity varchar(15),
CustState varchar(3),
CustZip varchar(10),
CustBal decimal(19, 2),
CONSTRAINT PKCustNo PRIMARY KEY (CustNo)
);

CREATE TABLE Employee
(
EmpNo varchar(10),
EmpFirstName varchar(10) NOT NULL,
EmpLastName varchar(10) NOT NULL,
EmpPhone varchar(15),
EmpEmail varchar(30) NOT NULL,
CONSTRAINT PKEmpNo PRIMARY KEY (EmpNo),
CONSTRAINT UniqueEmpEMail UNIQUE (EmpEmail)
);

CREATE TABLE OrderTbl
(
OrdNo varchar(10),
OrdDate varchar(10)  NOT NULL,
CustNo varchar(10) NOT NULL,
EmpNo varchar(10),
CONSTRAINT PKOrdNo PRIMARY KEY (OrdNo),
CONSTRAINT FKCustNo FOREIGN KEY (CustNo) REFERENCES Customer(CustNo),
CONSTRAINT FKEmpNo FOREIGN KEY (EmpNo) REFERENCES Employee(EmpNo)
);

