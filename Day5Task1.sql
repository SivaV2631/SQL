/*
1. Perform merge operation with condition
2. Exercise for Converting into the ISO culture.
3. Implement TOP with ties.
4. Do the example for logical query processing.
5. Applying the Logical Order of Operations to Writing
SELECT Statements
6. Do the Exercises for sample database implementing
following concepts.
1. Expressions for SQL Server
2. Custom Formatting numbers
3. Working with GUID
4. creating a view from table
5. Scalar Function
7. creating Database for restaurant and normalisation
*/




USE [MyDemoDb]
GO

CREATE TABLE [SourceProducts]
(
    [ProductID] int,
    [ProductName] varchar(50),
    [Price] decimal(9,2)
)
GO

CREATE TABLE [TargetProducts]
(
    [ProductID] int,
    [ProductName] varchar(50),
    [Price] decimal(9,2)
)
GO
    

INSERT INTO [SourceProducts] 
	([ProductID], [ProductName], [Price]) 
	VALUES
		(1, 'Table', 100)
		, (2, 'Desk', 80)
	    , (3, 'Chair', 50)							-- deleted
		, (4,'Computer', 300)						-- deleted
GO
    
INSERT INTO [TargetProducts] 
	([ProductID], [ProductName], [Price]) 
	VALUES
		(1, 'Table', 100)
		, (2, 'Desk', 90)							-- changed
	    , (5, 'Bed', 90)							-- inserted
		, (6,'Cupboard', 200)						-- inserted
GO
    
SELECT * FROM [SourceProducts]
SELECT * FROM [TargetProducts]

-----Perform merge operation with condition-----

MERGE [TargetProducts] AS [Target]
	  USING [SourceProducts] AS Source
	ON Source.[ProductID] = Target.[ProductID] 
	WHEN NOT MATCHED BY Target THEN
		INSERT ( [ProductID], [ProductName], [Price] ) 
		VALUES ( Source.[ProductID], Source.[ProductName], Source.[Price] );
    
    
SELECT * FROM [SourceProducts]    
SELECT * FROM [TargetProducts]     --added Chair and computer to target products
GO

-------Converting Date into the ISO Culture Standard Time Date 10 is Conversion code

SELECT GETDATE() AS Date
	, CONVERT(varchar(30), GETDATE(), 10) AS StandardDate10 
	, CONVERT(varchar(30), GETDATE(), 9) AS StandardDate9
	, CONVERT(varchar(30), GETDATE(), 108) AS StandardDate108
	, CONVERT(varchar(30), GETDATE(), 1) AS StandardDate1
GO

------Implement TOP with ties.--------

SELECT TOP 1 WITH TIES
[ProductID], [ProductName]				---top 1 gets ony 1 value even it has multiple same row value
FROM [SourceProducts]					--top with ties gives top value in multiple row ,if it is present
ORDER BY [ProductID] DESC
GO

-----Applying the Logical Order of Operations to Writing SELECT Statements--

SELECT [ProductID],[ProductName],[Price]
FROM [SourceProducts]
WHERE [Price]  BETWEEN 100 AND 200
GO

-------Logical Query Processing--------

SELECT T.Price, COUNT(S.ProductID) AS Numbers
FROM SourceProducts AS S
INNER JOIN TargetProducts AS T
ON T.Price = S.Price
WHERE S.ProductName = 'computer'
GROUP BY T.Price
HAVING COUNT(S.Price) = 3
ORDER BY Numbers
GO

-------Expressions for SQL Server-------
SELECT (10+6) AS ADDITION
GO 

SELECT  ProductName,Price FROM TargetProducts
WHERE Price>10

-----creating a view from table----
CREATE VIEW [Items] AS
SELECT ProductName,Price
FROM TargetProducts
WHERE Price >50

SELECT * FROM [Items]

----Working with GUID
USE [Sample]
GO

CREATE TABLE [Student]
( [StudentID] uniqueidentifier PRIMARY KEY DEFAULT newid()
 ,[Name] nvarchar(50)
);																--global unique Identifier
GO

INSERT INTO [Student] 
VALUES
(DEFAULT, 'Siva'),
(DEFAULT, 'Gautham')
GO

SELECT * FROM [Student]
GO

DECLARE @guid UNIQUEIDENTIFIER = NEWID()
SELECT @guid AS 'ID'
GO

-----Custom Formating Numbers-----

SELECT FORMAT(250500.5634, '#,###,####.##')
SELECT FORMAT(123456789, '##-##-#####')
SELECT FORMAT(200.10,'$####.##')
SELECT ROUND(1234.2356,2) AS [Round]
GO

----Scalar Function----

SELECT UPPER(ProductName) FROM [SourceProducts]
SELECT ROUND(Price,5) FROM [SourceProducts]
SELECT LOWER('HELLO WORLD!')
GO

