/*

1. Comparison Operator
2.Arithmetic Operator
3. Logical Operator
4. Concatenation
5. Predicates
2.Make use of an alias with some example
3.Apply some of the operations which you have
learned to Northwind database
4. Schema creation
5.Orderby example
6.GroupBy example
7.Alias concept
8.UNIQUE keyword

*/


USE NorthWind
GO

----Comparison Operator--------

SELECT * FROM [Categories]
GO

SELECT  * FROM [Categories]
 WHERE [CategoryName] = 'Beverages'
 GO

SELECT [CategoryID],[CategoryName] 
FROM [Categories]
WHERE [CategoryID] >=5
GO

-----Arithmetic Operator-----

DECLARE  @Value int = 5
PRINT @Value * 5
PRINT @Value + 5
PRINT @Value / 5

SELECT @Value AS [Value]
GO

----Logical Operator----

SELECT * FROM [Categories]
GO

SELECT  * FROM [Categories]
 WHERE [CategoryName] = 'Beverages' AND [CategoryID] = '1'
 GO

 SELECT  * FROM [Categories]
 WHERE [CategoryName] = 'Beverages' OR [CategoryName] = 'Seafood'
 GO

----Concatenation----
SELECT * FROM [Employees]
GO
SELECT [FirstName] + ' ' + [LastName] FROM [Employees] 
GO

-----Alias--------

SELECT [FirstName] + ' ' + [LastName] AS [FullName] FROM [Employees] 
GO

SELECT [FirstName] AS [Name] FROM [Employees]
GO

------Predicates from NorthWind Database------

SELECT * FROM [Employees] Where  [EmployeeID]  BETWEEN 1 AND 5
GO
	
SELECT * FROM [Employees] Where  [Title] LIKE 'Sales%'  
GO

----Order By-----

SELECT * FROM [Employees]
GO

SELECT [EmployeeID], [FirstName], [LastName]
FROM [Employees]
ORDER BY [EmployeeID] DESC
GO

----Group By----

SELECT COUNT([EmployeeID]), [Country]
FROM [Employees]
GROUP BY [Country]
GO

----SCHEMA CREATION and UNIQUE keyword----

USE [Sample]
GO

CREATE SCHEMA [ORDERS]
GO
CREATE TABLE [Orders1]
	([OrderID] int UNIQUE
     , [OrderName] varchar(50) NOT NULL
	 , [OrderDate] DATE NOT NULL
	 , [DeliveryDate] DATE NOT NULL)
GO

INSERT INTO [Orders1]
	([OrderID], [OrderName], [OrderDate], [DeliveryDate])
	VALUES
	(1231,'Mobile','2022-08-01','2022-08-06')
	, (1231,'Airpods','2022-08-01','2022-08-25')      --DuplicateID
	, (1233,'Mobile Cover','2022-08-04','2022-08-13')
	, (1234,'Smart Watch','2022-08-08','2022-08-28')
GO

SELECT * FROM [Orders1]
GO


----------TASK 2-------------------------
/*
1.Deletion of row
2.Using PRINT and SELECT and understand the
difference
3.Using of ROWCOUNT
4.Using of Alias for a column and for a table
5.Use of Count Variable
6.Working with OFFSET and FETCH
7.How to test for NULLS correctly?
8. Implementing ORDER BY Clause with different
conditions
*/

----Deletion of Row----
USE [Sample]
GO

SELECT * FROM [Orders1]
GO

DELETE FROM [Orders1]
WHERE [OrderID] = '1233'

----Using PRINT and SELECT and understand the difference

SELECT * FROM [Orders]
GO

PRINT '1234'
PRINT ' HELLO WORLD'
PRINT '---------------'
GO 3

GO
--------ROW COUNT------
SELECT * FROM [Orders]
SELECT @@ROWCOUNT AS [NumberOfRecordsAffected]	 --@@ is used for system  built-in Variables
GO

-----Using of Alias for a column and for a table----
USE [Northwind]
GO

SELECT [FirstName] + ' ' + [LastName] AS [FullName] FROM [Employees] 
GO

SELECT [FirstName] AS [Name] FROM [Employees]
GO

SELECT [FirstName], [LastName] FROM [Employees] AS [EMP]
GO

------Use of Count Variable------

SELECT [Country], COUNT([Country]) AS TOTAL FROM [Employees]
GROUP BY [Country]
GO

-----Working with OFFSET and FETCH-----

SELECT * FROM [Employees]
ORDER BY  [EmployeeID]
OFFSET  4 ROWS
GO

SELECT * FROM [Employees]
ORDER BY  [EmployeeID]
OFFSET  4 ROWS
FETCH NEXT 2 ROWS ONLY
GO

------Checking IS NULL and IS NOT NULL------

SELECT * FROM [Sample].[dbo].[Employee] 
WHERE [MiddleName] IS NULL
GO

SELECT * FROM [Sample].[dbo].[Employee] 
WHERE [MiddleName] IS  NOT NULL
GO

------Implementing ORDER BY Clause with different conditions--

SELECT * FROM [Customers]
ORDER BY [ContactName]

SELECT * FROM [Customers]
ORDER BY [ContactName] DESC

SELECT * FROM [Customers]
ORDER BY [CompanyName], [ContactName]

SELECT * FROM [Customers]
ORDER BY [ContactName] ASC, [CompanyName] DESC
