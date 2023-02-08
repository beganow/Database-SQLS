use UNIVER;

create table FACULTY
(    FACULTY      nvarchar(10)   primary key,
     FACULTY_NAME  nvarchar(50) default '�� �������'
);
insert into FACULTY   (FACULTY,   FACULTY_NAME )
	values	('����', '���������� ���������� � �������'),
			('���', '����������������� ���������'),
			('���', '���������-������������� ���������'),
			('����', '���������� � ������� ������ ��������������'),
			('���', '���������� ������������ �������'),
			('��', '��������� �������������� ����������'),
			('����', '������������ ���� � ����������');



create table PROFESSION
(     PROFESSION   nvarchar(20)  primary key,
      FACULTY    nvarchar(10) foreign key references FACULTY(FACULTY),
      PROFESSION_NAME nvarchar(100), 
	  QUALIFICATION   varchar(50)
);

insert into PROFESSION(FACULTY, PROFESSION, PROFESSION_NAME, QUALIFICATION)
	values	('��',  '1-40 01 02',   '�������������� ������� � ����������', '������������������-�������������' ),
			('����',  '1-36 01 08',    '��������������� � ������������ ��-����� �� �������������� ����������', '�������-�������' ),
			('����',  '1-36 07 01',  '������ � �������� ���������� ����������� � ����������� ������������ ����������', '�������-�������' ),
			('���',  '1-75 01 01',      '������ ���������', '������� ������� ���������' ),
			('���',  '1-75 02 01',   '������-�������� �������������', '����-��� ������-��������� �������������' ),
			('���',  '1-89 02 02',     '������ � ������������������', '�����-����� � ����� �������' ),
			('���',  '1-25 01 07',  '��������� � ���������� �� �����������', '���������-��������' ),
			('���',  '1-25 01 08',    '������������� ����, ������ � �����', '���������' ),
			('����',  '1-36 05 01',   '������ � ������������ ������� ���-������', '�������-�������' ),
			('����',  '1-46 01 01',      '�������������� ����', '�������-��������' ),
			('���',  '1-48 01 02',  '���������� ���������� ������������ �������, ���������� � �������', '�������-�����-��������' ),
			('���',  '1-48 01 05',    '���������� ���������� ����������� ���������', '�������-�����-��������' ),
			('���',  '1-54 01 03',   '������-���������� ������ � ������� �������� �������� ���������', '������� �� ������������' ),
			('����',  '1-47 01 01', '������������ ����', '��������-��������' ),
			('����',  '1-36 06 01',  '��������������� ������������ � ��-����� ��������� ����������', '�������-��������������' );


create table  PULPIT
(   PULPIT   nvarchar(20)   primary key,
    PULPIT_NAME  nvarchar(100),
    FACULTY   nvarchar(10)   foreign key references FACULTY(FACULTY)
);
insert into PULPIT   (PULPIT, PULPIT_NAME, FACULTY )
	values	('����', '�������������� ������ � ���������� ','��'),
			('��', '�����������','���'),
			('��', '��������������','���'),
			('�����', '���������� � ����������������','���'),
			('����', '������ ������� � ������������','���'),
			('���', '������� � ������������������','���'),
			('������','������������ �������������� � ������-��������� �������������','���'),
			('��', '���������� ����', '����'),
			('�����','������ ����� � ���������� �������������','����'),
			('���','���������� �������������������� �����������', '����'),
			('�����','���������� � ������� ������� �� ���������','����'),
			('��', '������������ �����','���'),
			('���','���������� ����������� ���������','���'),
			('�������','���������� �������������� ������� � ����� ���������� ���������� ','����'),
			('�����','��������� � ��������� ���������� �����������','����'),
			('����',    '������������� ������ � ����������','���'),
			('����',   '����������� � ��������� ������������������','���'),
			('������', '����������, �������������� �����, ������� � ������', '���'),
			('������','���������������� ������������ � ������ ��������� �����-����� ', '����'),
			('��', '����������� ���������','����'),
			('���', '�����������-������������ ���������', '����'),
			('��', '��������������� �����������','����');

			
