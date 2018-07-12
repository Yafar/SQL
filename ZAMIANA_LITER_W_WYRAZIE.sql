DECLARE 
@nazwa NVARCHAR(50) = 'ABCDE',
@l INT = 0,
@qry NVARCHAR(1000),
@ParmDefinition NVARCHAR(500),
@wy NVARCHAR(50) = '';

SET @qry = 'SELECT @ile = LEN(''' + @nazwa + ''')';
SET @ParmDefinition = N'@ile NVARCHAR(20) OUTPUT'
EXEC SP_EXECUTESQL @qry,@ParmDefinition,@ile = @l OUTPUT 

WHILE @l > 0 BEGIN

set @wy += ISNULL(SUBSTRING(@nazwa,@l,1),'');

SET @l -= 1;

END;

print @wy;
