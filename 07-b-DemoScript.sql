/***********
IMPORTANT NOTES:
01  Every MERGE statement must end with a semi-colon. If a semi-colon is not present 
    at the end of the MERGE statement, then an error will be thrown
02  You can use SELECT @@RowCount after writing the MERGE statement which will return 
    the number of records that have been modified by the transaction
03 It is mandatory that one of the MATCHED clauses is provided in order for the MERGE 
   statement to operate
********************************/

USE [MyDemoDb]
GO

------ Preparing the Test Data

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

---------------------

MERGE [TargetProducts] AS [Target]
	  USING [SourceProducts] AS Source
	ON Source.[ProductID] = Target.[ProductID] 
    
	-- For Deletes
	WHEN NOT MATCHED BY Source THEN
		DELETE

	-- For Inserts
	WHEN NOT MATCHED BY Target THEN
		INSERT ( [ProductID], [ProductName], [Price] ) 
		VALUES ( Source.[ProductID], Source.[ProductName], Source.[Price] )
    
	-- For Updates
	WHEN MATCHED THEN 
		UPDATE SET Target.[ProductName] = Source.[ProductName],
				   Target.[Price] = Source.[Price]							

	-- Checking the actions by MERGE statement
	OUTPUT $action, 
			DELETED.[ProductID] AS TargetProductID, 
			DELETED.[ProductName] AS TargetProductName, 
			DELETED.[Price] AS TargetPrice, 
			INSERTED.[ProductID] AS SourceProductID, 
			INSERTED.[ProductName] AS SourceProductName, 
			INSERTED.[Price] AS SourcePrice

	;			-- end of MERGE STATEMENT
GO

-- you can drop the unwanted table, since both the tables now reflect the same information
SELECT * FROM [SourceProducts]
SELECT * FROM [TargetProducts]



--- CLEAN UP 
DROP TABLE [SourceProducts]
DROP TABLE [TargetProducts]