/* Question1 */
SELECT COUNT(ProductID) as [production count]
FROM Production.Product

/* Question2 */
SELECT COUNT(ProductID) as [production count]
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL

/* Question3 */
SELECT COUNT(ProductID) as [production count], ProductSubcategoryID
FROM Production.Product
GROUP BY ProductSubcategoryID

/* Question4 */
SELECT COUNT(ProductID) as [production count]
FROM Production.Product
WHERE ProductSubcategoryID IS NULL

/* Question5 */
SELECT SUM(Quantity) as [Production quantity sum]
FROM Production.ProductInventory

/* Question6 */
SELECT ProductID, SUM(Quantity) AS [Production quantity sum]
FROM Production.ProductInventory
WHERE LocationID = 40
GROUP BY ProductID
HAVING SUM(Quantity) < 100;

/* Question7 */
SELECT Shelf, ProductID, SUM(Quantity) AS TheSum
FROM Production.ProductInventory
WHERE LocationID = 40
GROUP BY Shelf, ProductID
HAVING SUM(Quantity) < 100;

/* Question8 */
SELECT AVG(Quantity) as TheAvg
FROM Production.ProductInventory
WHERE LocationID = 10

/* Question9 */
SELECT ProductID, Shelf, AVG(Quantity) as TheAvg
FROM Production.ProductInventory
GROUP BY ProductID, Shelf

/* Question10 */
SELECT ProductID, Shelf, AVG(Quantity) as TheAvg
FROM Production.ProductInventory
WHERE Shelf <> 'N/A'
GROUP BY ProductID, Shelf

/* Question11 */
SELECT Color, Class, COUNT(ProductID) as TheCount, AVG(ListPrice) as AvgPrice
FROM Production.Product
WHERE Color IS NOT NULL AND Class IS NOT NULL
GROUP BY Color, Class

/* Question12 */
SELECT c.name as Country, s.name as Province
FROM person.CountryRegion c
JOIN person.StateProvince s ON c.CountryRegionCode = s.CountryRegionCode

/* Question13 */
SELECT c.name as Country, s.name as Province
FROM person.CountryRegion c
JOIN person.StateProvince s ON c.CountryRegionCode = s.CountryRegionCode
WHERE c.Name = 'Germany' OR c.Name = 'Canada'

