# Using MYSQL
USE athletic;
# Question 1
SELECT DISTINCT City, State, Zip FROM Customer;
# Question 2
SELECT EmpName, Department, Email FROM Employee WHERE Phone LIKE '3-%';
# Question 3
SELECT * FROM ResourceTbl WHERE Rate BETWEEN 10 AND 20 ORDER BY Rate;
# Question 4
SELECT EventNo, DateAuth, Status FROM EventRequest WHERE Status IN ('Approved','Denied') AND  YEAR(DateAuth) = 2013 AND MONTH(DateAuth) = 07;
# Question 5
SELECT LocNo, Locname FROM Location, Facility WHERE Facility.FacName = 'Basketball arena';
# Question 6
SELECT PlanNo, COUNT(*) AS PlanCount, SUM(NumberFld) AS NumResources  FROM EventPlanLine GROUP BY PlanNo;