/*COMPLEX QUERY 9: Correlated Subquery*/
USE LifeSimulationGame;
GO

/*Find the household with most income*/
SELECT  h.HouseholdID, h.FamilyName,COUNT(s.SimID) AS NumOfSimsInEachHousehold, MAX(((((j.Wage * 10) * 5) * 4) * 12)) AS AnnualIncomeOfHousehold
FROM Sim s INNER JOIN Household h
ON s.HouseholdID = h.HouseholdID
LEFT JOIN Job j
ON j.SimID = s.SimID
WHERE Wage = 
    (SELECT MAX(Wage) FROM Job)
	GROUP BY h.HouseholdID, h.FamilyName
