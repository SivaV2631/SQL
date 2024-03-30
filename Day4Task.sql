/*

1. Perform SQL-Having on sample database.
2. Perform SQL-EXISTS on sample database.
3. Apply Looping on sample database.
4. Perform select TOP for sample database.
5. Apply Check Constraint for sample database.
6. Use Object-ID function for any example.
7. Implementation of Subqueries
8. Filtering Data in the where clause with predicates
9. You have a table named Employees that includes a
column named StartDate. You want to find who started
in any year other than 2020. What query would you
use?

*/

------Perform SQL-Having on sample database----
USE [Northwind]
GO

SELECT COUNT([CustomerID]), [Country]
FROM [Customers]
GROUP BY [Country]
HAVING COUNT([CustomerID]) > 5;	
GO


SELECT COUNT([CustomerID]), [Country]
FROM [Customers]
GROUP BY [Country]
HAVING COUNT([CustomerID]) > 5
ORDER BY COUNT([CustomerID]) DESC;
GO

----- Perform SQL-EXISTS on sample database.----
select * from Suppliers,Products

SELECT [CompanyName] FROM [Suppliers]
WHERE EXISTS (SELECT [ProductName] FROM [Products]
				WHERE [Products].[SupplierID] = [Suppliers].[supplierID] AND [UnitPrice] < 20);
GO

-----Apply Looping on sample database.------

DECLARE @Counter int = 1
WHILE ( @Counter <= 10)
BEGIN
    PRINT 'The counter value is = ' + CONVERT(varchar(50), @Counter)
    SET @Counter  = @Counter  + 1
END
GO

-----Perform select TOP for sample database.----

SELECT TOP 3 * FROM [Customers];
GO

SELECT TOP 20 * FROM [Employees];
GO

SELECT TOP 3 * FROM [Customers]
WHERE [Country] = 'Germany'
GO

------Apply Check Constraint for sample database.-----
USE [Sample]
GO

CREATE TABLE [Persons] (
    [ID] int NOT NULL,
    [LastName] varchar(255) NOT NULL,
    [FirstName] varchar(255),
    [Age] int,
    [City] varchar(255),
    CONSTRAINT CHK_Person CHECK ([Age] >= 18 AND [City] = 'Sandnes')
);

ALTER TABLE [Persons]
ADD CONSTRAINT CHK_PersonAge CHECK ([Age] >= 18 AND [City] = 'Sandnes')			--Check constraint

ALTER TABLE [Persons]
DROP CONSTRAINT CHK_PersonAge;

----Use Object-ID function for any example.----

 IF OBJECT_ID('Employees', 'U') IS NOT NULL
 BEGIN
	DROP TABLE [Employees]							/*Object_ID is a unique id number 
														for an object within the database*/
 END												
 GO

 SELECT OBJECT_ID('Sample.dbo.Employee') AS 'Object ID'
 GO

 SELECT OBJECT_ID('Customers')

SELECT OBJECT_NAME(object_id), SCHEMA_NAME(schema_id), * FROM sys.tables

 -----Implementation of Subqueries-----

 SELECT [ProductName] FROM [Products]
	WHERE [ProductID] = ANY                --ANY/ALL returns true if Subquery meets the condition
		(SELECT [ProductID]
			FROM [Order Details]
			WHERE [Quantity] = 10)
GO

-----Filtering Data in the where clause with predicates----

SELECT * FROM [Products]
WHERE [UnitPrice] BETWEEN 50 AND 60

SELECT * FROM [Customers]
WHERE [City] LIKE 's%'

SELECT * FROM [Customers]
WHERE [City] IN ('Paris','London')
GO

/*   You have a table named Employees that includes a
	 column named StartDate. You want to find who started
	 in any year other than 2020. What query would you use?    */

SELECT * FROM [Employees]
SELECT [HireDate] AS [StartDate] FROM [Employees] WHERE [HireDate]  != '2020'
GO




