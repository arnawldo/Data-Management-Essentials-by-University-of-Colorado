USE athletic;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS ResourceTbl;
DROP TABLE IF EXISTS EventPlanLine;
DROP TABLE IF EXISTS EventPlan;
DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS EventRequest;
DROP TABLE IF EXISTS Facility;
DROP TABLE IF EXISTS Customer;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE Customer
(
CustNo varchar(4) NOT NULL PRIMARY KEY,
Custname varchar(30),
Address varchar(20) NOT NULL,
Internal char(1) NOT NULL,
Contact varchar(20) NOT NULL,
Phone int(15) NOT NULL,
City varchar(20) NOT NULL,
State varchar(3) NOT NULL,
Zip int(5) NOT NULL
);

CREATE TABLE Facility
(
FacNo varchar(4) NOT NULL PRIMARY KEY,
FacName varchar(20) NOT NULL,
CONSTRAINT UniqueFacName UNIQUE (FacName)
);

CREATE TABLE Location
(
LocNo varchar(4) NOT NULL PRIMARY KEY,
FacNo varchar(4) NOT NULL,
Locname varchar(15) NOT NULL,
CONSTRAINT FKLocationFacNo FOREIGN KEY (FacNo) REFERENCES Facility(FacNo)
);

CREATE TABLE EventRequest
(
EventNo varchar(4) PRIMARY KEY NOT NULL,
DateHeld DATE NOT NULL,
DateReq DATE NOT NULL,
FacNo varchar(4) NOT NULL,
CustNo varchar(4) NOT NULL,
DateAuth DATE,
Status varchar(10) NOT NULL CHECK ( Status IN ('Pending','Approved','Denied')),
EstCost decimal(15,2) NOT NULL,
EstAudience int(6) NOT NULL CHECK (EstAudience > 0),
BudNo varchar(5),
CONSTRAINT FKEventRequestCustNo FOREIGN KEY (CustNo) REFERENCES Customer(CustNo),
CONSTRAINT FKEventRequestFacNo FOREIGN KEY (FacNo) REFERENCES Facility(FacNo)
);

CREATE TABLE Employee
(
EmpNo varchar(4) PRIMARY KEY NOT NULL,
EmpName varchar(20) NOT NULL,
Department varchar(15) NOT NULL,
Email varchar(20) NOT NULL,
Phone varchar(10) NOT NULL
);

CREATE TABLE ResourceTbl
(
ResNo varchar(4) PRIMARY KEY NOT NULL,
ResName varchar(20) NOT NULL,
Rate decimal(5,2) NOT NULL CHECK ( Rate > 0)
);

CREATE TABLE EventPlan
(
PlanNo varchar(4) PRIMARY KEY NOT NULL,
EventNo varchar(4) NOT NULL,
WorkDate DATE NOT NULL,
Notes varchar(140),
Activity varchar(10) NOT NULL,
EmpNo varchar(4),
CONSTRAINT FKEventPlanEventNo FOREIGN KEY (EventNo) REFERENCES EventRequest(EventNo),
CONSTRAINT FKEventPlanEmpNo FOREIGN KEY (EmpNo) REFERENCES Employee(EmpNo)
);

CREATE TABLE EventPlanLine
(
PlanNo varchar(4) NOT NULL,
LineNo int(3) NOT NULL,
TimeStart DATETIME NOT NULL CHECK (TimeStart < TimeEnd),
TimeEnd DATETIME NOT NULL,
NumberFld int(3) NOT NULL,
LocNo varchar(4) NOT NULL,
ResNo varchar(4) NOT NULL,
CONSTRAINT PKPlanNoLineNo PRIMARY KEY (PlanNo, LineNo),
CONSTRAINT FKEventPlanLineLocNo FOREIGN KEY (LocNo) REFERENCES Location(LocNo),
CONSTRAINT FKEventPlanLineResNo FOREIGN KEY (ResNo) REFERENCES ResourceTbl(ResNo)
);

