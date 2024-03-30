/*
	Multi-line comment
*/
USE [Northwind]
GO

SELECT * FROM [Customers]
GO


PRINT 'one'			-- INLINE COMMENT
PRINT 'two'
PRINT '----'
GO 5

-----------------------------------


CREATE DATABASE [MyDemoDb]
GO

USE [MyDemoDb]
GO

-----------------------------------

CREATE TABLE [Customer1]
(
	[Id] int NOT NULL
	, [Name] varchar(50) NOT NULL
	, [Address] varchar(200) NULL
);
GO

SELECT * FROM [MyDemoDb].[dbo].[Customer1]

SELECT * FROM [dbo].[Customer1]

SELECT * FROM [Customer1]

-----------------------------------

INSERT INTO [Customer1]
	( [Id], [Name], [Address] )
VALUES
	( 1, 'First Customer', 'address of the first customer' )
GO
INSERT INTO [Customer1]
	( [Id], [Name], [Address] )
VALUES
	( 1, 'Second Customer', 'address of the second customer' )      -- note duplicate ID
GO

SELECT * FROM [Customer1]

-----------------------------------

CREATE TABLE [Customers2]
(
    [Id] int NOT NULL UNIQUE
    , [Name] varchar(50) NOT NULL
    , [Address] varchar(200) NULL
);
GO

INSERT INTO [Customers2]
    ( [Id], [Name], [Address] )
VALUES
    ( 1, 'First Customer', 'address of the first customer' )
GO
INSERT INTO [Customers2]
    ( [Id], [Name], [Address] )
VALUES
    ( 2, 'Second Customer', 'address of the second customer' )      -- note duplicate ID
    , ( 1, 'Third Customer', 'address of the third customer' )
GO
SELECT * FROM [Customers2]



INSERT INTO [Customers2]
    ( [Id], [Name], [Address] )
VALUES
    ( 2, 'Second Customer', 'address of the first customer' )
    , ( 3, 'Third Customer', 'address of the first customer' )
    , ( 2, 'Fourth Customer', 'address of the first customer' )       -- note duplicate ID
    , ( 5, 'Fifth Customer', 'address of the first customer' )
GO

SELECT * FROM [Customers2]

-----------------------------------

CREATE TABLE [Customers3]
(
	[Id] int NOT NULL
	, [Name] varchar(50) NOT NULL
	, [Address] varchar(200) NULL

	, CONSTRAINT [PK_Customers3] PRIMARY KEY ( [Id] DESC )
);
GO

-----------------------------------

INSERT INTO [Customers3]
	( [Id], [Name], [Address] )
VALUES
	( 1, 'First Customer', 'address of the first customer' )
	, ( 3, 'Third Customer', 'address of the Third customer' )
GO

SELECT * FROM [Customers3]
GO

INSERT INTO [Customers3]
	( [Id], [Name], [Address] )
VALUES
	( 3, 'Second Customer', 'address of the Second customer' ) -- try with duplicate id
GO
SELECT * FROM [Customers3]
GO

-----------------------------------

ALTER TABLE [Customers3]
	ADD [Country] varchar(100) NULL 
		CONSTRAINT [CHK_Customers3_Country] CHECK ( [Country] IN ('India', 'USA') )
GO

-----------------------------------

INSERT INTO [Customers3]
	( [Id], [Name], [Address], [Country] )
VALUES
	( 4, 'Fourth Customer', 'address of the Fourth customer', 'India' )
GO

SELECT * FROM [Customers3]
GO

-----------------------------------

UPDATE [Customers3]
   SET [Country] = 'USA'
   WHERE [Id] = 3 OR [Id] = 1
UPDATE [Customers3]
   SET [Country] = 'USA'
   WHERE [Id] IN (1, 3)

SELECT * FROM [Customers3]
GO

UPDATE [Customers3]
   SET [Country] = 'Italy'
   WHERE [Id] IN (1, 3)
INSERT INTO [Customers3]
	( [Id], [Name], [Address], [Country] )
VALUES
	( 9, 'Ninth Customer', 'address of the Ninth customer', 'Italy' )
GO


-----------------------------------

DELETE FROM [Customers3]
	WHERE [Id] = 3
SELECT * FROM [Customers3]
GO

-----------------------------------

DECLARE @var1 int = 4
-- GO

SELECT * FROM [Customers3]
	WHERE [Id] = @var1
-- GO

DECLARE @var2 int = @var1
PRINT @var2				--- appears in the "Messages" tab
GO

-----------------------------------

DECLARE @author varchar(30) = 'Manoj Kumar Sharma'
DECLARE @company varchar(30)
SET @company = 'Microsoft'

PRINT @author
PRINT @company
PRINT @author + ', ' + @company
SELECT @author AS [Author]
GO


-----------------------------------

SELECT * FROM [Customers3]
SELECT @@ROWCOUNT AS [NumberOfRecordsAffected]	 -- result of its previous statement == 2
SELECT @@ROWCOUNT AS [NumberOfRecordsAffected2]  -- result of its previous statement == 1
GO


-- Store the value for reusablility
SELECT * FROM [Customers3]
DECLARE @rowcounter int = @@ROWCOUNT
SELECT @rowcounter AS [NumberOfRecordsAffected]
SELECT @rowcounter AS [NumberOfRecordsAffected2]
GO

SELECT @@VERSION
GO

-----------------------------------


USE [Northwind]
GO

SELECT * FROM [Customers]
GO


SELECT [Country]
	FROM [Customers]
GO
SELECT DISTINCT [Country]
	FROM [Customers]
	ORDER BY [Country] DESC
GO

-----------------------------------

--- column alias
SELECT [CustomerID] AS [Id],
       [CompanyName] + ', ' + [Country] AS [Name]
FROM [Customers]


-----------------------------------

SELECT * FROM [Customers]
SELECT * FROM [Orders]
GO

SELECT [Orders].[OrderID]
	   , [Customers].[CustomerID]
	   , [Customers].[CompanyName]
	   , [Orders].[OrderDate]
FROM [Customers]
     , [Orders]
WHERE [Customers].[CustomerID] = [Orders].[CustomerID]

SELECT o.[OrderID]
	   , cust.[CustomerID]
	   , cust.[CompanyName] AS [Name]							-- Alias for a column
	   , o.[OrderDate]
	   , o.[ShipCity] + ', ' + o.[ShipCountry] AS [ShipTo]		-- Alias for a column
FROM [Customers] AS cust				-- Alias for a table
     , [Orders] AS o					-- Alias for a table
WHERE cust.[CustomerID] = o.[CustomerID]

-----------------------------------