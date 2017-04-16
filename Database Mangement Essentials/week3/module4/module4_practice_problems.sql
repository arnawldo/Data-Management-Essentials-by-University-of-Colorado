SELECT CustNo, CustName, Phone, City FROM Customer;
SELECT CustNo, CustName, Phone, City FROM Customer WHERE State = 'CO';
SELECT * FROM EventRequest WHERE EstCost > 4000 ORDER BY DateHeld;
SELECT EventNo, DateHeld, EstAudience FROM EventRequest WHERE (Status = 'Approved' AND EstAudience > 9000) OR (Status = 'Pending' AND EstAudience > 7000);
SELECT EventNo, DateHeld, Customer.CustNo, CustName FROM EventRequest, Customer WHERE City = 'Boulder' AND YEAR(DateHeld) = 2013 AND EventRequest.CustNo = Customer.CustNo;
SELECT * FROM EventRequest;
SELECT PlanNo, AVG(NumberFld) AS AverageResources FROM EventPlanLine WHERE LocNo = 'L100' GROUP BY PlanNo;
SELECT PlanNo, AVG(NumberFld) AS AverageResources FROM EventPlanLine WHERE LocNo = 'L100' GROUP BY PlanNo HAVING AverageResources > 2;