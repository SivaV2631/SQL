USE [master]		-- use the System Master Database
GO					-- execute the previous set of statements in the form of a batch.

/*  multi-line
    comment */

-- inline comment

CREATE DATABASE [MyDemoDb1]
GO

USE [MyDemoDb]
GO

CREATE TABLE [Products] 
(
	[ProductName] varchar(50)
	, [Quantity] int
	, [Price] decimal
);
GO
SELECT * FROM [Products];
GO

INSERT INTO [Products]
	( [ProductName], [Quantity], [Price] )
	VALUES
	( 'Wheat', 105, 64 )
GO

INSERT INTO [Products]
	( [ProductName], [Quantity], [Price] )
	VALUES
	( 'Rice', 105, 64 )
GO

INSERT INTO [Products]
	( [ProductName], [Quantity], [Price] )
	VALUES
	( 'Salt', 4, 16 ),
	( 'Sugar', 99, 72 )
GO

SELECT [ProductName], [Quantity], [Price]
	FROM [Products]
GO

-- char / nchar
-- varchar / nvarchar

-- bit

-- tinyint
-- smallint
-- int
-- decimal


-- PRIMARY KEY is always SORTED, UNIQUE and NOT NULL indexed column
CREATE TABLE [Employees] 
(
	[EmployeeId] int PRIMARY KEY,
	[FirstName] varchar(30) NOT NULL,
	[MiddleName] varchar(30) NULL,
	[LastName] varchar(30) NOT NULL,
	[NameInHindi] nvarchar(60) NULL,
	[NameInChinese] nvarchar(60) NULL,
	[IsEnabled] bit,
	[Gender] char(1)
);
GO

SELECT * FROM [Employees]
GO

INSERT INTO [Employees]
	( [EmployeeId], [FirstName], [LastName] )
	VALUES
	( 1, 'Mohan', 'Kumar' )
GO
INSERT INTO [Employees]
	( [EmployeeId], [FirstName], [LastName] )
	VALUES
	( 2, 'Sohan', 'Verma' ),
	( 3, 'Ramesh', 'Gupta' )
GO
INSERT INTO [Employees]
	( [EmployeeId], [FirstName], [LastName] )
	VALUES
	( 4, 'Mohan', 'Kumar' )
GO
INSERT INTO [Employees]
	( [EmployeeId], [FirstName], [LastName] )
	VALUES
	( -1, 'Mohan', 'Kumar' )
GO

SELECT [EmployeeId], [FirstName], [LastName]
     FROM [Employees]

SELECT *
	FROM [Employees]

INSERT INTO [Employees]
	( [EmployeeId], [FirstName], [LastName], [NameInHindi] )
	VALUES
	( 9, 'Manoj', 'Sharma', 'मनोज शर्मा' )
INSERT INTO [Employees]
	( [EmployeeId], [FirstName], [LastName], [NameInHindi] )
	VALUES
	( 10, 'Manoj', 'Sharma', N'मनोज शर्मा' )


SELECT * FROM [Employees]
GO

DELETE FROM [Employees]
	WHERE [EmployeeId] = 3
SELECT * FROM [Employees]
GO

UPDATE [Employees]
	SET [MiddleName] = 'Kumar' 
	    , [NameInHindi] = N'मनोज कुमार शर्मा'
	WHERE [EmployeeID] = 9 OR [EmployeeID] = 10
SELECT * FROM [Employees]
GO



-- CRUD Operations on data
-- C  create
-- R  retrieve
-- U  update
-- D  delete


DROP TABLE [Products]

--- [MyDemoDb]    database name
--- [dbo]         schema name
--- [Employees]   object name (in this case it is the name of the table)
DROP TABLE [MyDemoDb].[dbo].[Employees]
GO

