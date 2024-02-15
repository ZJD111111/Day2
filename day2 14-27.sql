/* Question14 */
SELECT DISTINCT p.ProductName
FROM dbo.Products p
JOIN dbo.[Order Details] od ON p.ProductID = od.ProductID
JOIN dbo.Orders o ON od.OrderID = o.OrderID
WHERE o.OrderDate <= DATEADD(year, -25, GETDATE())

/* Question15 */
SELECT TOP 5 o.ShipPostalCode, COUNT(o.OrderID) AS TotalOrders
FROM dbo.Orders o
GROUP BY o.ShipPostalCode
ORDER BY TotalOrders DESC;

/* Question16 */
SELECT TOP 5 o.ShipPostalCode, COUNT(o.OrderID) AS TotalOrders
FROM dbo.Orders o
WHERE o.OrderDate <= DATEADD(year, -25, GETDATE())
GROUP BY o.ShipPostalCode
ORDER BY TotalOrders DESC;

/* Question17 */
SELECT City, COUNT(CustomerID) as [Number of Customer]
FROM dbo.Customers
GROUP BY City

/* Question18 */
SELECT City, COUNT(CustomerID) as [Number of Customer]
FROM dbo.Customers
GROUP BY City
HAVING COUNT(CustomerID) > 2;

/* Question19 */
SELECT ContactName
FROM dbo.Customers c
JOIN dbo.Orders o ON o.CustomerID = c. CustomerID
WHERE o.OrderDate > '1998-01-01'

/* Question20 */
SELECT c.ContactName, MAX(o.OrderDate) as [most recent order dates]
FROM dbo.Customers c
JOIN dbo.Orders o ON o.CustomerID = c. CustomerID
GROUP BY c.CustomerID, c.ContactName

/* Question21 */
SELECT c.ContactName, COUNT(o.OrderID) as [Product count]
FROM dbo.Customers c
JOIN dbo.Orders o ON o.CustomerID = c. CustomerID
GROUP BY c.CustomerID, c.ContactName

/* Question22 */
SELECT o.CustomerID, COUNT(od.ProductID) AS [Product count]
FROM dbo.Orders o
JOIN dbo.[Order Details] od ON o.OrderID = od.OrderID
GROUP BY o.CustomerID
HAVING COUNT(od.ProductID) > 100;

/* Question23 */
SELECT s.CompanyName AS [Supplier Company Name], sh.CompanyName AS [Shipping Company Name]
FROM dbo.Suppliers s
CROSS JOIN Shippers sh;

/* Question24 */
SELECT o.OrderDate, P.ProductName
FROM dbo.Orders o
JOIN dbo.[Order Details] od ON od.OrderID = o.OrderID
JOIN dbo.Products p ON p.ProductID = od.ProductID

/* Question25 */
SELECT e1.EmployeeID AS EmployeeID1, e1.LastName AS LastName1, e1.Title AS JobTitle,
       e2.EmployeeID AS EmployeeID2, e2.LastName AS LastName2
FROM Employees e1
JOIN Employees e2 ON e1.Title = e2.Title AND e1.EmployeeID <> e2.EmployeeID;

/* Question26 */
SELECT Manager.EmployeeID AS ManagerID, Manager.LastName AS ManagerLastName, 
       COUNT(Reportee.EmployeeID) AS NumberOfEmployeesReporting
FROM Employees AS Manager
JOIN Employees AS Reportee ON Manager.EmployeeID = Reportee.ReportsTo
GROUP BY Manager.EmployeeID, Manager.LastName
HAVING COUNT(Reportee.EmployeeID) > 2;

/* Question27 */
SELECT City, CompanyName , ContactName, 'Customer' AS Type
FROM Customers
UNION
SELECT City, CompanyName AS Name, ContactName, 'Supplier' AS Type
FROM Suppliers;
