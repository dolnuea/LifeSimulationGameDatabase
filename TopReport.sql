/*COMPLEX QUERY 8: TOP*/
USE LifeSimulationGame;
GO
/*Top 5 companies to work at*/
SELECT TOP 5 s.Name, s.Age, j.Position, J.Wage, b.BusinessType, b.CustomerSatisfaction, b.StockPrice, c.LotName, p.PropertyValue
FROM Business b 
LEFT OUTER JOIN Job j
ON j.BusinessID = b.BusinessID
LEFT OUTER JOIN Sim s
ON j.SimID = s.SimID
LEFT OUTER JOIN Property p
ON b.PropertyID = p.PropertyID
LEFT OUTER JOIN Community c
ON c.PropertyID = p.PropertyID
WHERE b.CustomerSatisfaction > 7
ORDER BY Wage DESC;
