/*7.??????????? ??? ???????? A ? B ?? ??????? ???? ?????? X_UNIVER. 

???????? A ???????????? ????? ????? ?????????? ? ??????? ??????????????? SERIALIZABLE. 
???????? B ? ????? ????-?????? ? ??????? ???????-???????? READ COMMITED.
???????? A ?????? ?????-?????????? ?????????? ???-???????, ????????????????? ? ???????????????? ??????.
 */
 USE UNIVER;


SET TRANSACTION ISOLATION LEVEL SERIALIZABLE 
BEGIN TRANSACTION 
DELETE AUDITORIUM WHERE AUDITORIUM = '123-4'
INSERT AUDITORIUM VALUES ('123-4', '??', 10, '123-1')
UPDATE AUDITORIUM SET AUDITORIUM_NAME = '123-4' WHERE AUDITORIUM = '123-4'
SELECT AUDITORIUM FROM AUDITORIUM WHERE AUDITORIUM = '123-4'
--------T1---------
SELECT AUDITORIUM FROM AUDITORIUM WHERE AUDITORIUM = '123-4'
--------T2---------
COMMIT 	


SELECT * FROM AUDITORIUM


--- B ---	
BEGIN TRANSACTION 	  
DELETE AUDITORIUM WHERE AUDITORIUM = '123-4' 
INSERT AUDITORIUM VALUES ('123-4', '??', 10, '123-1')
UPDATE AUDITORIUM SET AUDITORIUM_NAME = '123-4' WHERE AUDITORIUM = '123-4'
SELECT AUDITORIUM FROM AUDITORIUM  WHERE AUDITORIUM = '123-4'
--------T1---------
COMMIT
SELECT AUDITORIUM FROM AUDITORIUM  WHERE AUDITORIUM = '123-4'
--------T2---------
