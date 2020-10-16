/*COMPLEX QUERY 2: String Patterns*/
USE LifeSimulationGame;
GO

/*Print Sims with names starting with K and their properties*/
SELECT s.Name AS FullName, p.PropertyAddress
FROM Sim s LEFT OUTER JOIN Property p
ON p.SimID = s.SimID
WHERE s.Name LIKE 'K%';

/*Print Towns in Winter*/
SELECT t.TownName, m.MonthName, m.SeasonName, m.Weather, m.Temperature
FROM Town t LEFT OUTER JOIN Months m
ON t.TownID = m.MonthID
WHERE m.SeasonName LIKE 'W%_____';

/*Print Towns in seasons starting with S*/
SELECT t.TownName, m.MonthName, m.SeasonName, m.Weather, m.Temperature
FROM Town t LEFT OUTER JOIN Months m
ON t.TownID = m.MonthID
WHERE m.SeasonName LIKE 'S%';

/*Print families with name starting with G*/
SELECT h.FamilyName, h.Wealth, t.TownName
FROM Household h LEFT OUTER JOIN Town t
ON h.HouseholdID = t.TownID
WHERE h.FamilyName LIKE 'G%';
/*Print families with names excluding starting with P*/
Select c.LotName, c.CommunityType
FROM Community c
WHERE c.LotName NOT LIKE 'p%';