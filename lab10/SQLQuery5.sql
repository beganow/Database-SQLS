/*5. ������� ������, �����������-���� ���������� ����������� CURRENT OF � ������ WHERE � �������������� ���������� UP-DATE � DELETE.*/
USE UNIVER;

INSERT INTO FACULTY (FACULTY, FACULTY_NAME)
VALUES ('ISIT', 'ISITCHICK');



DECLARE EX_5_CURRENT CURSOR LOCAL SCROLL DYNAMIC FOR SELECT FACULTY, 
FACULTY_NAME FROM FACULTY FOR UPDATE;
DECLARE @FAC VARCHAR(5), @FULL VARCHAR(50);
OPEN EX_5_CURRENT
FETCH FIRST FROM EX_5_CURRENT INTO @FAC, @FULL;
		PRINT @FAC + ' ' + @FULL;
		UPDATE FACULTY SET FACULTY = 'MOBILE' WHERE CURRENT OF EX_5_CURRENT;
		FETCH FIRST FROM EX_5_CURRENT INTO @FAC, @FULL;
		PRINT @FAC + ' ' + @FULL;
		
	CLOSE EX_5_CURRENT;
GO

SELECT * FROM FACULTY;


DELETE FACULTY WHERE  FACULTY = 'MOBILE'