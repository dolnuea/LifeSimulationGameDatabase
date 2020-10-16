/*COMPLEX QUERY 1: Column Renaming*/
USE LifeSimulationGame;
GO

/*Print All Races*/
SELECT s.Name AS FullName, p.SupernaturalKind AS Race
FROM Sim s LEFT OUTER JOIN Supernatural p 
ON s.Supernatural=p.SupernaturalID;

/*Print All Occupation*/
SELECT s.Name, j.Position 
FROM Sim s INNER JOIN Job j 
ON s.SimID=j.JobID;

/*Print All Households*/
SELECT c.LotName 
FROM Community c;
SELECT h.FamilyName, t.TownName 
FROM Household h INNER JOIN Town t 
ON h.TownID=t.TownID;