create table TEACHER
(   TEACHER   nvarchar(10)    primary key,
    TEACHER_NAME  nvarchar(50),
    GENDER    nvarchar(1) CHECK (GENDER in ('�', '�')),
    PULPIT   nvarchar(20) foreign key references PULPIT(PULPIT)
);
insert into  TEACHER    (TEACHER,   TEACHER_NAME, GENDER, PULPIT )
	values	('����', '������ �������� �������������', '�', '����'),
			('�����', '�������� ��������� ��������', '�', '����'),
			('�����', '���������� ������� ����������', '�', '����'),
			('�����', '�������� ������ ��������', '�', '����'),
			('���', '����� ��������� ����������', '�', '����'),
			('���', '��������� ����� ��������', '�', '����'),
			('���', '����� ������� ��������', '�', '����'),
			('���', '����� ������� �������������',  '�', '����'),
			('���', '����� ����� �������������',  '�',   '����'),
			('������', '����������� ��������� ��������', '�', '����'),
			('����', '������� ��������� ����������', '�', '����'),
			('����', '������� ������ ����������',  '�',  '������'),
			('���', '���������� ������� ��������', '�', '������'),
			('���', '������ ������ ���������� ', '�', '��'),
			('�����', '��������� �������� ���������', '�', '�����'),
			('������', '���������� �������� ����������', '�', '��'),
			('�����', '�������� ������ ����������', '�', '��'),
			('������', '���������� ��������� �������������', '�','������'),
			('���', '��������� ������� �����������', '�', '������');



create table SUBJECT
(     [SUBJECT]  nvarchar(10)   primary key,
	  SUBJECT_NAME nvarchar(100) unique,
      PULPIT  nvarchar(20) foreign key references PULPIT(PULPIT)
)
insert into SUBJECT (SUBJECT, SUBJECT_NAME, PULPIT)
	values	('����', '������� ���������� ������ ������', '����'),
			('��', '���� ������','����'),
			('���', '�������������� ����������','����'),
			('����', '������ �������������� � ����������������', '����'),
			('��', '������������� ������ � ������������ ��������', '����'),
			('���', '���������������� ������� ����������','����'),
			('����', '������������� ������ ��������� ����������', '����'),
			('���', '�������������� �������������� ������', '����'),
			('��', '������������ ��������� ','����'),
			('���', '������������ �������������� �������', '����'),
			('��', '���������� ����������', '����'),
			('��', '�������������� ����������������','����'),
			('����', '���������� ������ ���',  '����'),
			('���', '��������-��������������� ����������������', '����'),
			('��', '��������� ������������������','����'),
			('��', '������������� ������','����'),
			('�������','������ ������-��������� � ������������� ���������',  '������'),
			('��', '���������� �������� ','��'),
			('��', '�����������', '�����'),
			('��', '������������ �����', '��'),
			('���', '������ ��������� ����','��'),
			('����', '���������� � ������������ �������������', '�����'),
			('����', '���������� ���������� �������� ���������� ','�������'),
			('�����', '��������. ������, �������� � �������� �����', '������'),
			('���', '����������� ��������. ������������', '������');



