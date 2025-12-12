create database bronze

USE bronze;

-- Drop temp table if it exists
IF OBJECT_ID('tempdb..#FileList') IS NOT NULL
    DROP TABLE #FileList;

-- Create temp table to hold file names
CREATE TABLE #FileList (
    FileName NVARCHAR(255),
    Depth INT,
    IsFile BIT
);

-- Populate file list from folder
INSERT INTO #FileList
EXEC xp_DirTree 'C:\Users\razul\Downloads\Click consulting\For GIthub Uploads\Data\data\', 1, 1;

-- Keep only CSV files
DELETE FROM #FileList WHERE RIGHT(FileName, 4) != '.csv';

-- Create target table (if not already created)
IF OBJECT_ID('bronze.dbo.ImportData') IS NULL
BEGIN
    CREATE TABLE dbo.ImportData (
        Id INT,
        Name NVARCHAR(100),
        Age INT
    );
END

-- Declare variables
DECLARE @FileName NVARCHAR(255), @SQL NVARCHAR(MAX);

-- Cursor to loop through files
DECLARE file_cursor CURSOR FOR
SELECT FileName FROM #FileList;

OPEN file_cursor;
FETCH NEXT FROM file_cursor INTO @FileName;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Print current file being processed
    PRINT 'Importing file: ' + @FileName;

    -- Build dynamic SQL
    SET @SQL = 
        'BULK INSERT bronze.dbo.ImportData
         FROM ''' + 'C:\Users\razul\Downloads\Click consulting\For GIthub Uploads\Data\data\' + @FileName + '''
         WITH (
             FIELDTERMINATOR = '','',
             ROWTERMINATOR = ''\n'',
             FIRSTROW = 2
         );';

    -- Execute dynamic SQL
    EXEC sp_executesql @SQL;

    FETCH NEXT FROM file_cursor INTO @FileName;
END

-- Clean up
CLOSE file_cursor;
DEALLOCATE file_cursor;