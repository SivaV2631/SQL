CREATE DATABASE [Sample]
GO
 
--Using DataBase--

USE [Sample]                
 GO

USE [MyDemoDb]
GO							

--Droping Database

DROP DATABASE [Sample]
GO

/* Creating a Table */

CREATE TABLE [Employee]
	( [EmployeeID] int PRIMARY KEY
	 , [FirstName] varchar(50) NOT NULL
	 , [MiddleName] varchar(50) NULL
	 , [LastName] varchar(50) NOT NULL
	 , [Gender] varchar(10)  NOT NULL
	 , [Age] int NOT NULL
	 , [PhNo] int NULL
	 , [Email] varchar(50) 
	 , [Address] varchar(50) NULL
	 , [Department] varchar(50) DEFAULT 'Training'
	);
GO

-----Inserting single row of data into table--
 
INSERT INTO [Employee] 
		([EmployeeID],[FirstName],[MiddleName],[LastName],[Gender],[Age],[PhNo],[Email],[Address],[Department])
		VALUES
		(1,'Siva','Kumar','V','Male', 21, 123456,'sivakumar26.v@gmail.com','NULL','Automation')
GO

---Retrieving data from a Table

SELECT * FROM [Employee]
GO

--Inserting Multiple Rows in a table

INSERT INTO [Employee] ([EmployeeID],[FirstName],[LastName],[Gender],[Age])
						VALUES
						(2,'Gautham','V','Male',26)
					   ,(3,'Priya','V','Female',42)
		               ,(4,'Mithansh','P','Male',10)
GO

SELECT [EmployeeID]
	  ,[FirstName]
	  ,[LastName]
	  ,[Gender]
	  ,[Age] 
	  FROM [Employee]
GO 

---Updating Data in a table---

UPDATE [Employee] 
	   SET Age = 22 
	   WHERE EmployeeID = 2
GO

SELECT [EmployeeID]
		,[FirstName]
		,[Age]
FROM [Employee]
GO


---Deleting Data from a table---
 
DELETE FROM [Employee]
	   WHERE [EmployeeID] = 3 OR [EmployeeID] = 4
GO


--Truncating a table
TRUNCATE TABLE [Employee]				/*empty table*/
GO

--Remove a table
DROP TABLE [Employee]					/*Delete a table completely*/
GO

--Retrieving Unique data

SELECT DISTINCT [FirstName] FROM [Employee]
Go

---Adding New Column to the Table---

ALTER TABLE [Employee] ADD [Marks] int
GO



Select * from [Employee]
GO


-----Inclusive and Exclusive Parameters------

SELECT * FROM [Employee]							--Inclusive
	WHERE [Age] BETWEEN 10 AND 30
GO

SELECT * FROM [Employee]
	WHERE [EmployeeID] NOT BETWEEN 2 AND 4				--Exclusive
GO

SELECT * FROM [Employee]
	WHERE [Age] BETWEEN 10 AND 30						--Exclusive
		AND [EmployeeID] NOT IN (3,4)
GO

-----Date Format-----

CREATE TABLE [Orders]
	([OrderID] int PRIMARY KEY
     , [OrderName] varchar(50) NOT NULL
	 , [OrderDate] DATE NOT NULL
	 , [DeliveryDate] DATE NOT NULL)
GO

INSERT INTO [Orders]
	([OrderID], [OrderName], [OrderDate], [DeliveryDate])
	VALUES
	(1231,'Mobile','2022-08-01','2022-08-06')
	, (1232,'Airpods','2022-08-01','2022-08-25')
	, (1233,'Mobile Cover','2022-08-04','2022-08-13')
	, (1234,'Smart Watch','2022-08-08','2022-08-28')
GO

SELECT * FROM [Orders] WHERE OrderDate='2022-08-01'
GO

SELECT * FROM [Orders]
	WHERE [DeliveryDate] BETWEEN '2022-08-01' AND '2022-08-15'
GO

SELECT * FROM [Orders]
	WHERE [DeliveryDate] NOT BETWEEN '2022-08-01' AND '2022-08-15'
GO






