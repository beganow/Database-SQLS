USE [UNIVER]
GO
ALTER PROCEDURE PSUBJECT @P VARCHAR(20) = NULL, @C INT OUTPUT
AS
BEGIN
 SELECT * FROM SUBJECT WHERE SUBJECT.SUBJECT = @P;
 SET @C = @@ROWCOUNT;
 DECLARE @K INT = (SELECT COUNT(*) FROM SUBJECT);
 PRINT 'ПАРАМЕТРЫ: @P='+@P+', @C='+CAST(@C AS VARCHAR(3));
 RETURN @K;
   END

DECLARE @N INT, @A INT,@X NVARCHAR(20);
EXEC @N = PSUBJECT 'ООП', @A OUTPUT ;
PRINT CAST(@A AS NVARCHAR(4))
PRINT CAST(@N AS NVARCHAR(4))



