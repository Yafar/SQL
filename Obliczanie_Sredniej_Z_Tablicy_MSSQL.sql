DECLARE 
@QR NVARCHAR(500),
@qrytmp NVARCHAR(500),
@param NVARCHAR(500),
@wy NUMERIC;

IF OBJECT_ID('TEMP', 'U') IS NOT NULL DROP TABLE TEMP; 

SET @QR = 'SELECT *
INTO TEMP
FROM (
SELECT 1 LICZBA
UNION SELECT 2
UNION SELECT 3
UNION SELECT 4
UNION SELECT 5
UNION SELECT NULL ) A';

EXEC(@QR);

SET @qrytmp = 'SELECT @wy = ROUND(SUM(ISNULL(LICZBA,0))/COUNT(1),2) FROM TEMP';
SET @param = N'@wy NUMERIC OUTPUT'
EXEC SP_EXECUTESQL @qrytmp,@param,@wy OUTPUT 

PRINT @wy;

IF OBJECT_ID('TEMP', 'U') IS NOT NULL DROP TABLE TEMP;
