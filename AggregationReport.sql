/*COMPLEX QUERY 7: Aggregation functions */
USE LifeSimulationGame;
GO
SELECT COUNT(s.SimID) AS NumOfSimsInEachHousehold, MAX(((((j.Wage * 10) * 5) * 4) * 12)) AS AnnualIncomeOfHousehold
FROM Sim s INNER JOIN Household h
ON s.HouseholdID = h.HouseholdID
LEFT JOIN Job j
ON j.SimID = s.SimID
GROUP BY h.HouseholdID 