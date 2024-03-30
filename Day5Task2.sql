/*

Assignment:
Implement the following concepts in sql server:
1.	Creating Database for restaurant and normalisation (Assignment)
2.	Stored Procedure
3.	Composite Primary key
4.	Foreign key
5.	Working with Master and Transaction table

*/

USE [Northwind]
GO

--------  Stored Procedure ----------

CREATE PROCEDURE SelectAllCustomers2
AS
SELECT * FROM Customers                                  --Prepared(Saved) SQL that can be reused
GO

EXEC SelectAllCustomers1
GO

  


CREATE PROCEDURE SelectAllCustomers @City nvarchar(30)
AS
SELECT * FROM Customers WHERE City = @City
GO

DROP PROCEDURE SelectAllCustomers
GO

EXEC SelectAllCustomers @City = 'London'
GO

-------Composite Primary Key--------------(Combination of PK)

USE [Sample]
GO
													
SELECT * FROM [Employee]							  
SELECT * FROM [Orders]
GO

CREATE TABLE [COMPO]
(
	[EmployeeID]INT,
	[OrderID] INT,
	[EMPNAME] VARCHAR(25),
	[GENDER] VARCHAR(6),
	[SALARY] INT										--Composite primary key = (PrimaryKEY of table1 + PrimaryKEY of table2 + ....)
	PRIMARY KEY ( [EmployeeID], [OrderID] )				----Composite PRIMARY KEY  ([EmployeeID] , [OrdersID])
  
);
GO

INSERT INTO [COMPO] ([EmployeeID],[OrderID],[EMPNAME])
	VALUES
		(1,1, 'Siva')
		,(1,2, 'Siva')
		,(2,1, 'Siva')
		,(2,2, 'Siva')
GO

SELECT * FROM [COMPO] 
SELECT * FROM [COMPO] WHERE [EmployeeID] = 1 OR [OrderID] = 3

---------Foreign key------------------

CREATE TABLE [Orders1] (
    [OrderID] int NOT NULL PRIMARY KEY,											--FK is reference to PK of another table
    [OrderNumber] int NOT NULL,
    [ID] int,
    CONSTRAINT [FK_PersonOrder] FOREIGN KEY ([ID]) REFERENCES Persons([ID])
);

ALTER TABLE [Persons]
ADD PRIMARY KEY ([ID])	--ADDING PK TO TABLE

ALTER TABLE Orders
DROP FOREIGN KEY [FK_PersonOrder]    ---Dropping FK

-------------Working with Master and Transaction table-----------------

USE [Sample]
GO

SELECT * FROM [Employees]

BEGIN TRANSACTION [AddEmployee]

INSERT INTO [Employees]
	( [Id], [Name] )
VALUES
	( 5, 'Fifth Employee' )
GO

SELECT * FROM [Employees]

DECLARE @found int
SELECT @found = COUNT(*) FROM [Employees] WHERE [Name] = 'Second Employee'
PRINT @found

IF( @found > 1 )
	BEGIN
		ROLLBACK TRANSACTION [AddEmployee]
		PRINT 'Another Employee found with the same Name!'
	END
ELSE
	BEGIN
		COMMIT TRANSACTION
		Print 'Successfully added the new Employee'
	END

GO


SELECT * FROM [Employees]
GO






