use UNIVER
select AUDITORIUM.AUDITORIUM, AUDITORIUM_TYPE.AUDITORIUM_TYPE
from AUDITORIUM cross join AUDITORIUM_TYPE
where AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE;

use [������ �������]
select distinct ������.������������,������.����,������.����_�������
from ������ Cross JOIN ������
Where ������.������������_������=������.������������