USE athletic;
# question 1
SELECT EventNo, DateHeld, EventRequest.CustNo, Custname, EventRequest.FacNo, FacName 
FROM EventRequest, Customer, Facility 
WHERE EventRequest.CustNo = Customer.CustNo AND EventRequest.FacNo = Facility.FacNo AND YEAR(DateHeld) = 2013 AND Customer.City = 'Boulder';
# question 2
SELECT EventRequest.CustNo, Custname, EventNo, DateHeld, EventRequest.FacNo, FacName, EstCost / EstAudience AS EstCostPerPerson 
FROM Customer, EventRequest, Facility 
WHERE YEAR(DateHeld) = 2013 
HAVING EstCostPerPerson < 0.2;
# question 3
SELECT EventRequest.CustNo, Custname, SUM(EstCost) AS TotalEstCost
FROM Customer, EventRequest 
WHERE EventRequest.CustNo = Customer.CustNo AND Status = 'Approved' GROUP BY CustNo, Custname;
# question 4
INSERT INTO Customer 
VALUES ('Z100', 'Arnold Taremwa', '2016 My Street', 'Y', 'Billy Bob', '1112223', 'Kampala', 'GG', '90909');
select * from Customer;
# question 5
UPDATE ResourceTbl
SET Rate = Rate * 1.1
WHERE ResName = 'nurse';
SELECT * FROM ResourceTbl;
# question 6
DELETE FROM Customer
WHERE Custname = 'Arnold Taremwa';
select * from Customer;

# for updating 
#SET SQL_SAFE_UPDATES = 1;
#SET SQL_SAFE_UPDATES = 0;