create table GROUPS
(   IDGROUP  int identity(1,1)  primary key,				
    FACULTY   nvarchar(10) foreign key references FACULTY(FACULTY),
    PROFESSION  nvarchar(20) foreign key references PROFESSION(PROFESSION),
    YEAR_FIRST  smallint  check (YEAR_FIRST<=YEAR(GETDATE())),
);
insert into GROUPS   (FACULTY,  PROFESSION, YEAR_FIRST )
	values	('����','1-40 01 02', 2013), --1
			('����','1-40 01 02', 2012),
			('����','1-40 01 02', 2011),
			('����','1-40 01 02', 2010),
			('����','1-47 01 01', 2013),---5 ��
			('����','1-47 01 01', 2012),
			('����','1-47 01 01', 2011),
			('����','1-36 06 01', 2010),-----8 ��
			('����','1-36 06 01', 2013),
			('����','1-36 06 01', 2012),
			('����','1-36 06 01', 2011),
			('����','1-36 01 08', 2013),---12 ��
			('����','1-36 01 08', 2012),
			('����','1-36 07 01', 2011),
			('����','1-36 07 01', 2010),
			('���','1-48 01 02', 2012), ---16 ��
			('���','1-48 01 02', 2011),
			('���','1-48 01 05', 2013),
			('���','1-54 01 03', 2012),
			('���','1-75 01 01', 2013),--20 ��
			('���','1-75 02 01', 2012),
			('���','1-75 02 01', 2011),
			('���','1-89 02 02', 2012),
			('���','1-89 02 02', 2011),
			('����','1-36 05 01', 2013),
			('����','1-36 05 01', 2012),
			('����','1-46 01 01', 2012),--27 ��
			('���','1-25 01 07', 2013),
			('���','1-25 01 07', 2012),
			('���','1-25 01 07', 2010),
			('���','1-25 01 08', 2013),
			('���','1-25 01 08', 2012); ---32 ��


create table STUDENT
(    IDSTUDENT   int  identity(1000,1) primary key,
      IDGROUP   int   foreign key references GROUPS(IDGROUP),
      [NAME]   nvarchar(100),
      BDAY   date,
      STAMP  int,
      INFO     xml,
      FOTO    nvarchar(20)
 );
