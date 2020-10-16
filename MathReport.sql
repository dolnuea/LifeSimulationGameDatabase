/*COMPLEX QUERY 6: Math/Concatenation on Data*/
USE LifeSimulationGame;
GO

SELECT s.Name + ' has personality traits: ' + s.PersonalInfo + '. Reputation is ' + s.Reputation + ' and lives in ' + t.TownName
FROM Sim s LEFT OUTER JOIN Household h
ON s.HouseholdID = h.HouseholdID
LEFT JOIN Town t
ON h.TownID = t.TownID;

SELECT s.Name, s.Age, j.Position, j.Wage, ((((j.Wage * 10) * 5) * 4) * 12) AS Salary, b.BusinessType, b.CustomerSatisfaction,b.StockPrice
FROM Job j LEFT OUTER JOIN Sim s
ON j.SimID = s.SimID
LEFT JOIN Business b
ON j.BusinessID = b.BusinessID;
