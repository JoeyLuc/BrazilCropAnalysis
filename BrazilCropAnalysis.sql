----------------------------------------------------------------------------------------------------------------------------------------------------------

--Show all data 
SELECT *
FROM PortfolioProject.dbo.crop;

----------------------------------------------------------------------------------------------------------------------------------------------------------


--Show all top crops that Brazil has produced and the total yield in 2020
SELECT Item, SUM(Value) AS TotalYield
FROM PortfolioProject.dbo.crop
WHERE Area = 'Brazil' and Element = 'Yield' and Year = '2020'
GROUP BY Area, Item
ORDER BY 2 DESC
OFFSET 0 ROWS
FETCH NEXT 15 ROWS ONLY;


----------------------------------------------------------------------------------------------------------------------------------------------------------


--Show all top crops that Brazil has produced and the total production in 2020
SELECT Item, SUM(Value) AS TotalProduction
FROM PortfolioProject.dbo.crop
WHERE Area = 'Brazil' and Element = 'Production' and Year = '2020'
GROUP BY Area, Item
ORDER BY 2 DESC
OFFSET 0 ROWS
FETCH NEXT 15 ROWS ONLY;;


----------------------------------------------------------------------------------------------------------------------------------------------------------


--Show the yearly change in total harvest from 2020
SELECT Item, SUM(Value) AS TotalAreaHarvested
FROM PortfolioProject.dbo.crop
WHERE Area = 'Brazil' and Element = 'Area harvested' and Year = '2020'
GROUP BY Area, Item
ORDER BY 2 DESC
OFFSET 0 ROWS
FETCH NEXT 15 ROWS ONLY;


----------------------------------------------------------------------------------------------------------------------------------------------------------
--Sugarcane is Brazil's top crop in yield and production segments. 
--Let's see how sugar cane has varied over years.
----------------------------------------------------------------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------------------------------------------------------------


--Production x Year of sugarcane 
SELECT Year, SUM(Value) AS TotalProduction
FROM PortfolioProject.dbo.crop
WHERE Area = 'Brazil' and Element = 'Production' and Item = 'Sugar Cane'
GROUP BY Item, Year
ORDER BY 1 ASC;


----------------------------------------------------------------------------------------------------------------------------------------------------------


--Yield x Year of sugarcane compare to top competitor and rest of the world
SELECT Area, Year, SUM(Value) AS TotalYield
FROM PortfolioProject.dbo.crop
WHERE (Area = 'Brazil' or Area = 'Peru') and Item = 'Sugar cane' and Element = 'Yield'
GROUP BY Area, Item, Year
ORDER BY 1 ASC;


----------------------------------------------------------------------------------------------------------------------------------------------------------