insert into STUDENT (IDGROUP,[NAME], BDAY)
	values	(1, '���������� ��������� �������������','11.03.1995'),
			(1, '������ ��������� �������',		  '07.12.1995'),
			(1, '������ �������� ����������',     '12.10.1995'),
			(1, '����� ��������� ���������',      '08.01.1995'),
			(1, '����� ����� ��������',			  '02.08.1995'),
			(2, '����� ������� ��������',         '12.07.1994'),
			(2, '������� �������� ����������',    '06.03.1994'),
			(2, '�������� ����� �����������',     '09.11.1994'),
			(2, '������� ����� ���������',        '04.10.1994'),
			(2, '��������� ��������� ����������', '08.01.1994'),
			(3, '������� ������ ���������',       '02.08.1993'),
			(3, '������� ��� ����������',         '07.12.1993'),
			(3, '������� ����� �����������',      '02.12.1993'),
			(4, '������� ������ �����������',     '08.03.1992'),
			(4, '������� ����� �������������',    '02.06.1992'),
			(4, '�������� ����� �����������',     '11.12.1992'),
			(4, '�������� ������� �������������', '11.05.1992'),
			(4, '����������� ������� ��������',   '09.11.1992'),
			(4, '�������� ������� ����������',    '01.11.1992'),
			(5, '�������� ����� ������������',    '08.07.1995'),
			(5, '������ ������� ����������',      '02.11.1995'),
			(5, '������ ��������� �����������',   '07.05.1995'),
			(5, '����� ��������� ���������',      '04.08.1995'),
			(6, '���������� ����� ����������',    '08.11.1994'),
			(6, '�������� ������ ��������',       '02.03.1994'),
			(6, '���������� ����� ����������',    '04.06.1994'),
			(6, '��������� ���������� ���������', '09.11.1994'),
			(6, '����� ��������� �������',        '04.07.1994'),
			(7, '����������� ����� ������������', '03.01.1993'),
			(7, '������� ���� ��������',          '12.09.1993'),
			(7, '��������� ������ ��������',      '12.06.1993'),
			(7, '���������� ��������� ����������','09.02.1993'),
			(7, '������� ������ ���������',       '04.07.1993'),
			(8, '������ ������� ���������',       '08.01.1992'),
			(8, '��������� ����� ����������',     '12.05.1992'),
			(8, '�������� ����� ����������',      '08.11.1992'),
			(8, '������� ������� ���������',      '12.03.1992'),
			(9, '�������� ����� �������������',   '10.08.1995'),
			(9, '���������� ������ ��������',     '02.05.1995'),
			(9, '������ ������� �������������',   '08.01.1995'),
			(9, '��������� ��������� ��������',   '11.09.1995'),
			(10, '������ ������� ������������',   '08.01.1994'),
			(10, '������ ������ ����������',      '11.09.1994'),
			(10, '����� ���� �������������',      '06.04.1994'),
			(10, '������� ������ ����������',     '12.08.1994'),
			(11, '��������� ��������� ����������','07.11.1993'),
			(11, '������ ������� ����������',     '04.06.1993'),
			(11, '������� ����� ����������',      '10.12.1993'),
			(11, '������� ������ ����������',     '04.07.1993'),
			(11, '������� ����� ���������',       '08.01.1993'),
			(11, '����� ������� ����������',      '02.09.1993'),
			(12, '���� ������ �����������',       '11.12.1995'),
			(12, '������� ���� �������������',    '10.06.1995'),
			(12, '��������� ���� ���������',      '09.08.1995'),
			(12, '����� ����� ���������',         '04.07.1995'),
			(12, '��������� ������ ����������',   '08.03.1995'),
			(12, '����� ����� ��������',          '12.09.1995'),
			(13, '������ ����� ������������',     '08.10.1994'),
			(13, '���������� ����� ����������',   '10.02.1994'),
			(13, '�������� ������� �������������','11.11.1994'),
			(13, '���������� ����� ����������',   '10.02.1994'),
			(13, '����������� ����� ��������',    '12.01.1994'),
			(14, '�������� ������� �������������','11.09.1993'),
			(14, '������ �������� ����������',    '01.12.1993'),
			(14, '���� ������� ����������',       '09.06.1993'),
			(14, '�������� ���������� ����������','05.01.1993'),
			(14, '����������� ����� ����������',  '01.07.1993'),
			(15, '������� ��������� ���������',   '07.04.1992'),
			(15, '������ �������� ���������',     '10.12.1992'),
			(15, '��������� ����� ����������',    '05.05.1992'),
			(15, '���������� ����� ������������', '11.01.1992'),
			(15, '�������� ����� ����������',     '04.06.1992'),
			(16, '����� ����� ����������',        '08.01.1994'),
			(16, '��������� ��������� ���������', '07.02.1994'),
			(16, '������ ������ �����������',     '12.06.1994'),
			(16, '������� ����� ��������',        '03.07.1994'),
			(16, '������ ������ ���������',       '04.07.1994'),
			(17, '������� ��������� ����������',  '08.11.1993'),
			(17, '������ ����� ����������',       '02.04.1993'),
			(17, '������ ���� ��������',          '03.06.1993'),
			(17, '������� ������ ���������',      '05.11.1993'),
			(17, '������ ������ �������������',   '03.07.1993'),
			(18, '��������� ����� ��������',      '08.01.1995'),
			(18, '���������� ��������� ���������','06.09.1995'),
			(18, '�������� ��������� ����������', '08.03.1995'),
			(18, '��������� ����� ��������',      '07.08.1995');



create table PROGRESS
(  SUBJECT   nvarchar(10) foreign key  references SUBJECT([SUBJECT]),
     IDSTUDENT int   foreign key references STUDENT(IDSTUDENT),
     PDATE    date,
     NOTE     int check (NOTE between 1 and 10)
);
insert into PROGRESS (SUBJECT, IDSTUDENT, PDATE, NOTE)
    values ('����', 1001,  '01.10.2013',8),
           ('����', 1002,  '01.10.2013',7),
           ('����', 1003,  '01.10.2013',5),
           ('����', 1005,  '01.10.2013',4),
		   ('����', 1014,  '01.12.2013',5),
           ('����', 1015,  '01.12.2013',9),
           ('����', 1016,  '01.12.2013',5),
           ('����', 1017,  '01.12.2013',4),
		   ('��',   1018,  '06.5.2013',4),
           ('��',   1019,  '06.05.2013',7),
           ('��',   1020,  '06.05.2013',7),
           ('��',   1021,  '06.05.2013',9),
           ('��',   1022,  '06.05.2013',5),
           ('��',   1023,  '06.05.2013',6);