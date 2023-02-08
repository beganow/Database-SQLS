/*
����������� � ������� ������������� � ������ ���������� ������. ������������� ������
���� ��������� �� ������ SELECT-������� � �������� FACULTY � PULPIT.
������������� ������ ��������� ������-��� �������: ��������� (FACUL-TY.FACULTY_ NAME),
���������� ������ (����������� �� ������ ����� ������� PULPIT). 
 
*/
USE UNIVER;
GO
CREATE VIEW [���������� ������]
AS SELECT
FACULTY.FACULTY_NAME [���������],
COUNT(PULPIT.PULPIT)[���������� ������]
FROM FACULTY 
JOIN PULPIT ON FACULTY.FACULTY=PULPIT.FACULTY
GROUP BY FACULTY_NAME
go
SELECT * FROM [���������� ������];