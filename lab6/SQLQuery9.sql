/*9. ???????? ??????? ????? ?????-????? ?????, ????????? ? ?????????? ??-?????? ?????? 8.
 ????????? ?????????. 
???????????? ???????? EXCEPT.*/

use UNIVER;

select GROUPS.PROFESSION,P.SUBJECT,AVG(NOTE) as AVERAGE_NOTE
from GROUPS  full join STUDENT S on GROUPS.IDGROUP = S.IDGROUP and GROUPS.FACULTY='???'
 full join PROGRESS P on S.IDSTUDENT = P.IDSTUDENT
group by P.SUBJECT, GROUPS.PROFESSION
UNION
select GROUPS.PROFESSION,P.SUBJECT,AVG(NOTE) as AVERAGE_NOTE
from GROUPS full join STUDENT S on GROUPS.IDGROUP = S.IDGROUP and GROUPS.FACULTY='????'
 full join PROGRESS P on S.IDSTUDENT = P.IDSTUDENT
group by P.SUBJECT, GROUPS.PROFESSION

EXCEPT
select GROUPS.PROFESSION,P.SUBJECT,AVG(NOTE) as AVERAGE_NOTE
from GROUPS full join STUDENT S on GROUPS.IDGROUP = S.IDGROUP and GROUPS.FACULTY='???'
 full join PROGRESS P on S.IDSTUDENT = P.IDSTUDENT
group by P.SUBJECT, GROUPS.PROFESSION
UNION ALL
select GROUPS.PROFESSION,P.SUBJECT,AVG(NOTE) as AVERAGE_NOTE
from GROUPS full join STUDENT S on GROUPS.IDGROUP = S.IDGROUP and GROUPS.FACULTY='????'
 full join PROGRESS P on S.IDSTUDENT = P.IDSTUDENT
group by P.SUBJECT, GROUPS.PROFESSION