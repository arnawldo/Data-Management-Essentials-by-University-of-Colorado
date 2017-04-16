use athletic;

# SELECT STATEMENT PROBLEMS

# question 1
SELECT EventRequest.EventNo, DateHeld, COUNT(PlanNo) AS PlanCount
FROM EventRequest, EventPlan 
WHERE EventRequest.EventNo = EventPlan.EventNo AND
	YEAR(WorkDate) =  2013 AND 
    MONTH(WorkDate) = 12
GROUP BY EventRequest.EventNo
HAVING PlanCount > 1;

# question 2
SELECT PlanNo, EventPlan.EventNo, WorkDate, Activity, FacName 
FROM EventPlan, EventRequest, Facility
WHERE EventPlan.EventNo = EventRequest.EventNo
	AND EventRequest.FacNo = Facility.FacNo 
    AND YEAR(WorkDate) = 2013 
    AND MONTH(workdate) = 12
    AND FacName = 'Basketball arena';

# question 3

SELECT EventRequest.EventNo, DateHeld, Status, EstCost 
FROM EventRequest, EventPlan, Employee, Facility 
WHERE EventRequest.FacNo = Facility.FacNo 
	AND EventRequest.EventNo = EventPlan.EventNo
    AND EventPlan.EmpNo = Employee.EmpNo
	AND EmpName = 'Mary Manager' 
	AND FacName = 'Basketball arena'
    AND DateHeld BETWEEN '2013-10-01' AND '2013-12-31';

# question 4
SELECT EventPlanLine.PlanNo, LineNo, ResName, NumberFld, Locname, TimeStart, TimeEnd 
FROM Location, EventPlanLine, ResourceTbl, Facility, EventPlan
WHERE EventPlanLine.ResNo = ResourceTbl.ResNo
	AND EventPlanLine.LocNo = Location.LocNo
    AND Location.FacNo = Facility.FacNo
    AND EventPlanLine.PlanNo = EventPlan.PlanNo
    AND FacName = 'Basketball arena'
    AND Activity = 'Operation'
    AND WorkDate BETWEEN '2013-10-01' AND '2013-12-31';

# DATABASE MODIFICATION PROBLEMS

# Question 1
INSERT INTO Facility VALUES ('F104','Swimming Pool');
SELECT * FROM Facility;

# Question 2
INSERT INTO Location VALUES ('L107', 'F104', 'Door');
SELECT * FROM Location;

# Question 3
INSERT INTO Location VALUES ('L108', 'F104', 'Locker Room');
SELECT * FROM Location;

# Question 4
UPDATE Location
SET Locname = 'Gate'
WHERE LocNo = 'L107';
SELECT * FROM Location;

# Question 5
DELETE FROM Location
WHERE LocNo = 'L108';
SELECT * FROM Location;