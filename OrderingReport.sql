/*COMPLEX QUERY 5: Ordering*/
USE LifeSimulationGame;
GO

SELECT s.Age, s.Name, j.Position, j.Wage, ((((j.Wage * 10) * 5) * 4) * 12) AS SALARY
FROM Sim s LEFT OUTER JOIN Job j
ON s.SimID = j.SimID
ORDER BY SALARY DESC;

SELECT p.PropertyValue, p.AreaSize, s.Name AS OwnerName, r.ResidentialType, r.RentPrice, t.TownName
FROM Property p LEFT OUTER JOIN Sim s
ON p.SimID=s.SimID
LEFT JOIN Residential r
ON r.PropertyID = p.PropertyID
LEFT JOIN Town t
ON p.TownID = t.TownID
ORDER BY PropertyValue;