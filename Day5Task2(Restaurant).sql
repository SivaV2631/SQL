CREATE DATABASE [Rest]
GO

USE [Rest]
GO

-----------RESTAURANT DATABASE SCHEMA---------------

CREATE TABLE [CityInfo]
(
	[CityID] int  NOT NULL PRIMARY KEY 
	,[CityName] varchar(30) NOT NULL
	,[PostalCode] int NULL
	
);

CREATE TABLE [Meals]
(
	[MealID] int NOT NULL PRIMARY KEY
	,[MealName] varchar(50) NOT NULL
	,[Menu] varchar(50) NULL
	,[Price] decimal NOT NULL
	,[Quantity] int NULL

);


CREATE TABLE [OrderDetails]
(
	[OrderID] int NOT NULL PRIMARY KEY
	,[OrderTo] varchar(50) NOT NULL
	,[MealID] int NOT NULL FOREIGN KEY REFERENCES Meals([MealID])
	,[Quantity] int NULL
	,[Price] decimal NOT NULL
	,[Discount] decimal NULL
	,[Total] decimal NOT NULL

);

CREATE TABLE [Suppliers]
(
	[SupplierID] int NOT NULL PRIMARY KEY
	,[SupplierName] varchar(50) NOT NULL
	,[Address] varchar(50) NULL
	,[CityID] int NOT NULL FOREIGN KEY REFERENCES [CityInfo]([CityID])
	,[Region] varchar(30) NULL
	,[PostalCode] int NULL
	,[Country] varchar(30) NULL
	,[PhNo] int NOT NULL 
	,[Menu] varchar(50) NULL

);

CREATE TABLE [Orders]
(
	[OrderID] int NOT NULL PRIMARY KEY
	,[SupplierID] int NOT NULL FOREIGN KEY REFERENCES [Suppliers]([SupplierID])
	,[OrderDate] Date NULL
	,[Name] int NOT NULL 
	,[Price] int NOT NULL
);

CREATE TABLE [Customers]
(
	[CustomerID] int NOT NULL PRIMARY KEY
	,[Name] varchar(50) NOT NULL
	,[Address] varchar(50) NULL
	,[CityID] int NOT NULL FOREIGN KEY REFERENCES [CityInfo]([CityID])
	,[Region] varchar(30) NULL
	,[PostalCode] int NULL
	,[PhNo] int NOT NULL 
	,[Email] varchar(50) NULL
	,[MealID] int NOT NULL FOREIGN KEY REFERENCES [Meals]([MealID])

);
GO

-----------------------------------------------------------------------------------

INSERT INTO [CityInfo]
	([CityID], [CityName], [PostalCode])
VALUES
	(1, 'Bangalore', '1231'),
	(2, 'Chennai', '1232'),
	(3, 'Hyderabad', '1233')
GO


INSERT INTO [Meals]
	([MealID], [MealName], [Price])
VALUES
	(1, 'Pizza', 250),
	(2, 'Biryani', 150),
	(3, 'Burger', 250),
	(4, 'Fried Rice', 250)
GO

INSERT INTO [OrderDetails]
	([OrderID], [OrderTo], [MealID], [Quantity], [Price], [Total])
VALUES
	(01, 'Siva', 001, 2, 250, 250),
	(02, 'Gautham', 002, 2, 150, 150)
GO

INSERT INTO [Suppliers]
	([SupplierID], [SupplierName], [CityID], [PhNo])
VALUES
	(001, 'Supplier1', 1, 123456),
	(002, 'Supplier2', 2, 1234578)
GO

INSERT INTO [Customers]
	([CustomerID], [Name], [CityID], [PostalCode], [PhNo], [MealID])
VALUES
	(11, 'Customer1', 1, 1231, 123456789, 1),
	(12, 'Customer2', 2, 1232, 123456, 2),
	(13, 'Customer3', 3, 1233, 1234567, 3)
GO

-----------------------------------------------------------------------------------

SELECT * FROM [Customers]
SELECT * FROM [Suppliers]
SELECT * FROM [Orders]
SELECT * FROM [OrderDetails]
SELECT * FROM [Meals]
SELECT * FROM [CityInfo]
GO

------------------------------------------------------------------------------------

DROP DATABASE [Rest]
GO



















