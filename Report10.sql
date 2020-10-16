/*COMPLEX QUERY 10: Mix Of Some Features*/
USE LifeSimulationGame;
GO
/*Fairies in the world*/
SELECT s.Name AS FullName, p.SupernaturalKind AS Race
FROM Sim s INNER JOIN Supernatural p 
ON s.Supernatural=p.SupernaturalID 
WHERE p.SupernaturalKind = 'Fairy';

/*Witches in the world*/
SELECT s.Name AS FullName, p.SupernaturalKind AS Race
FROM Sim s INNER JOIN Supernatural p 
ON s.Supernatural=p.SupernaturalID 
WHERE p.SupernaturalKind = 'Witch';

/*Vampires in the world*/
SELECT s.Name AS FullName, p.SupernaturalKind AS Race
FROM Sim s INNER JOIN Supernatural p 
ON s.Supernatural=p.SupernaturalID 
WHERE p.SupernaturalKind = 'Vampire';

/*Ages of citizens*/
SELECT s.Age, s.Name, h.FamilyName, h.Wealth, t.TownName
FROM Sim s LEFT OUTER JOIN Household h
ON s.HouseholdID = h.HouseholdID
LEFT JOIN Town t
ON h.TownID = t.TownID
ORDER BY s.Age DESC;

/*General Information of a household*/
SELECT COUNT(s.SimID) AS NumOfSimsInEachHousehold, MAX(Age) AS OldestAge, MIN(Age) AS YoungestAge, AVG(((((j.Wage * 10) * 5) * 4) * 12)) AS AverageIncome
FROM Sim s INNER JOIN Household h
ON s.HouseholdID = h.HouseholdID
LEFT JOIN Job j
ON j.SimID = s.SimID
GROUP BY h.HouseholdID 