-------------DAY4(TASK2)-----------------------------------
/*
1. Exercise on Joins
Cross Join
Inner Join
Left Outer Join
Right Outer Join
Full Outer Join

2. Use DML to modify data : Perform INSERT and UPDATE
3. Apply Delete and truncate.
4. Perform Insertion of data from another table.
5. Do the practise for converting to Integer Data type.
6. Do the practise for converting to DateTime Data type
7. Perform updation of data in one table based on a join to
another

*/

-------INNER JOIN---------

USE [Northwind]			
GO
										--retrives matching values in both tables
SELECT * FROM [Orders]
SELECT * FROM [Customers]
GO

SELECT [Orders].[OrderID], [Customers].[CompanyName], [Orders].[OrderDate]
FROM 
	[Orders] INNER JOIN [Customers] 
		ON [Orders].[CustomerID] = [Customers].[CustomerID]
GO

-------Left Outer Join----------

SELECT [Orders].[OrderID], [Customers].[CompanyName], [Orders].[OrderDate]
FROM 
	[Orders] LEFT JOIN [Customers]												--retrieves all data from left,matching data from right
		ON [Orders].[CustomerID] = [Customers].[CustomerID]
GO

------Right Outer Join-------

SELECT [Orders].[OrderID], [Customers].[CompanyName], [Orders].[OrderDate]
FROM 
	[Orders] RIGHT JOIN [Customers]													-- retrieves all data from right,matching data from left
		ON [Orders].[CustomerID] = [Customers].[CustomerID]
GO

--------FULL OUTER JOIN

SELECT [Orders].[OrderID], [Customers].[CompanyName]
FROM 
	[Orders] FULL OUTER JOIN [Customers]									-- retrieves matching data from  both left and right table
		ON [Orders].[CustomerID] = [Customers].[CustomerID]
			ORDER BY [Customers].[CompanyName]
GO

-------CROSS JOIN---------
														/*   A cross join produces a cartesian product between the two tables, 
															returning all possible combinations of all rows */
SELECT [Customers].[CompanyName], [Orders].[OrderID]
FROM 
[Customers] CROSS JOIN Orders
WHERE [Customers].[CustomerID] = [Orders].[CustomerID]
GO

-------Use DML to modify data : Perform INSERT and UPDATE-------
USE [Sample]
GO

CREATE TABLE [Employees]
(
	[Id] int NOT NULL  
	, [Name] varchar(50)
)
GO

INSERT INTO [Employees]
	([ID], [Name] )
VALUES
	( 101,'First Employee' )
	, (102, 'Second Employee' )
	, (103, 'Third Employee' )
	, ( 104,'Fourth Employee' )
	, ( 105, 'Fifth Employee' )
GO

SELECT * FROM [Employees]
GO

DELETE  FROM [Employees] 
WHERE [ID] = 105
GO

UPDATE [Employees]
SET [Name]='sixth employee' 
WHERE [ID] = 104
GO


SELECT * FROM [Employees]
GO


-----Apply Delete and truncate-------

DELETE  FROM [Employees] 
WHERE [ID] IN (103,104)
GO

SELECT * FROM [Employees]
GO

TRUNCATE TABLE [Employees]
GO

-------Perform Insertion of data from another table.------
USE [Northwind]
GO

SELECT * INTO [CustomersGermany]
FROM [Customers]
WHERE Country = 'Germany' 
GO
SELECT [Country] FROM [Customers]
SELECT [Country] FROM [CustomersGermany]
GO


------Do the practise for converting to Integer Data type.------

SELECT CONVERT(DECIMAL, 25.00)
SELECT CAST(25.65 AS int)
GO

SELECT CONVERT(int, 100.00)
SELECT CAST(100 AS int)
GO

----- Do the practise for converting to DateTime Data type------


Select SYSDATETIME() AS [SYSDATETIME]
GO

DECLARE @Existingdate datetime
SET @Existingdate=GETDATE()
SELECT  @Existingdate AS [Existingdate]
SELECT CONVERT(varchar,@Existingdate,1) AS [MM/DD/YY]
GO

DECLARE @Existingdate1 datetime = GETDATE()
SELECT  @Existingdate1 AS [Existingdate1]
SELECT CONVERT(varchar,@Existingdate1,3) AS [DD-MM-YY]
GO

