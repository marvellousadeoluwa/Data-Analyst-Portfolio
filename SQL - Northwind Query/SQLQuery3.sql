SELECT CategoryName, Description

FROM Categories


SELECT ProductName AS Product, UnitPrice, UnitsInStock, UnitPrice * UnitsInStock AS TotalCost
FROM Products

SELECT ProductName AS Product, UnitPrice, UnitsInStock, UnitsOnOrder, (UnitsInStock + UnitsOnOrder) * UnitPrice 
FROM Products

SELECT  ContactName + ', ' + Address + ', ' + City AS 'Name and Address'
FROM Customers

SELECT GetDate()

SELECT 2 + null

SELECT OrderID, ShipCity, IsNull(ShipRegion, '') AS ShipRegion, ShipCountry
FROM Orders

SELECT IsNull(1, 0)

SELECT OrderID, ShipCity + ', ' + IsNull(ShipRegion + '') + ', ' + ShipCountry AS 'Order Address'
FROM Orders

SELECT OrderID, ShipCity + ', ' + IsNull(ShipRegion + ',', '') + ShipCountry AS 'Order Address'
FROM Orders

SELECT *
FROM Customers
WHERE Country = 'Germany'

SELECT *
FROM Customers
WHERE City = 'Berlin'

SELECT ContactName, Phone
FROM Customers
WHERE City = 'Berlin'

-- More Complex queries coming up now...
-- Three Main SQL keyword covered
-- Functions, Comment, String Literal (Contatenation)
-- Clause = Keyword and texts following

SELECT City
FROM Suppliers
WHERE Country = 'Japan'


SELECT City
FROM Suppliers
WHERE Country = 'India'

-- Matching Values Inexactly

SELECT ProductName, UnitsInStock
FROM Products
WHERE UnitsInStock < 10

SELECT ProductName, UnitsInStock
FROM Products
WHERE UnitsInStock >= 10

SELECT ProductName, UnitsInStock
FROM Products
WHERE UnitPrice > 21.35

SELECT *
FROM Products
WHERE UnitsInStock + UnitsOnOrder > 100

SELECT *
FROM Products
WHERE UnitsInStock * UnitPrice < 100

SELECT * 
FROM Products
WHERE ProductName LIKE '%coffee%'

Select *
FROM Products
where ProductName LIKE 'P%';

-- Date Values and Literals*

SELECT *
FROM Orders
WHERE OrderDate < '1998-03-01'

-- Exercise
SELECT *
FROM Employees
WHERE HireDate >= '1993-01-01'

-- Precise Query
SELECT *
FROM Orders
WHERE OrderDate BETWEEN '1997-01-01' AND '1997-01-02'
-- Between is inclusive of both dates... but not in all SQL versions

SELECT *
FROM Orders
WHERE OrderDate >= '1997-01-01' AND OrderDate < ' 1997-01-02'

-- 4.1
SELECT ProductName, UnitsInStock
FROM Products
WHERE UnitsInStock >= 10 AND UnitsInStock < 20

SELECT *
FROM Orders
WHERE OrderDate >= '1997-01-01' AND ShipCountry = 'Brazil';

SELECT *
FROM Orders
WHERE OrderDate >= '1997-01-01' 
AND OrderDate < '1998-01-01' 
AND ShipCountry = 'Brazil';

SELECT *
FROM Orders
WHERE ShipCountry = 'USA'
OR ShipCountry = 'Canada';


SELECT *
FROM Employees
WHERE City = 'Seattle' 
OR Country = 'UK' --OR Title = '%Sale%'

SELECT *
FROM Customers
WHERE ContactTitle = 'Owner'
AND (Country = 'USA' OR Country = 'Mexico')

SELECT *
FROM Customers
WHERE (ContactTitle = 'Owner' AND Country = 'USA')
OR Country = 'Mexico';

SELECT *
FROM Customers
WHERE Country <> 'US'

SELECT *
FROM Customers
WHERE ContactTitle LIKE 'Sales%' OR ContactTitle LIKE 'Marketing%'

SELECT ContactName, Phone, ContactTitle, Country
FROM Customers
WHERE Country <> 'US' 
AND (ContactTitle LIKE 'Sales%' OR ContactTitle LIKE 'Marketing%')

SELECT ContactName, Phone
FROM Customers
WHERE Country <> 'US' 
AND NOT(ContactTitle LIKE 'Sales%' OR ContactTitle LIKE 'Marketing%')


SELECT ContactName, Phone
FROM Customers
WHERE NOT (Country = 'US' OR Country = 'Mexico')
AND NOT(ContactTitle LIKE 'Sales%' OR ContactTitle LIKE 'Marketing%');

SELECT ContactName, Phone
FROM Customers
WHERE Country <> 'US' 
AND Country = 'Mexico'
AND NOT(ContactTitle LIKE 'Sales%' OR ContactTitle LIKE 'Marketing%');


-- DISTINCT

Select Distinct Title
from Employees

select Distinct Country
from Suppliers
 

 --  ORDER BY
SELECT *
FROM Products
ORDER BY UnitsInStock;

SELECT *
FROM Products
ORDER BY UnitsInStock DESC

SELECT *
FROM Products
ORDER BY SupplierID, UnitsInStock DESC

Select ProductName, CategoryID, UnitPrice
from Products
Order By CategoryID, UnitPrice;

-- TOP ; Subsample the data

SELECT TOP 1000 *
FROM Products;

SELECT TOP 10 *
FROM Products
ORDER BY ProductName;

SELECT TOP 10 ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice;

-- Bottom; not a keyword anyways, use desc
SELECT TOP 10 *
FROM Products
ORDER BY ProductID DESC

-- GROUPBY

-- Aggregate Functions
-- vs inline or scalar func
-- 1. SUM

SELECT UnitsInStock * UnitPrice AS ValueInStock
FROM Products

SELECT Sum(UnitsInStock)
FROM Products

SELECT Sum(UnitsInStock * UnitPrice)
FROM Products

-- 2. COUNT, MAX, MIN
SELECT Count(*)
FROM Products

SELECT Max(UnitPrice)
FROM Products

SELECT SupplierID, CategoryID, Count(*) AS ProductCount
FROM Products
GROUP BY SupplierID, CategoryID
ORDER BY SupplierID, CategoryID