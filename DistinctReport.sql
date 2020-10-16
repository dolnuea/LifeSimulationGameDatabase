/*COMPLEX QUERY 4: Distinct*/
USE LifeSimulationGame;
GO

/*Select distinct ages in a household in their town*/
SELECT DISTINCT s.Age
FROM Sim s LEFT OUTER JOIN Household h
ON s.HouseholdID = h.HouseholdID
LEFT JOIN Town t
ON h.TownID = t.TownID;

