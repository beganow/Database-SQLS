USE UNIVER;
GO
CREATE PROCEDURE PAUDITORIUM_INSERTX
		@A CHAR(20),
		@N VARCHAR(50),
		@C INT = 0,
		@T CHAR(10),
		@TN VARCHAR(50)	--AUDITORIUM, AUDITORIUM_NAME, AUDI-TORIUM_CAPACITY � AUDITORIUM_TYPE, AUDITORIUM_TYPE.AUDITORIUM_TYPENAME 
AS BEGIN
DECLARE @RC INT = 1;
BEGIN TRY
	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
	BEGIN TRAN
	INSERT INTO AUDITORIUM_TYPE(AUDITORIUM_TYPE, AUDITORIUM_TYPENAME)
				VALUES(@N, @TN);
	EXEC @RC = PAUDITORIUM_INSERT @A, @N, @C, @T;
	COMMIT TRAN;
	RETURN @RC;
END TRY
BEGIN CATCH
	PRINT 'NUM: ' + CAST(ERROR_NUMBER() AS VARCHAR(6));
	PRINT 'MESSAGE: ' + ERROR_MESSAGE();
	PRINT 'SEVERITY: ' + CAST(ERROR_SEVERITY() AS VARCHAR(6));
	PRINT 'STATE: ' + CAST(ERROR_STATE() AS VARCHAR(8));
	PRINT 'ERROR LINE: ' + CAST(ERROR_LINE() AS VARCHAR(8));
	IF ERROR_PROCEDURE() IS NOT  NULL
	PRINT 'IN WHAT PROC: ' + ERROR_PROCEDURE();
	IF @@TRANCOUNT > 0 ROLLBACK TRAN ;
	RETURN -1;
END CATCH;
END;


DECLARE @K3 INT;
EXEC @K3 = PAUDITORIUM_INSERTX '102-3', @N = '��-�', @C = 85, @T = '102-3', @TN = '����������';
PRINT 'STATUS : ' + CAST(@K3 AS VARCHAR(3));
GO
DELETE AUDITORIUM WHERE AUDITORIUM='102-3';
SELECT * FROM AUDITORIUM;
SELECT * FROM AUDITORIUM_TYPE;


GO
DROP PROCEDURE PAUDITORIUM_INSERTX;