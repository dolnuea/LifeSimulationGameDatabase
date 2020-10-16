/*COMPLEX QUERY 3: Sets*/
USE LifeSimulationGame;
GO
/*Print those who are of ages 50, 77, 22 and are occupied with the specified roles*/
SELECT s.Name AS FullName, s.Age, s.PersonalInfo AS Personality, j.Wage, j.Position
FROM Sim s LEFT OUTER JOIN Job j
ON j.SimID = s.SimID
WHERE s.Age IN (50, 77, 22) AND j.Position IN ('Investigator','Dishwasher','Freelance Singer','Sales Associate');

/*Print communities with business*/
SELECT c.LotName, c.CommunityType
FROM Community c
WHERE C.CommunityType IN (SELECT b.BusinessType FROM Business b)
