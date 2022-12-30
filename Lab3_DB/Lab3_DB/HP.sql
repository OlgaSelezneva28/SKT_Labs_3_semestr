--Drop database HOSPITAL
USE MASTER;
GO
CREATE database HOSPITAL
on primary
( name = N'HOSPITAL_mdf', filename = N'C:\HOSPITAL\HOSPITAL_mdf.mdf', 
   size = 5 Mb, maxsize=10 Mb, filegrowth=1 Mb),
 ( name = N'HOSPITAL_ndf', filename = N'C:\HOSPITAL\HOSPITAL_ndf.ndf', 
 size= 5 Mb, maxsize=10 Mb, filegrowth=10%),
  
 filegroup G1
 ( name=N'HOSPITAL1_ndf' , filename=N'C:\HOSPITAL\HOSPITAL1_ndf.ndf', 
 size=10 Mb, maxsize=15 Mb, filegrowth=1 Mb),
  ( name=N'HOSPITAL2_ndf' , filename=N'C:\HOSPITAL\HOSPITAL2_ndf.ndf', 
 size=2 Mb, maxsize=5 Mb, filegrowth=1 Mb),
 
 filegroup G2
 ( name=N'HOSPITAL3_ndf' , filename=N'C:\HOSPITAL\HOSPITAL3_ndf.ndf', 
 size=5 Mb, maxsize=10 Mb, filegrowth=1 Mb),
  ( name=N'HOSPITAL4_ndf' , filename=N'C:\HOSPITAL\HOSPITAL4_ndf.ndf', 
 size=2 Mb, maxsize=5 Mb, filegrowth=1 Mb)
 
log on
( name = N'HOSPITAL_log', filename=N'C:\HOSPITAL\HOSPITAL_log.ldf',       
   size=5Mb,  maxsize=UNLIMITED, filegrowth=1Mb);
   go

  USE HOSPITAL;

--1-----------�������� � ���������� �������  OTDELENIJA
create table OTDELENIJA
(  KOD_OTDEL integer  identity(1,1) constraint  OTDELENIJA_PK  primary key,
     NAME_OTDEL varchar(50) NOT NULL)
insert into  OTDELENIJA   (NAME_OTDEL)   values ('��������� ������������ � �������������');
insert into  OTDELENIJA   (NAME_OTDEL)   values ('���������������� ���������');
insert into  OTDELENIJA   (NAME_OTDEL)   values ('��������������� ���������');

--DROP table OTDELENIJA;

--2-----------�������� � ���������� �������  DOLJNOSTI
create table DOLJNOSTI
(  KOD_DOLJNOSTI integer  identity(1,1)constraint  DOLJNOSTI_PK  primary key, 
     NAME_DOLJNOSTI varchar(50) NOT NULL,
     OKLAD INTEGER   NOT NULL  )
insert into  DOLJNOSTI   (NAME_DOLJNOSTI,OKLAD)   values ('��������� ����������',9000000);  
insert into  DOLJNOSTI   (NAME_DOLJNOSTI,OKLAD)   values ('������� ���������',5000000); 
insert into  DOLJNOSTI   (NAME_DOLJNOSTI,OKLAD)   values ('����-����������',7000000); 
insert into  DOLJNOSTI   (NAME_DOLJNOSTI,OKLAD)   values ('����-��������',6500000);
insert into  DOLJNOSTI   (NAME_DOLJNOSTI,OKLAD)   values ('���� ������-���������',10000000);

--DROP table DOLJNOSTI;

--3-----------�������� � ���������� �������  PERSONAL
create table PERSONAL 
( KOD_SOTRUD   integer  identity(1,1) constraint PERSONAL_PK  primary key,
 FIO    nvarchar(100) not null,
 ADDRESS    nvarchar(100) NOT NULL,
 DATA_ROJD     date NOT NULL,
 TELEFON    nvarchar(100),
 KOD_OTDEL INTEGER constraint PERSONAL_OT_FK foreign key         
                      references OTDELENIJA(KOD_OTDEL),
 KOD_DOLJNOSTI INTEGER  constraint PERSONAL_DOL_FK foreign key         
                      references DOLJNOSTI(KOD_DOLJNOSTI))     
--��������� � ������� ���������                     
insert into  PERSONAL  (FIO,ADDRESS,DATA_ROJD,TELEFON,KOD_OTDEL,KOD_DOLJNOSTI) 
values ('������� ������ ������������','�. �����, ��. ������� 22','27.01.1982','8017-509-74-03',2,1);
insert into  PERSONAL  (FIO,ADDRESS,DATA_ROJD,TELEFON,KOD_OTDEL,KOD_DOLJNOSTI) 
values ('������� ����� �������������','�. �����, ��. ���������� 123','07.03.1991','8017-509-75-63',2,2);
insert into  PERSONAL  (FIO,ADDRESS,DATA_ROJD,TELEFON,KOD_OTDEL,KOD_DOLJNOSTI) 
values ('�������� ������� ���������','�. �����, ��. ������� 34','01.07.1985','8017-509-75-82',1,1);
insert into  PERSONAL  (FIO,ADDRESS,DATA_ROJD,TELEFON,KOD_OTDEL,KOD_DOLJNOSTI) 
values ('����� ���� ����������','�. �����, ��. ������������� 55','23.04.1989','8017-509-75-70',1,2);
insert into  PERSONAL  (FIO,ADDRESS,DATA_ROJD,TELEFON,KOD_OTDEL,KOD_DOLJNOSTI) 
values ('���������� ������� �������������','�. �����, ��. �������� 90','16.02.1981','8017-509-74-92',3,1);
insert into  PERSONAL  (FIO,ADDRESS,DATA_ROJD,TELEFON,KOD_OTDEL,KOD_DOLJNOSTI) 
values ('��������� ���� ���������','�. �����, ��. �������� 167','28.12.1979','8017-509-74-92',3,2);
--�����
insert into  PERSONAL  (FIO,ADDRESS,DATA_ROJD,TELEFON,KOD_OTDEL,KOD_DOLJNOSTI) 
values ('�������� ����� ����������','�. �����, ��. �������� 45','15.03.1977','8017-509-73-65',1,3);
insert into  PERSONAL  (FIO,ADDRESS,DATA_ROJD,TELEFON,KOD_OTDEL,KOD_DOLJNOSTI) 
values ('������� ������� ����������','�. �����, ��. ������ 89','10.05.1975','8017-509-73-44',3,4);
insert into  PERSONAL  (FIO,ADDRESS,DATA_ROJD,TELEFON,KOD_OTDEL,KOD_DOLJNOSTI) 
values ('�������� �������� ��������','�. �����, ��. ������� 13','22.09.1978','8017-509-73-32',2,5);

--DROP table PERSONAL;

--4-----------�������� � ���������� �������  DIAGNOZY
create table DIAGNOZY
(  KOD_DIAGNOZA integer  identity(1,1) constraint  DIAGNOZY_PK  primary key,
     NAME_DIAGNOZY varchar(50) NOT NULL,
     KOD_OTDEL      integer  constraint DIAGNOZY_FK foreign key         
                      references OTDELENIJA(KOD_OTDEL))
insert into  DIAGNOZY  (NAME_DIAGNOZY,KOD_OTDEL)   values ('������������ �����',1);  
insert into  DIAGNOZY  (NAME_DIAGNOZY,KOD_OTDEL)   values ('���� ������',1);
  
insert into  DIAGNOZY  (NAME_DIAGNOZY,KOD_OTDEL)   values ('������� �������� ',2);  
insert into  DIAGNOZY  (NAME_DIAGNOZY,KOD_OTDEL)   values ('������� ��������������� ��������',2);  

insert into  DIAGNOZY  (NAME_DIAGNOZY,KOD_OTDEL)   values ('������������ ����������',3);
insert into  DIAGNOZY  (NAME_DIAGNOZY,KOD_OTDEL)   values ('������� ��������',3); 

--DROP table DIAGNOZY;

--5-----------�������� � ���������� �������  PACIENTY
create table PACIENTY
( KOD_PACIENTA   integer  identity(1,1)constraint PACIENTY_PK  primary key,
 FIO    nvarchar(100) NOT NULL,
 GENDER        char(1) CHECK (GENDER in ('�', '�')),
KOD_OTDEL      integer  constraint P_OT_FK foreign key         
                      references OTDELENIJA(KOD_OTDEL),
 ADDRESS    nvarchar(100) NOT NULL,
KOD_DIAGNOZA   integer  constraint P_DIA_FK foreign key         
                      references DIAGNOZY(KOD_DIAGNOZA),
 DATA_POSTUP DATE NOT NULL,
 DATA_VYPISKI DATE NOT NULL)                   
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('��������� �������� ��������','�',2,'�. ����� ��. ������ 1',3,'2016-03-21','2016-04-04');--�
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������� ������� ����������','�',3,'�. ����� ��. ��� 56',6,'2016-02-28','2016-03-29');--�
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������������ �������� ���������','�',2,'�. ����� ��. ������ 123',4,'2016-03-22','2016-04-26');--�
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('�������� ������ ����������','�',1,'�. ����� ��. ������ 45',1,'2016-02-09','2016-05-09');--�
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('�������� �������� ��������','�',2,'�. ����� ��. ������� 15',3,'2016-03-30','2016-02-13');--�
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������� ����� ����������','�',3,'�. ����� ��. ������� 23',5,'2016-03-28','2016-02-25');--�
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('�������� ������� �������������','�',1,'�. ����� ��. ������� 78',2,'2016-03-15','2016-03-25');--�
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������� ������ �����������','�',1,'�. ����� ��. ������� 11',2,'2016-03-29','2016-04-08');--�
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('���������� ������� ��������','�',1,'�. ����� ��. ������� 1',1,'2015-03-29','2015-06-29');--�
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('�������� ������ ����������','�',2,'�. ����� ��. ��������� 35',4,'2015-12-29','2016-02-08');--10
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('��������� ���� ������������','�',2,'�. ����� ��. ���������� 2',3,'2015-01-27','2015-02-28');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������� ������ ���������','�',1,'�. ����� ��. ����� ������ 123',2,'2015-11-15','2016-11-30');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('�������� ��������� ��������','�',3,'�. ����� ��. �������� 33',6,'2015-08-09','2015-08-28');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('�������� ����� ����������','�',3,'�. ����� ��. ������������ 21',5,'2015-05-10','2015-05-17');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('�������� ������� ��������','�',1,'�. ����� ��. ������ 22',2,'2015-03-05','2015-03-20');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������� ���� ����������','�',1,'�. ����� ��. ���� 59',1,'2016-03-29','2016-06-29'); --���������
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('���������� ������ ���������','�',3,'�. ����� ��. ���������� 243',6,'2016-01-29','2016-02-13');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('�������� ����� �����������','�',3,'�. ����� ������� �������� 13',5,'2016-02-05','2016-02-12');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('��������� ������ ��������','�',2,'�. ����� ��. ����� ������ 90',4,'2016-02-15','2016-03-25');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������ ������ ����������','�',2,'�. ����� ��. �������������� 202',3,'2016-02-20','2016-03-20');--20
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������ ����� ��������','�',3,'�. ����� ��. ������ 12',6,'2016-01-10','2016-01-25');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('���������� ������� �������������','�',3,'�. ����� ��. �������� 55',5,'2016-01-03','2016-01-10');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������� ����� ���������','�',1,'�. ����� ��. ������� 1',2,'2016-01-11','2016-01-27');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������� ����� ��������','�',2,'�. ����� ��. �������� 67',4,'2016-03-01','2016-05-08');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('�������� ���� ����������','�',2,'�. ����� ��. ������� 45',3,'2016-03-10','2016-04-11');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('��������� ������ �������','�',2,'�. ����� ��. ������ 14',4,'2016-03-20','2016-05-01');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('��������� ������� ��������','�',1,'�. ����� ��. ��������� 158',2,'2016-03-12','2016-02-28');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('�������� ���� ��������','�',3,'�. ����� ��. ������������ 34',6,'2016-04-05','2016-04-21');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������� �������� ���������','�',2,'�. ����� ��. ������������ 99',3,'2016-04-11','2016-05-11');--29
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('��������� ����� ����������','�',3,'�. ����� ��. ������� 4',5,'2016-04-15','2016-04-22');--30
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('��������� ������� ����������','�',1,'�. ����� ��. �������� 69',2,'2016-04-21','2016-05-02');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������� ������� �������','�',3,'�. ����� ��. ������������ 50',6,'2016-04-27','2016-05-13');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('���������� ����� ���������','�',1,'�. ����� ��. ���������� 269',2,'2016-04-30','2016-05-16');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('�������� ���������� �������������','�',3,'�. ����� ��. ��������� 49',5,'2016-04-30','2016-05-07');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('���������� �������� ���������','�',1,'�. ����� ��. ���������� 23',2,'2016-05-01','2016-05-16');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������ ������� �������������','�',1,'�. ����� ��. ������������� 94',1,'2016-05-03','2016-08-04');--�����
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������ ����� ���������','�',2,'�. ����� ��. ���� ������� 1',3,'2016-05-05','2016-06-06');--����
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('���������� ����� ���������','�',2,'�. ����� ��. �������� 70',4,'2016-05-06','2016-06-12');--�����
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������� ����� �������������','�',3,'�. ����� ��. ������� 56',5,'2016-05-08','2016-05-15');--39
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������� �������� ���������','�',3,'�. ����� ��. ���� ������ 66',6,'2016-05-10','2016-05-26');--40
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('���� ���� ��������','�',3,'�. ����� ��. ��������� 11',6,'2016-05-11','2016-05-28');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������ ���� ��������','�',3,'�. ����� ��. �������� 56',5,'2016-05-13','2016-05-20');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('�������� �������� ����������','�',2,'�. ����� ��. ���������� 2',4,'2016-05-15','2016-06-22');--�����
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('�������� ��������� ����������','�',2,'�. ����� ��. ��������� 59',3,'2016-05-18','2016-06-19');--�����
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('��������� ��� ����������','�',1,'�. ����� ��. �������� 54',2,'2016-05-20','2016-06-06');--�����
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('����� ���� �������������','�',1,'�. ����� ��. ���������� 4',1,'2016-05-21','2016-08-22');--�����
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('�������� ���� ������������','�',2,'�. ����� ��. ����� 45',4,'2016-05-22','2016-06-30');--�����
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('���������� ������ ������������','�',3,'�. ����� ��. 8 ����� 3',6,'2016-05-23','2016-06-13');--�����
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('����������� ��������� ����������','�',1,'�. ����� ��. �������� 45',2,'2016-05-23','2016-06-14');--� --49
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������� ����� ����������','�',2,'�. ����� ��. �������� 96',3,'2016-05-24','2016-06-25'); --50 �
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('����� ������� ������������','�',3,'�. ����� ��. �������� 88',5,'2016-05-25','2016-06-01'); --�
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('��������� �������� ����������','�',1,'�. ����� ��. ��������� 3',2,'2016-05-25','2016-06-11');  --�
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('�������� ��������� �������������','�',2,'�. ����� ��. �������� 56',4,'2016-05-26','2016-07-02');--�
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('�������� ������� �����������','�',3,'�. ����� ��. ��������� 5',6,'2016-05-26','2016-06-11');--�
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������� ������� ����������','�',1,'�. ����� ��. ������������ 6',1,'2016-05-27','2016-08-28');--�
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('��� ��������� ������������','�',2,'�. ����� ��. ������� 51',3,'2016-05-27','2016-06-27');--�
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('��������� ������� ���������','�',2,'�. ����� ��. �������� 60',4,'2016-05-28','2016-06-29');--�
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������� ��������� ��������','�',3,'�. ����� ��. ���������� 56',5,'2016-05-29','2016-06-05');--�
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('�������� ��������� ��������','�',3,'�. ����� ��. ���������� 4',6,'2016-05-29','2016-05-14');--� 59
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������� ������ ���������','�',2,'�. ����� ��. ������ 9',4,'2016-05-30','2016-07-08');--� 60
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('�������� �������� ������������','�',2,'�. ����� ��. ������� 34',3,'2016-05-30','2016-06-30');--�
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('���� ������� ����������','�',1,'�. ����� ��. �������� 40',2,'2016-05-31','2016-06-15');--�
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('�������� ������� ��������','�',1,'�. ����� ��. ������ 8',1,'2016-04-25','2016-07-26');--�
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������� ����� ���������','�',3,'�. ����� ��. ������� 67',6,'2016-04-27','2016-05-12');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������ ��������� ����������','�',2,'�. ����� ��. ������� 7',4,'2016-04-15','2016-05-23');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������ ������ ����������','�',1,'�. ����� ��. �������� 50',2,'2016-04-22','2016-03-30');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('�������� ���� ���������','�',2,'�. ����� ��. ������� 70',6,'2016-04-20','2016-05-28');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('���� ��������� �����������','�',3,'�. ����� ��. ���������� 54',6,'2016-04-19','2016-05-27');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('��������� ����� ����������','�',1,'�. ����� ��. ������� 48',2,'2016-04-15','2016-04-30'); --69
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('����� ������ ��������','�',1,'�. ����� ��. ������� 59',1,'2016-04-13','2016-07-14');--� 70
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('�������� ����� �����','�',2,'�. ����� ��. �������� 6',3,'2016-04-10','2016-05-10');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('�������� ������� ��������','�',3,'�. ����� ��. �������� 45',5,'2016-04-07','2016-04-16');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������� ���� ���������','�',3,'�. ����� ��. �������� 33',6,'2016-04-05','2016-02-10');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('��������� ������ �������','�',2,'�. ����� ��. ��������� 9',4,'2016-04-03','2016-05-10');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('�������� ������ ����������','�',1,'�. ����� ��. ���������� 60',2,'2016-04-01','2016-04-16');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������������ ������ ���������','�',1,'�. ����� ��. �������� 1',1,'2016-03-29','2016-06-30');-- �����
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('����� ����� ������������','�',1,'�. ����� ��. ����� 320',2,'2016-03-27','2016-04-14');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������ ����� ����������','�',3,'�. ����� ��. ������ 50',6,'2016-03-25','2016-04-11');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������ ������ ��������','�',3,'�. ����� ��. �������� 20',5,'2016-03-20','2016-03-26'); --79
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('����������� ���� ���������','�',3,'�. ����� ��. ��������� 7',3,'2016-03-19','2016-04-20');--80
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������� ���� ���������','�',3,'�. ����� ��. ����� 55',4,'2016-03-16','2016-04-25');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('���������� ������� �������������','�',1,'�. ����� ��. ������� 11',2,'2016-03-15','2016-03-30');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('��������� �� ����������','�',1,'�. ����� ��. ����� ������ 6',1,'2016-03-12','2016-06-13');--�����
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('����� ���� ���������','�',2,'�. ����� ��. ������ 127',4,'2016-03-10','2016-04-11');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������� ����� ����������','�',3,'�. ����� ��. ������� 69',5,'2016-03-07','2016-03-16');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('����� ���� ������������','�',1,'�. ����� ��. ��������� 11',2,'2015-12-29','2016-01-15');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('����������� ���������� �������','�',3,'�. ����� ��. ������� 45',6,'2015-11-15','2015-11-30');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������ �������� ��������','�',3,'�. ����� ��. ���� 230',5,'2015-11-05','2015-11-12');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('�������� ����� ����������','�',2,'�. ����� ��. �������� 49',4,'2015-10-20','2015-11-29');--89
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������ ��������� ����������','�',2,'�. ����� ��. ������ 4',3,'2015-10-17','2015-11-18');--90
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������ �������� ��������','�',1,'�. ����� ��. ��������� 1',2,'2015-10-14','2015-10-30');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('���� ���� ����������','�',3,'�. ����� ��. �������� 290',6,'2015-10-13','2015-10-29');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('��������� ��������� ���������','�',2,'�. ����� ��. �������� 49',3,'2015-10-07','2015-11-08');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('�������� ��������� ����������','�',3,'�. ����� ��. �������� 39',6,'2015-10-03','2015-10-19');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������� ����� �����������','�',1,'�. ����� ��. ����� 6',1,'2015-10-01','2016-01-02');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������� ����� ����������','�',2,'�. ����� ��. ����������� 59',4,'2015-09-29','2015-11-04');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('���������� ������� ����������','�',1,'�. ����� ��. ������ 150',2,'2015-09-25','2015-10-11');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('������ �������� ����������','�',3,'�. ����� ��. ������� 11',5,'2015-09-20','2015-09-27');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('����� ������ ����������','�',3,'�. ����� ��. ���������� 40',6,'2015-09-15','2015-09-30'); --99
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('�������� ��������� ���������','�',1,'�. ����� ��. ������� 78',1,'2016-03-15','2016-06-15');--����� 100

--DROP TABLE PACIENTY;


--6-----------�������� � ���������� �������  LEKARSTVA
create table LEKARSTVA
(  KOD_LEKARSTVA integer  identity(1,1)constraint  LEKARSTVA_PK  primary key, 
   NAME_LEKARSTVA varchar(30) NOT NULL,
   KOL_V_DEN VARCHAR(50) NOT NULL,
   RAZ_V_DEN VARCHAR(50) NOT NULL,
   DLITEL_KURSA VARCHAR(50) NOT NULL  )
insert into LEKARSTVA  (NAME_LEKARSTVA,KOL_V_DEN,RAZ_V_DEN, DLITEL_KURSA)   values ('������','10 ��','1 �������� ��� 20 ������ � �����','10 ����'); 
insert into LEKARSTVA  (NAME_LEKARSTVA,KOL_V_DEN,RAZ_V_DEN, DLITEL_KURSA)   values ('�����������','300-400 ��/�^2','1 ��� � ����','�� �������������');
insert into LEKARSTVA  (NAME_LEKARSTVA,KOL_V_DEN,RAZ_V_DEN, DLITEL_KURSA)   values ('�����������','2-4 ��','3-4 ����/���','3 ������');  
insert into LEKARSTVA  (NAME_LEKARSTVA,KOL_V_DEN,RAZ_V_DEN, DLITEL_KURSA)   values ('������','175 ��/�^2','� ������� 3 ����� ������ 3 ������','�� �������������');
insert into LEKARSTVA  (NAME_LEKARSTVA,KOL_V_DEN,RAZ_V_DEN, DLITEL_KURSA)   values ('�������','120 ��','1 ��� � ����','5 ������');  
insert into LEKARSTVA  (NAME_LEKARSTVA,KOL_V_DEN,RAZ_V_DEN, DLITEL_KURSA)   values ('�����','20 ��','1 ��� � ����','2 ������');
 
--DROP TABLE LEKARSTVA;

--7-----------�������� � ���������� �������  DIAGNOZ_LEKAR
create table DIAGNOZ_LEKAR
(  ID integer  identity(1,1)constraint  D_L_PK  primary key, 
KOD_DIAGNOZA integer   constraint  DIAGNOZ_LD_FK foreign key         
                      references DIAGNOZY(KOD_DIAGNOZA), 
   KOD_LEKARSTVA   integer  constraint DIAGNOZ_LEKAR_FK foreign key         
                      references LEKARSTVA(KOD_LEKARSTVA)
     )
insert into DIAGNOZ_LEKAR (KOD_DIAGNOZA,KOD_LEKARSTVA )   values (1,3);  
insert into DIAGNOZ_LEKAR (KOD_DIAGNOZA,KOD_LEKARSTVA )   values (2,1);  
  
insert into DIAGNOZ_LEKAR (KOD_DIAGNOZA,KOD_LEKARSTVA )   values (3,6);  
insert into DIAGNOZ_LEKAR (KOD_DIAGNOZA,KOD_LEKARSTVA )   values (4,5); 
 
insert into DIAGNOZ_LEKAR (KOD_DIAGNOZA,KOD_LEKARSTVA )   values (5,2);  
insert into DIAGNOZ_LEKAR (KOD_DIAGNOZA,KOD_LEKARSTVA )   values (6,4); 

--DROP TABLE DIAGNOZ_LEKAR;

--8-----------�������� � ���������� �������  PROCEDURY
create table  PROCEDURY
(  KOD_PROCED integer  identity(1,1)constraint   PROCEDURY_PK  primary key, 
   NAME_PROCEDURY varchar(30) NOT NULL ,
   KOD_SOTRUD integer  constraint  PROCEDURY_FK foreign key         
                      references PERSONAL(KOD_SOTRUD),
   DLITELNOST integer NOT NULL,
   OPLATA INTEGER NOT NULL)
              
insert into  PROCEDURY (NAME_PROCEDURY,KOD_SOTRUD,DLITELNOST,OPLATA)   values ('�����������',1,10,25000); --10 �������
insert into  PROCEDURY (NAME_PROCEDURY,KOD_SOTRUD,DLITELNOST,OPLATA)   values ('�������������',5,15,55000);
insert into  PROCEDURY (NAME_PROCEDURY,KOD_SOTRUD,DLITELNOST,OPLATA)   values ('�������� ����������� ',6,30,40000);
insert into  PROCEDURY (NAME_PROCEDURY,KOD_SOTRUD,DLITELNOST,OPLATA)   values ('������������ ',3,6,1000000);
insert into  PROCEDURY (NAME_PROCEDURY,KOD_SOTRUD,DLITELNOST,OPLATA)   values ('��������-��������� �����',2,15,30000);

--DROP TABLE PROCEDURY;

--9-----------�������� � ���������� �������  DIAGNOZ_PROC
create table DIAGNOZ_PROC
( ID integer  identity(1,1)constraint  D_P_PK  primary key,
KOD_DIAGNOZA integer  constraint  DIAGNOZ_LEK_FK foreign key         
                      references DIAGNOZY(KOD_DIAGNOZA), 
   KOD_PROCED   integer  constraint DIAGNOZ_PROC_FK foreign key         
                      references PROCEDURY(KOD_PROCED)    )
                      
insert into DIAGNOZ_PROC (KOD_DIAGNOZA, KOD_PROCED)   values (1,1);  
insert into DIAGNOZ_PROC (KOD_DIAGNOZA, KOD_PROCED)   values (2,5);  
insert into DIAGNOZ_PROC (KOD_DIAGNOZA, KOD_PROCED)   values (3,4);  
insert into DIAGNOZ_PROC (KOD_DIAGNOZA, KOD_PROCED)   values (5,2);  
insert into DIAGNOZ_PROC (KOD_DIAGNOZA, KOD_PROCED)   values (6,3);  

--DROP TABLE DIAGNOZ_PROC;

--9-----------�������� � ���������� �������  ISTORIYA_BOLNOGO
create table ISTORIYA_BOLNOGO
(  KOD_ISTOR integer   identity(1,1) constraint  ISTORIYA_BOLNOGO_PK  primary key,
  KOD_PACIENTA   INTEGER constraint ISTOR_PAC_FK foreign key         
                      references PACIENTY(KOD_PACIENTA),
   KOD_DIAGNOZA INTEGER  constraint  DIAGNOZ_DIAG_FK  foreign key
					  references DIAGNOZY( KOD_DIAGNOZA),
  KOD_LEKARSTVA INTEGER  constraint DIAGNOZ_LEKR_FK foreign key         
                      references LEKARSTVA(KOD_LEKARSTVA),
   KOD_PROCED INTEGER constraint DIAGNOZ_PC_FK foreign key         
                      references PROCEDURY( KOD_PROCED),                   
 KOD_SOTRUD      integer  constraint DIAGNOZ_DOL_FK foreign key         
                      references PERSONAL (KOD_SOTRUD),
   KOL_PRODEL_PROC INTEGER)
     
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (1,3,6,4,5,6);  
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (2,6,4,3,4,15);  
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_SOTRUD)  values (3,4,5,5);  
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)  values (4,1,3,1,3,10);  
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (5,3,6,4,5,6);  
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (6,5,2,2,4,15);  
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (7,2,1,5,3,15);  
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (8,2,1,5,3,15);  
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (9,1,3,1,3,10); 
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_SOTRUD)   values (10,4,5,5); 
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (11,3,6,4,5,6);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (12,2,1,5,3,15);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (13,6,4,3,4,30);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (14,5,2,2,4,15);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (15,2,1,5,3,15);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (16,1,3,1,3,7);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (17,6,4,3,4,30);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (18,5,2,2,4,15);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_SOTRUD)   values (19,4,5,5);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (20,3,6,4,5,6);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (21,6,4,3,4,30);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (22,5,2,2,4,15);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (23,2,1,5,3,15); 
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_SOTRUD)   values (24,4,5,5);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (25,3,6,4,5,6);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_SOTRUD)   values (26,4,5,5);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (27,2,1,5,3,15);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (28,6,4,3,4,30);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (29,3,6,4,5,6);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (30,5,2,2,4,15);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (31,2,1,5,3,15);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (32,6,4,3,4,30);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (33,2,1,5,3,15);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (34,5,2,2,4,15);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (35,2,1,5,3,15);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (36,1,3,1,3,2);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (37,3,6,4,5,4);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_SOTRUD)   values (38,4,5,2);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (39,5,2,2,4,15);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (40,6,4,3,4,30);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (41,6,4,3,4,30);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (42,5,2,2,4,15);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_SOTRUD)   values (43,4,5,1);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (44,3,6,4,5,3);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (45,2,1,5,3,8);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (46,1,3,1,3,2);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_SOTRUD)   values (47,4,5,1);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (48,6,4,3,4,27);--bcghg
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (49,2,1,5,3,8);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (50,3,6,4,5,4);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (51,5,2,2,4,13);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (52,2,1,5,3,11);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_SOTRUD)   values (53,4,5,5);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (54,6,4,3,4,11);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (55,1,3,1,3,7);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (56,3,6,4,5,3);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_SOTRUD)   values (57,4,5,1);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (58,5,2,2,4,11);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (59,6,4,3,4,25);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_SOTRUD)   values (60,4,5,1);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (61,3,6,4,5,1);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (62,2,1,5,3,1);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (63,1,3,1,3,1);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (64,6,4,3,4,30);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_SOTRUD)   values (65,4,5,5);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (66,2,1,5,3,15);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (67,6,4,3,4,30);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (68,6,4,3,4,30);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (69,2,1,5,3,15);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (70,1,3,1,3,2);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (71,3,6,4,5,6);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (72,5,2,2,4,15);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (73,6,4,3,4,30);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_SOTRUD)   values (74,4,5,5);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (75,2,1,5,3,15);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (76,1,3,1,3,1);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (77,2,1,5,3,15);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (78,6,4,3,4,30);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (79,5,2,2,4,15);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (80,3,6,4,5,6);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_SOTRUD)   values (81,4,5,5);--4
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (82,2,1,5,3,15);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (83,1,3,1,3,4);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_SOTRUD)   values (84,4,5,5);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (85,5,2,2,4,15);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (86,2,1,5,3,15);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (87,6,4,3,4,30);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (88,5,2,2,4,15);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_SOTRUD)   values (89,4,5,5);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (90,3,6,4,5,6);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (91,2,1,5,3,15);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (92,6,4,3,4,30);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (93,3,6,4,5,6);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (94,6,4,3,4,30);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (95,1,3,1,3,10);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_SOTRUD)   values (96,4,5,5);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (97,2,1,5,3,15);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (98,5,2,2,4,15);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (99,6,4,3,4,30);
insert into ISTORIYA_BOLNOGO (KOD_PACIENTA,KOD_DIAGNOZA,KOD_LEKARSTVA, KOD_PROCED,KOD_SOTRUD,KOL_PRODEL_PROC)   values (100,1,3,1,3,7);
--DROP TABLE ISTORIYA_BOLNOGO;

--�������� ���� ������
SELECT *FROM PERSONAL;
SELECT * FROM OTDELENIJA;
SELECT * FROM DOLJNOSTI;
SELECT * FROM PACIENTY;
SELECT * FROM DIAGNOZY;
SELECT * FROM LEKARSTVA;
SELECT * FROM PROCEDURY;
SELECT * FROM DIAGNOZ_LEKAR;
SELECT * FROM DIAGNOZ_PROC;
SELECT * FROM ISTORIYA_BOLNOGO;


 --1 ������ ����������� � ���������.
CREATE VIEW [������_����������� ���������] AS SELECT PERSONAL.FIO [FIO], DOLJNOSTI.NAME_DOLJNOSTI [DOLJNOSTI]
FROM PERSONAL INNER JOIN DOLJNOSTI ON PERSONAL.KOD_DOLJNOSTI = DOLJNOSTI.KOD_DOLJNOSTI
GROUP BY PERSONAL.FIO, DOLJNOSTI.NAME_DOLJNOSTI 
SELECT * FROM [������_����������� ���������];
-- DROP  VIEW [������_����������� ���������];

--2 ������ ���������
CREATE VIEW [������ ���������] AS SELECT  OTDELENIJA.NAME_OTDEL [OTDEL]
FROM OTDELENIJA 
SELECT * FROM [������ ���������];
--DROP [������ ���������];

-- 3 ������ ����������� �� ���������� ????
CREATE VIEW [������ ��������� ���������] AS SELECT  OTDELENIJA.NAME_OTDEL [OTDEL], PERSONAL.FIO [FIO]
FROM PERSONAL INNER JOIN OTDELENIJA ON PERSONAL.KOD_OTDEL = OTDELENIJA.KOD_OTDEL
SELECT * FROM [������ ��������� ���������];
--DROP  VIEW [������ ��������� ���������]  ;
--������ ����������� 
CREATE VIEW [������ �����������] AS SELECT PERSONAL.FIO [FIO] FROM PERSONAL;
SELECT * FROM [������ �����������];
DROP VIEW [������ �����������];
--4 ������ ���������� 
CREATE VIEW [������ ����������] AS SELECT DOLJNOSTI.NAME_DOLJNOSTI [DOLJNOSTI] FROM DOLJNOSTI;
SELECT * FROM  [������ ����������];
-- DROP VIEW  [������ ����������];

--5 ������ ��������� 
CREATE VIEW [������ ���������] AS SELECT  DIAGNOZY.NAME_DIAGNOZY [DIAGNOZ] FROM  DIAGNOZY;
SELECT * FROM [������ ���������];
-- DROP VIEW [������ ���������];


--6 ������ ���������
CREATE VIEW [������ ���������] AS SELECT PACIENTY.FIO [FIO] FROM PACIENTY;
SELECT * FROM [������ ���������];
--DROP VIEW [������ ���������];

 --7 ������� ������ ����������� �� ������������ ���������.
 CREATE VIEW [����������_������������_���������] AS SELECT PERSONAL.FIO [FIO], DOLJNOSTI.NAME_DOLJNOSTI [DOLJNOSTI]
FROM PERSONAL INNER JOIN DOLJNOSTI ON PERSONAL.KOD_DOLJNOSTI = DOLJNOSTI.KOD_DOLJNOSTI
WHERE DOLJNOSTI.NAME_DOLJNOSTI = '������� ���������'
GROUP BY PERSONAL.FIO, DOLJNOSTI.NAME_DOLJNOSTI 
SELECT * FROM [����������_������������_���������];
-- DROP  VIEW [����������_������������_���������];

--8 ������� ������ �����������, ����� ������� ��������� n-� �����
CREATE VIEW [�����] AS SELECT PERSONAL.FIO [FIO], DOLJNOSTI.NAME_DOLJNOSTI [DOLJNOSTI], DOLJNOSTI.OKLAD [OKLAD]
FROM PERSONAL INNER JOIN DOLJNOSTI ON  PERSONAL.KOD_DOLJNOSTI = DOLJNOSTI.KOD_DOLJNOSTI
where DOLJNOSTI.OKLAD > (8000000)
SELECT * FROM [�����];
-- DROP  VIEW [�����];

--9 ������ ��������� �� ������������� ��������
CREATE VIEW [��������_�_���������] AS SELECT PACIENTY.FIO [FIO], DIAGNOZY.NAME_DIAGNOZY [DIAGNOZ]
FROM PACIENTY INNER JOIN DIAGNOZY ON PACIENTY.KOD_DIAGNOZA = DIAGNOZY.KOD_DIAGNOZA 
WHERE  DIAGNOZY.NAME_DIAGNOZY = '������� ��������'
SELECT * FROM [��������_�_���������];
-- DROP  VIEW [��������_�_���������];

--10 ������ ��������� � ������� ��� ���
CREATE VIEW [��������_���������] AS SELECT  DIAGNOZY.NAME_DIAGNOZY [DIAGNOZ] , LEKARSTVA.NAME_LEKARSTVA [LEKARSTVO]
FROM DIAGNOZY INNER JOIN DIAGNOZ_LEKAR ON DIAGNOZY.KOD_DIAGNOZA = DIAGNOZ_LEKAR.KOD_DIAGNOZA
INNER JOIN LEKARSTVA ON DIAGNOZ_LEKAR.KOD_LEKARSTVA = LEKARSTVA.KOD_LEKARSTVA
GROUP BY DIAGNOZY.NAME_DIAGNOZY, LEKARSTVA.NAME_LEKARSTVA;
SELECT * FROM [��������_���������];
-- DROP VIEW [��������_���������];

--11 ������ ��������� � ��������� ��� ���
CREATE VIEW [��������_���������] AS SELECT  DIAGNOZY.NAME_DIAGNOZY [DIAGNOZ], PROCEDURY.NAME_PROCEDURY [PROCEDURA],
PROCEDURY.OPLATA [OPLATA]
FROM DIAGNOZY INNER JOIN DIAGNOZ_PROC ON DIAGNOZY.KOD_DIAGNOZA = DIAGNOZ_PROC.KOD_DIAGNOZA
INNER JOIN PROCEDURY ON DIAGNOZ_PROC.KOD_PROCED = PROCEDURY.KOD_PROCED
GROUP BY DIAGNOZY.NAME_DIAGNOZY,  PROCEDURY.NAME_PROCEDURY,PROCEDURY.OPLATA;

SELECT * FROM [��������_���������];
--DROP VIEW [��������_���������];

 --12 ����� �������� ����� ��������� � ����� �������� ��� ����� ��������
CREATE VIEW [�����] AS SELECT PERSONAL.FIO [FIO],NAME_DOLJNOSTI [DOLJNOSTI], DIAGNOZY.NAME_DIAGNOZY [DIAGNOZ], LEKARSTVA.NAME_LEKARSTVA [LEKARSTVA]
FROM PERSONAL INNER JOIN DOLJNOSTI ON PERSONAL.KOD_DOLJNOSTI=DOLJNOSTI.KOD_DOLJNOSTI
INNER JOIN OTDELENIJA ON PERSONAL.KOD_OTDEL=OTDELENIJA.KOD_OTDEL 
INNER JOIN DIAGNOZY ON OTDELENIJA.KOD_OTDEL=DIAGNOZY.KOD_OTDEL 
INNER JOIN DIAGNOZ_LEKAR ON DIAGNOZY.KOD_DIAGNOZA=DIAGNOZ_LEKAR.KOD_DIAGNOZA
INNER JOIN LEKARSTVA ON DIAGNOZ_LEKAR.KOD_LEKARSTVA = LEKARSTVA.KOD_LEKARSTVA
SELECT * FROM [�����];
--DROP  VIEW [�����];


--13 (�) ������� ����������� �� ������������ ��������� 
CREATE FUNCTION SOTRUDNI_DOLJN (@D CHAR(100)) RETURNS CHAR(300)
AS BEGIN 
DECLARE  @TV CHAR(100);
DECLARE  @S VARCHAR(300) = ' ';
DECLARE SOTR CURSOR LOCAL 
FOR SELECT PERSONAL.FIO  
FROM PERSONAL INNER JOIN DOLJNOSTI ON PERSONAL.KOD_DOLJNOSTI = DOLJNOSTI.KOD_DOLJNOSTI
WHERE DOLJNOSTI.NAME_DOLJNOSTI = @D;
OPEN SOTR;
FETCH SOTR INTO @TV;
WHILE @@FETCH_STATUS = 0
BEGIN 
SET @S = @S +  RTRIM(@TV)+',' ;
FETCH SOTR INTO @TV;
END;
RETURN @S;
ENd;

--DROP FUNCTION SOTRUDNI_DOLJN;
CREATE VIEW [����������_���������] AS SELECT  DOLJNOSTI.NAME_DOLJNOSTI,  dbo.SOTRUDNI_DOLJN(DOLJNOSTI.NAME_DOLJNOSTI) [VRACH] -- ���� ������ 
FROM PERSONAL INNER JOIN DOLJNOSTI ON PERSONAL.KOD_DOLJNOSTI = DOLJNOSTI.KOD_DOLJNOSTI
GROUP BY DOLJNOSTI.NAME_DOLJNOSTI;

--DROP VIEW [����������_���������];
SELECT * FROM [����������_���������];
declare @ZV VARCHAR(300)=dbo.SOTRUDNI_DOLJN('��������� ����������');--�� ����������� 
   print '��������� �����������: ' +  @ZV ;
declare @M VARCHAR(300)=dbo.SOTRUDNI_DOLJN('������� ���������');
   print '������� ���������: '+ @M ;
declare @AL VARCHAR(300)=dbo.SOTRUDNI_DOLJN('����-����������');
   print '����-����������: '+ @AL ;
declare @NV VARCHAR(300)=dbo.SOTRUDNI_DOLJN('����-��������');
   print '����-��������: '+ @NV ;
declare @AG VARCHAR(300)=dbo.SOTRUDNI_DOLJN('���� ������-���������');
   print '���� ������-���������: ' +@AG ;


-- 14(�) �������� � ������������ ���������
CREATE FUNCTION PACIENT_DIAG (@D CHAR(300)) RETURNS CHAR(400)
AS BEGIN 
DECLARE  @TV CHAR(300);
DECLARE  @P VARCHAR(400) = ' ';
DECLARE SOTR CURSOR LOCAL 
FOR SELECT PACIENTY.FIO
FROM PACIENTY INNER JOIN DIAGNOZY ON PACIENTY.KOD_DIAGNOZA = DIAGNOZY.KOD_DIAGNOZA 
WHERE  DIAGNOZY.NAME_DIAGNOZY =  @D;
OPEN SOTR;
FETCH SOTR INTO @TV;
WHILE @@FETCH_STATUS = 0
BEGIN 
SET @P = @P +  RTRIM(@TV)+',' ;
FETCH SOTR INTO @TV;
END;
RETURN @P;
ENd;
--DROP FUNCTION PACIENT_DIAG;
CREATE VIEW [��������_�������] AS SELECT  DIAGNOZY.NAME_DIAGNOZY,  dbo.PACIENT_DIAG(DIAGNOZY.NAME_DIAGNOZY) [��������]
FROM PACIENTY INNER JOIN DIAGNOZY ON PACIENTY.KOD_DIAGNOZA = DIAGNOZY.KOD_DIAGNOZA 
GROUP BY DIAGNOZY.NAME_DIAGNOZY;

--DROP VIEW [��������_�������];
SELECT * FROM [��������_�������];
declare @BA VARCHAR(400)=dbo.PACIENT_DIAG('������������ �����');
   print '������������ �����: ' +  @BA ;
declare @OK VARCHAR(400)=dbo.PACIENT_DIAG('���� ������');
   print '���� ������: '+ @OK ;
declare @OJ VARCHAR(400)=dbo.PACIENT_DIAG('������� ��������');
   print '������� ��������: '+ @OJ ;



--15 (�) ��� ���������� � ��������� 
CREATE FUNCTION SOTRUDN_OTDEL (@O INT) RETURNS CHAR(300)
AS BEGIN 
DECLARE  @TV CHAR(100);
DECLARE  @S VARCHAR(300) = ' ';
DECLARE SOTR_O CURSOR LOCAL 
FOR SELECT PERSONAL.FIO  
FROM PERSONAL INNER JOIN OTDELENIJA ON PERSONAL.KOD_OTDEL = OTDELENIJA.KOD_OTDEL 
WHERE OTDELENIJA.KOD_OTDEL = @O;
OPEN SOTR_O;
FETCH SOTR_O INTO @TV;
WHILE @@FETCH_STATUS = 0
BEGIN 
SET @S = @S +  RTRIM(@TV)+',' ;
FETCH SOTR_O INTO @TV;
END;
RETURN @S;
ENd; 
--DROP FUNCTION SOTRUDN_OTDEL;
CREATE VIEW [����������_�����] AS SELECT  OTDELENIJA.NAME_OTDEL,  dbo.SOTRUDN_OTDEL(OTDELENIJA.KOD_OTDEL) [VRACH]
FROM PERSONAL INNER JOIN OTDELENIJA ON PERSONAL.KOD_OTDEL = OTDELENIJA.KOD_OTDEL 
GROUP BY OTDELENIJA.NAME_OTDEL, OTDELENIJA.KOD_OTDEL;
--DROP VIEW [����������_�����];
SELECT * FROM [����������_�����] 

declare @OD VARCHAR(400)=dbo.SOTRUDN_OTDEL('1');
   print '��������� ������������ � �������������: ' +  @OD ;
declare @DV VARCHAR(400)=dbo.SOTRUDN_OTDEL('2');
   print '���������������� ���������: '+ @DV ;
declare @TR VARCHAR(400)=dbo.SOTRUDN_OTDEL('3');
   print '��������������� ���������: '+ @TR ;

--16 (�)  ���� ����������� 
CREATE FUNCTION COUNT_SOTRUDNIKOV() RETURNS INT
AS BEGIN DECLARE @RC INT = 0;
SET @RC = (SELECT COUNT(*) FROM PERSONAL);
RETURN  @RC;
END;
-- DROP FUNCTION COUNT_SOTRUDNIKOV;
declare @KS VARCHAR(400)=dbo.COUNT_SOTRUDNIKOV();
   print '���������� �����������: '+ @KS;
 CREATE VIEW [���������� �����������] AS SELECT TOP(1) dbo.COUNT_SOTRUDNIKOV()[KOL]  FROM PERSONAL;
 --DROP VIEW [���������� �����������];
 SELECT * FROM [���������� �����������];

--17 (�) �������� ����������� � ��������� 
CREATE FUNCTION COUNT_SOTR_OT(@OT VARCHAR(20)) RETURNS INT
AS BEGIN DECLARE @RC INT = 0;
SET @RC = (SELECT COUNT(*) FROM PERSONAL INNER JOIN OTDELENIJA 
ON PERSONAL.KOD_OTDEL = OTDELENIJA.KOD_OTDEL
WHERE  OTDELENIJA.KOD_OTDEL = @OT);
RETURN  @RC;
END;
-- DROP FUNCTION COUNT_SOTR_OT;

CREATE VIEW [���������� � ���������] AS SELECT  OTDELENIJA.NAME_OTDEL,  dbo.COUNT_SOTR_OT(OTDELENIJA.KOD_OTDEL) [KOL]
FROM PERSONAL INNER JOIN OTDELENIJA ON PERSONAL.KOD_OTDEL = OTDELENIJA.KOD_OTDEL 
GROUP BY OTDELENIJA.NAME_OTDEL, OTDELENIJA.KOD_OTDEL;

--DROP VIEW [���������� � ���������] ;
SELECT * FROM [���������� � ���������] ; 
declare @KSO VARCHAR(400)=dbo.COUNT_SOTR_OT('1');
   print '���������� �����������  � 1 ���������: '+ @KSO;
declare @KSO VARCHAR(400)=dbo.COUNT_SOTR_OT('2');
   print '���������� ����������� �� 2 ���������: '+ @KSO;
declare @KSO VARCHAR(400)=dbo.COUNT_SOTR_OT('3');
   print '���������� ����������� � 3 ���������: '+ @KSO;

--18 (�) ���������� ��������� 
CREATE FUNCTION COUNT_PACIENT() RETURNS INT
AS BEGIN DECLARE @RC INT = 0;
SET @RC = (SELECT COUNT(*) FROM PACIENTY);
RETURN  @RC;
END;
-- DROP FUNCTION COUNT_PACIENT;
declare @KP VARCHAR(400)=dbo.COUNT_PACIENT(); 
   print '���������� ���������: '+ @KP;

CREATE VIEW [���������� ���������] AS SELECT top(1) dbo.COUNT_PACIENT() [KOL] FROM PACIENTY;
--DROP VIEW [���������� ���������];
SELECT * FROM [���������� ���������];

--19 (�) ���������� ��������� ������� ����� � ���������
CREATE FUNCTION COUNT_PAC_OT(@POT VARCHAR(20)) RETURNS INT
AS BEGIN DECLARE @RC INT = 0;
SET @RC = (SELECT COUNT(*) FROM PACIENTY INNER JOIN OTDELENIJA 
ON PACIENTY.KOD_OTDEL = OTDELENIJA.KOD_OTDEL
WHERE  OTDELENIJA.KOD_OTDEL = @POT);
RETURN  @RC;
END;
--DROP FUNCTION COUNT_PAC_OT;

CREATE VIEW [���_���_����] AS SELECT  OTDELENIJA.NAME_OTDEL,  dbo.COUNT_PAC_OT(OTDELENIJA.KOD_OTDEL) [KOL]
FROM PERSONAL INNER JOIN OTDELENIJA ON PERSONAL.KOD_OTDEL = OTDELENIJA.KOD_OTDEL 
GROUP BY OTDELENIJA.NAME_OTDEL, OTDELENIJA.KOD_OTDEL;

--DROP VIEW [���_���_����];
SELECT * FROM [���_���_����]
declare @KPO VARCHAR(400)=dbo.COUNT_PAC_OT('1');
   print '���������� ���������  � 1 ���������: '+ @KPO;
declare @KPO VARCHAR(400)=dbo.COUNT_PAC_OT('2');
   print '���������� ����������� �� 2 ���������: '+ @KPO;
declare @KPO VARCHAR(400)=dbo.COUNT_PAC_OT('3');
   print '���������� ����������� � 3 ���������: '+ @KPO;

--20 (�) ���������� ��������� � ������������ ��������� 
CREATE FUNCTION COUNT_PAC_D(@PD VARCHAR(20)) RETURNS INT
AS BEGIN DECLARE @RC INT = 0;
SET @RC = (SELECT COUNT(*) FROM PACIENTY INNER JOIN DIAGNOZY
ON PACIENTY.KOD_DIAGNOZA = DIAGNOZY.KOD_DIAGNOZA
WHERE  DIAGNOZY.NAME_DIAGNOZY =@PD);
RETURN  @RC;
END;
--DROP FUNCTION COUNT_PAC_D;
CREATE VIEW [���_���_����] AS SELECT  DIAGNOZY.NAME_DIAGNOZY ,  dbo.COUNT_PAC_D(DIAGNOZY.NAME_DIAGNOZY) [KOL]
FROM PACIENTY INNER JOIN DIAGNOZY
ON PACIENTY.KOD_DIAGNOZA = DIAGNOZY.KOD_DIAGNOZA
GROUP BY DIAGNOZY.NAME_DIAGNOZY;
--DROP VIEW [���_���_����];
SELECT * FROM  [���_���_����]
declare @KPD VARCHAR(400)=dbo.COUNT_PAC_D('������������ �����');
   print '���������� ���������  ������� ������������ ������: '+ @KPD;
declare @KPD VARCHAR(400)=dbo.COUNT_PAC_D('���� ������');
   print '���������� ���������  ������� ������ ������: '+ @KPD;
declare @KPD VARCHAR(400)=dbo.COUNT_PAC_D('������� �������� ');
   print '���������� ���������  ������� �������� ��������:  '+ @KPD;
declare @KPD VARCHAR(400)=dbo.COUNT_PAC_D('������� ��������');
   print '���������� ���������  ������� ��������� ��������: '+ @KPD;

 
 --21 (�) ������� � ����� �������� 
CREATE FUNCTION COL_VR_PAC (@o VARCHAR(50)) RETURNS INT
AS BEGIN 
DECLARE @rc INT=(SELECT  COUNT(*) FROM ISTORIYA_BOLNOGO 
WHERE ISTORIYA_BOLNOGO.KOD_SOTRUD=ISNULL(@o,ISTORIYA_BOLNOGO.KOD_SOTRUD));
RETURN @rc; END;
--DROP FUNCTION COL_VR_PAC

CREATE VIEW [���_���_��] AS SELECT PERSONAL.FIO ,  dbo.COL_VR_PAC(ISTORIYA_BOLNOGO.KOD_SOTRUD) [KOL]
FROM ISTORIYA_BOLNOGO INNER JOIN PERSONAL ON ISTORIYA_BOLNOGO.KOD_SOTRUD = PERSONAL.KOD_SOTRUD GROUP BY  PERSONAL.FIO,ISTORIYA_BOLNOGO.KOD_SOTRUD

--DROP VIEW [���_���_��];
SELECT *FROM [���_���_��]

--22 ����� �������� ��� �������� 
CREATE VIEW [�����_���������] AS SELECT DIAGNOZY.NAME_DIAGNOZY, LEKARSTVA.NAME_LEKARSTVA
FROM DIAGNOZY INNER JOIN DIAGNOZ_LEKAR 
ON DIAGNOZY.KOD_DIAGNOZA = DIAGNOZ_LEKAR.KOD_DIAGNOZA
INNER JOIN LEKARSTVA ON DIAGNOZ_LEKAR.KOD_LEKARSTVA = LEKARSTVA.KOD_LEKARSTVA
WHERE DIAGNOZY.NAME_DIAGNOZY = '������� ��������';
--DROP VIEW [�����_���������];
SELECT * FROM [�����_���������];

--23 ����� ��������� ��� ��������
CREATE VIEW [�����_���������] AS SELECT DIAGNOZY.NAME_DIAGNOZY [�������], PROCEDURY.NAME_PROCEDURY [���������]
FROM DIAGNOZY INNER JOIN  DIAGNOZ_PROC ON DIAGNOZY.KOD_DIAGNOZA = DIAGNOZ_PROC.KOD_DIAGNOZA
INNER JOIN PROCEDURY ON DIAGNOZ_PROC.KOD_PROCED = PROCEDURY.KOD_PROCED
WHERE DIAGNOZY.NAME_DIAGNOZY = '������� ��������';

--DROP VIEW [�����_���������];
SELECT * FROM [�����_���������];

--24 (�) ������� �������� �������� ��������  
CREATE FUNCTION COL_VR_PRO_PAC (@IS VARCHAR(20)) RETURNS INT
AS BEGIN 
DECLARE @TV CHAR(20)
DECLARE @P int = (SELECT PROCEDURY.DLITELNOST FROM   ISTORIYA_BOLNOGO INNER JOIN PROCEDURY
ON PROCEDURY.KOD_PROCED = ISTORIYA_BOLNOGO.KOD_PROCED
INNER JOIN PACIENTY ON ISTORIYA_BOLNOGO.KOD_PACIENTA = PACIENTY.KOD_PACIENTA  WHERE ISTORIYA_BOLNOGO.KOD_PACIENTA = @IS  );
DECLARE @OS int = (SELECT  KOL_PRODEL_PROC FROM  ISTORIYA_BOLNOGO INNER JOIN PROCEDURY
ON PROCEDURY.KOD_PROCED = ISTORIYA_BOLNOGO.KOD_PROCED
INNER JOIN PACIENTY ON ISTORIYA_BOLNOGO.KOD_PACIENTA = PACIENTY.KOD_PACIENTA  WHERE ISTORIYA_BOLNOGO.KOD_PACIENTA = @IS );
DECLARE @RC INT = 0;
declare CCC CURSOR LOCAL
FOR SELECT ISTORIYA_BOLNOGO.KOD_PACIENTA
FROM PROCEDURY INNER JOIN ISTORIYA_BOLNOGO
ON  PROCEDURY.KOD_PROCED = ISTORIYA_BOLNOGO.KOD_PROCED;
OPEN CCC;
FETCH CCC INTO @TV 
WHILE @@FETCH_STATUS = 0
BEGIN SET @RC  =  @P - @OS;
FETCH CCC INTO @TV; END;
RETURN @P - @OS;
 END;

--DROP FUNCTION COL_VR_PRO_PAC 
CREATE VIEW [���_���_��������] AS SELECT PACIENTY.FIO,  dbo.COL_VR_PRO_PAC(ISTORIYA_BOLNOGO.KOD_PACIENTA) [KOL]
FROM ISTORIYA_BOLNOGO INNER JOIN PACIENTY ON ISTORIYA_BOLNOGO.KOD_PACIENTA = PACIENTY.KOD_PACIENTA
WHERE dbo.COL_VR_PRO_PAC(ISTORIYA_BOLNOGO.KOD_PACIENTA) > 0
--DROP VIEW [���_���_��������];
 SELECT * FROM [���_���_��������]; 

 -- 33 ������� ������� �������� �������� � ������� �������� 
 CREATE VIEW [���_������_������_����] AS SELECT PACIENTY.FIO, ISTORIYA_BOLNOGO.KOL_PRODEL_PROC, dbo.COL_VR_PRO_PAC(ISTORIYA_BOLNOGO.KOD_PACIENTA) [KOL_OSTAV_PROC]
 FROM ISTORIYA_BOLNOGO INNER JOIN PACIENTY ON ISTORIYA_BOLNOGO.KOD_PACIENTA = PACIENTY.KOD_PACIENTA
 
 --DROP VIEW [���_������_������_����];
 SELECT * FROM [���_������_������_����];


 --25 ������ ��������� ������� �������� 
  CREATE VIEW [��������] AS
 SELECT PACIENTY.FIO, PACIENTY.DATA_VYPISKI FROM PACIENTY
 WHERE PACIENTY.DATA_VYPISKI < GETDATE();
 --DROP VIEW [��������];
  SELECT * FROM [��������];

  --26 ������ ��������� ������� ��� �� ��������
  CREATE VIEW [�� ��������] AS
 SELECT PACIENTY.FIO, PACIENTY.DATA_VYPISKI FROM PACIENTY
 WHERE PACIENTY.DATA_VYPISKI > GETDATE();
 --DROP VIEW [�� ��������];
  SELECT * FROM [�� ��������];

  -- 27 �������� ������� ���� � �������� � ������������ ���
  CREATE FUNCTION PAC_G(@o VARCHAR(50)) RETURNS TABLE
AS RETURN
SELECT PACIENTY.FIO FROM PACIENTY WHERE @O =YEAR(DATA_POSTUP)
--DROP FUNCTION PAC_G
SELECT * FROM dbo.PAC_G('2015');
-- 28 �����
  CREATE FUNCTION PAC_M(@o VARCHAR(50)) RETURNS TABLE
AS RETURN
SELECT PACIENTY.FIO FROM PACIENTY WHERE @O =MONTH(DATA_POSTUP);
--DROP FUNCTION PAC_M
SELECT * FROM dbo.PAC_M('2'); 

-- 29 ����� � ���
CREATE FUNCTION PAC_MG(@o VARCHAR(50),@M VARCHAR(50)) RETURNS TABLE
AS RETURN
SELECT PACIENTY.FIO FROM PACIENTY WHERE @O =MONTH(DATA_POSTUP) AND @M = YEAR(DATA_POSTUP)
--DROP FUNCTION PAC_MG
SELECT * FROM dbo.PAC_MG('2','2016') 

-- 30 ���������� ��������
--drop procedure NEW_PACIENT
create procedure NEW_PACIENT
@n NVARCHAR(100), 
@G CHAR(1),
@KT INT,
@AD NVARCHAR(100),
@KD INT,
@DP DATE,
@DV DATE
as 
declare @rc int=1; 
begin try 
insert into PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI) 
 values ( @n, @G, @KT, @AD, @KD, @DP, @DV) 
return @rc; 
end try 
begin catch 
print '����� ������ : ' + cast(error_number() as varchar(6)); 
print '��������� : ' + error_message(); 
print '������� : ' + cast(error_severity() as varchar(6)); 
print '����� : ' + cast(error_state() as varchar(8)); 
print '����� ������ : ' + cast(error_line() as varchar(8)); 
if error_procedure() is not null 
print '��� ��������� : ' + error_procedure(); 
return -1; 
end catch; 
go
declare @rc int; 
exec @rc=NEW_PACIENT @n ='���������� ���� ��������', @g = '�',
@KT = 2, @AD =  '�. ����� ��. ���� 2', @KD = 3, 
@DP = '2016-04-22', @DV = '2016-05-05';
print '������ ��������' ;
select * from PACIENTY

-- 31 ������ ���������� 
create procedure UPDATE_SOTRUDNIKA (@NN NVARCHAR(30),@N NVARCHAR(100),@AD NVARCHAR(100),@DR DATE,
--@T NVARCHAR(100),
--@KO INT,@KD INT,
 @COUNTS INT OUTPUT)
AS SELECT @COUNTS = COUNT(*)
FROM PERSONAL
WHERE PERSONAL.FIO = @NN
UPDATE  PERSONAL 
SET FIO = @N,
ADDRESS = @AD,
DATA_ROJD = @DR
WHERE PERSONAL.FIO = @NN;

 --DROP PROCEDURE UPDATE_SOTRUDNIKA;
DECLARE @CS VARCHAR(30);
EXECUTE UPDATE_SOTRUDNIKA @NN = '������� ������ ������������', 
@N = '������ ��������� �������',
@AD = '�. �����, ��. ���������� 129 ',
@DR = '26.11.1992',
@COUNTS = @CS OUTPUT ;
PRINT N'������� �����������: ' + CONVERT(NVARCHAR(30), @CS);
select * from PERSONAL;


--32 ���������� ���������� 
create procedure NEW_SOTRUDNIKA
@n NVARCHAR(100), @AD NVARCHAR(100),@DR DATE,
@T NVARCHAR(100),
@KO INT,
@KD INT
as 
declare @rc int=1; 
begin try 
insert into PERSONAL  (FIO,ADDRESS,DATA_ROJD,TELEFON,KOD_OTDEL,KOD_DOLJNOSTI) 
 values ( @n, @AD, @DR, @T, @KO, @KD) 
return @rc; 
end try 
begin catch 
print '����� ������ : ' + cast(error_number() as varchar(6)); 
print '��������� : ' + error_message(); 
print '������� : ' + cast(error_severity() as varchar(6)); 
print '����� : ' + cast(error_state() as varchar(8)); 
print '����� ������ : ' + cast(error_line() as varchar(8)); 
if error_procedure() is not null 
print '��� ��������� : ' + error_procedure(); 
return -1; 
end catch; 

declare @rc int; 
exec @rc=NEW_SOTRUDNIKA @n ='������� ������ ������������', 
 @AD =  '�. �����, ��. ������� 22', @DR = '27.01.1982', 
@T = '8017-509-74-03', @KO = 2, @KD = 1;
print '��������� ��������'
select * from PERSONAL;

-- 34 (�) ����� ������� �������� �������
CREATE FUNCTION COL_PC_VP(@IS VARCHAR(30)) RETURNS INT
AS BEGIN 
DECLARE @P VARCHAR(300) = (SELECT PACIENTY.DATA_VYPISKI FROM PACIENTY WHERE PACIENTY.DATA_VYPISKI > GETDATE() AND PACIENTY.FIO =  @IS );
RETURN DATEDIFF(DAY,GETDATE(),@P);  END;
--DROP FUNCTION COL_PC_VP

CREATE VIEW [�����������_����_��_�������] AS SELECT PACIENTY.FIO , dbo.COL_PC_VP('���������� ����� ���������') [KOL_DNEY_DO_VIPISKI] 
FROM PACIENTY WHERE PACIENTY.FIO = '���������� ����� ���������'

--DROP VIEW [�����������_����_��_�������];
SELECT * FROM [�����������_����_��_�������];

-- 35 ������ ���� �������� 
CREATE VIEW [���� ��������] AS
SELECT PACIENTY.FIO [FIOPACIENTA], OTDELENIJA.NAME_OTDEL, PACIENTY.DATA_POSTUP, PERSONAL.FIO [FIOVRACHA], DIAGNOZY.NAME_DIAGNOZY,
LEKARSTVA.NAME_LEKARSTVA, PROCEDURY.NAME_PROCEDURY, ISTORIYA_BOLNOGO.KOL_PRODEL_PROC, dbo.COL_VR_PRO_PAC(ISTORIYA_BOLNOGO.KOD_PACIENTA) [KOL_OSTAV_PROC], PACIENTY.DATA_VYPISKI
 FROM PACIENTY INNER JOIN OTDELENIJA ON PACIENTY.KOD_OTDEL = OTDELENIJA.KOD_OTDEL
INNER JOIN DIAGNOZY ON PACIENTY.KOD_DIAGNOZA = DIAGNOZY.KOD_DIAGNOZA
INNER JOIN DIAGNOZ_LEKAR ON DIAGNOZY.KOD_DIAGNOZA = DIAGNOZ_LEKAR.KOD_DIAGNOZA
INNER JOIN LEKARSTVA ON DIAGNOZ_LEKAR.KOD_LEKARSTVA = LEKARSTVA.KOD_LEKARSTVA 
INNER JOIN DIAGNOZ_PROC ON DIAGNOZY.KOD_DIAGNOZA = DIAGNOZ_PROC.KOD_DIAGNOZA
INNER JOIN PROCEDURY ON DIAGNOZ_PROC.KOD_PROCED = PROCEDURY.KOD_PROCED
INNER JOIN ISTORIYA_BOLNOGO ON PACIENTY.KOD_PACIENTA = ISTORIYA_BOLNOGO.KOD_PACIENTA
INNER JOIN PERSONAL ON ISTORIYA_BOLNOGO.KOD_SOTRUD = PERSONAL.KOD_SOTRUD

--DROP VIEW [���� ��������];
SELECT * FROM [���� ��������];

 -- 36 �������� �� ���������
 CREATE FUNCTION DIAGNOZ_OTDEL (@O INT) RETURNS VARCHAR(300)
AS BEGIN 
DECLARE  @TV CHAR(100);
DECLARE  @S VARCHAR(300) = ' ';
DECLARE DIA_O CURSOR LOCAL 
FOR SELECT DIAGNOZY.NAME_DIAGNOZY
FROM DIAGNOZY INNER JOIN OTDELENIJA ON DIAGNOZY.KOD_OTDEL = OTDELENIJA.KOD_OTDEL
WHERE OTDELENIJA.KOD_OTDEL = @O;
OPEN DIA_O;
FETCH DIA_O INTO @TV;
WHILE @@FETCH_STATUS = 0
BEGIN 
SET @S = @S +  RTRIM(@TV)+',';
FETCH DIA_O INTO @TV;
END;
RETURN @S;
ENd; 

--DROP FUNCTION  DIAGNOZ_OTDEL;
CREATE VIEW [�������_�����] AS SELECT  OTDELENIJA.NAME_OTDEL,  dbo.DIAGNOZ_OTDEL(OTDELENIJA.KOD_OTDEL) [DIAGNOZ]
FROM DIAGNOZY INNER JOIN OTDELENIJA ON DIAGNOZY.KOD_OTDEL = OTDELENIJA.KOD_OTDEL
GROUP BY OTDELENIJA.NAME_OTDEL, OTDELENIJA.KOD_OTDEL;

--DROP VIEW [�������_�����];
SELECT * FROM [�������_�����];

--37 (�) ��������� ��� ���������
 CREATE FUNCTION LECAR_OTDEL (@O INT) RETURNS VARCHAR(300)
AS BEGIN 
DECLARE  @LV CHAR(100);
DECLARE  @S VARCHAR(300) = ' ';
DECLARE DIA_O CURSOR LOCAL 
FOR SELECT LEKARSTVA.NAME_LEKARSTVA
FROM DIAGNOZY INNER JOIN OTDELENIJA ON DIAGNOZY.KOD_OTDEL = OTDELENIJA.KOD_OTDEL
INNER JOIN DIAGNOZ_LEKAR ON DIAGNOZY.KOD_DIAGNOZA = DIAGNOZ_LEKAR.KOD_DIAGNOZA
INNER JOIN LEKARSTVA ON DIAGNOZ_LEKAR.KOD_LEKARSTVA = LEKARSTVA.KOD_LEKARSTVA
WHERE OTDELENIJA.KOD_OTDEL = @O;
OPEN DIA_O;
FETCH DIA_O INTO @LV;
WHILE @@FETCH_STATUS = 0
BEGIN 
SET @S = @S +  RTRIM(@LV)+',';
FETCH DIA_O INTO @LV;
END;
RETURN @S;
ENd; 
--DROP FUNCTION  LECAR_OTDEL;

CREATE VIEW [���������_�����] AS SELECT  OTDELENIJA.NAME_OTDEL,  dbo.LECAR_OTDEL(OTDELENIJA.KOD_OTDEL) [LEKARSTVO]
FROM DIAGNOZY INNER JOIN OTDELENIJA ON DIAGNOZY.KOD_OTDEL = OTDELENIJA.KOD_OTDEL
GROUP BY OTDELENIJA.NAME_OTDEL, OTDELENIJA.KOD_OTDEL;

--DROP VIEW [���������_�����];
SELECT * FROM [���������_�����];

-- 37 ���� � �������� 
CREATE VIEW [INFA] AS SELECT OTDELENIJA.NAME_OTDEL,  dbo.SOTRUDN_OTDEL(OTDELENIJA.KOD_OTDEL) [VRACH],dbo.COUNT_SOTR_OT(OTDELENIJA.KOD_OTDEL) [KOL],
 dbo.COUNT_PAC_OT(OTDELENIJA.KOD_OTDEL) [KOL_PAC], dbo.DIAGNOZ_OTDEL(OTDELENIJA.KOD_OTDEL) [DIAGNOZ],
  dbo.LECAR_OTDEL(OTDELENIJA.KOD_OTDEL) [LEKARSTVO] FROM OTDELENIJA

-- DROP VIEW [INFA];
SELECT * FROM [INFA];

--������� ��� �������� 
CREATE TABLE TR_PAC
(IG INT IDENTITY,
ST VARCHAR(20) CHECK(ST IN ('INS','DEL','UPD')),
TRN VARCHAR(50),
C VARCHAR(300))
-- DROP TABLE TR_PAC;

-- ������ ��� ������� INSERT, DELETE, UPDATE
CREATE TRIGGER TRIG_PAC ON PACIENTY AFTER INSERT, DELETE, UPDATE
AS DECLARE  @A1 NVARCHAR(100),@A2 CHAR(1), @A3 INT, @A4 NVARCHAR(100), 
@A5 INT, @A6 DATE, @A7 DATE, @IN VARCHAR(300);
DECLARE @INS INT=(SELECT COUNT(*) FROM inserted),
@DEL INT = (SELECT COUNT(*) FROM deleted);
IF @INS > 0 AND @DEL = 0 BEGIN PRINT '������� INSERT';
SET @A1 = (SELECT [FIO] FROM inserted);
SET @A2 = (SELECT [GENDER] FROM inserted);
SET @A3 = (SELECT [KOD_OTDEL] FROM inserted);
SET @A4 = (SELECT [ADDRESS] FROM inserted);
SET @A5 = (SELECT [KOD_DIAGNOZA] FROM inserted);
SET @A6 = (SELECT [DATA_POSTUP] FROM inserted);
SET @A7 = (SELECT [DATA_VYPISKI] FROM inserted)
SET @IN = @A1 + ', ' + CAST(@A2 AS VARCHAR(20)) + ', ' + CAST(@A3 AS VARCHAR(20)) +
', '+ @A4 + ', ' + CAST(@A5 AS VARCHAR(20)) + ', ' +CAST(@A6 AS VARCHAR(20)) + ', ' + CAST(@A7 AS VARCHAR(20));
INSERT INTO TR_PAC(ST,TRN,C) VALUES('INS','TRIG_PAC',@IN);
END;ELSE
IF @INS = 0 AND @DEL > 0 BEGIN PRINT '�������: DELETE';
SET @A1 = (SELECT [FIO] FROM deleted);
SET @A2 = (SELECT [GENDER] FROM deleted);
SET @A3 = (SELECT [KOD_OTDEL] FROM deleted);
SET @A4 = (SELECT [ADDRESS] FROM deleted);
SET @A5 = (SELECT [KOD_DIAGNOZA] FROM deleted);
SET @A6 = (SELECT [DATA_POSTUP] FROM deleted);
SET @A7 = (SELECT [DATA_VYPISKI] FROM deleted)
SET @IN = @A1 + ', ' + CAST(@A2 AS VARCHAR(20)) + ', ' + CAST(@A3 AS VARCHAR(20)) +
', '+ @A4 + ', ' + CAST(@A5 AS VARCHAR(20)) + ', ' +CAST(@A6 AS VARCHAR(20)) + ', ' + CAST(@A7 AS VARCHAR(20));
INSERT INTO TR_PAC(ST,TRN,C) VALUES('DEL','TRIG_PAC',@IN);
END;ELSE
IF @INS > 0 AND @DEL > 0 BEGIN PRINT '�������: UPDATE';
SET @A1 = (SELECT [FIO] FROM inserted);
SET @A2 = (SELECT [GENDER] FROM inserted);
SET @A3 = (SELECT [KOD_OTDEL] FROM inserted);
SET @A4 = (SELECT [ADDRESS] FROM inserted);
SET @A5 = (SELECT [KOD_DIAGNOZA] FROM inserted);
SET @A6 = (SELECT [DATA_POSTUP] FROM inserted);
SET @A7 = (SELECT [DATA_VYPISKI] FROM inserted)
SET @IN = @A1 + ', ' + CAST(@A2 AS VARCHAR(20)) + ', ' + CAST(@A3 AS VARCHAR(20)) +
', '+ @A4 + ', ' + CAST(@A5 AS VARCHAR(20)) + ', ' +CAST(@A6 AS VARCHAR(20)) + ', ' + CAST(@A7 AS VARCHAR(20));
SET @A1 = (SELECT [FIO] FROM deleted);
SET @A2 = (SELECT [GENDER] FROM deleted);
SET @A3 = (SELECT [KOD_OTDEL] FROM deleted);
SET @A4 = (SELECT [ADDRESS] FROM deleted);
SET @A5 = (SELECT [KOD_DIAGNOZA] FROM deleted);
SET @A6 = (SELECT [DATA_POSTUP] FROM deleted);
SET @A7 = (SELECT [DATA_VYPISKI] FROM deleted)
SET @IN = @A1 + ', ' + CAST(@A2 AS VARCHAR(20)) + ', ' + CAST(@A3 AS VARCHAR(20)) +
', '+ @A4 + ', ' + CAST(@A5 AS VARCHAR(20)) + ', ' +CAST(@A6 AS VARCHAR(20)) + ', ' + CAST(@A7 AS VARCHAR(20)) +', '+ @IN;
INSERT INTO TR_PAC(ST,TRN,C) VALUES('UPD','TRIG_PAC',@IN);
END; RETURN;
-- DROP TRIGGER TRIG_PAC;
SELECT * FROM TR_PAC;
--�������
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI) 
values ('���������� ���� �������������','�',2,'�. ����� ��.������ 13',3,'2016-03-24','2016-04-07');
--��������
DELETE FROM PACIENTY WHERE ADDRESS = '�. ����� ��.������ 13';
--���������
UPDATE PACIENTY SET FIO = '���������� ����� �������������'
WHERE ADDRESS = '�. ����� ��.������ 13';
SELECT * FROM PACIENTY WHERE ADDRESS = '�. ����� ��.������ 13';


CREATE VIEW [�����2] AS SELECT PERSONAL.FIO [FIO],NAME_DOLJNOSTI [DOLJNOSTI], 
DIAGNOZY.NAME_DIAGNOZY [DIAGNOZ], LEKARSTVA.NAME_LEKARSTVA [LEKARSTVA],
 dbo.COL_VR_PAC(ISTORIYA_BOLNOGO.KOD_SOTRUD) [KOL]
FROM PERSONAL INNER JOIN DOLJNOSTI ON PERSONAL.KOD_DOLJNOSTI=DOLJNOSTI.KOD_DOLJNOSTI
INNER JOIN OTDELENIJA ON PERSONAL.KOD_OTDEL=OTDELENIJA.KOD_OTDEL 
INNER JOIN DIAGNOZY ON OTDELENIJA.KOD_OTDEL=DIAGNOZY.KOD_OTDEL 
INNER JOIN DIAGNOZ_LEKAR ON DIAGNOZY.KOD_DIAGNOZA=DIAGNOZ_LEKAR.KOD_DIAGNOZA
INNER JOIN LEKARSTVA ON DIAGNOZ_LEKAR.KOD_LEKARSTVA = LEKARSTVA.KOD_LEKARSTVA
INNER JOIN ISTORIYA_BOLNOGO ON ISTORIYA_BOLNOGO.KOD_SOTRUD = PERSONAL.KOD_SOTRUD
GROUP BY  PERSONAL.FIO,ISTORIYA_BOLNOGO.KOD_SOTRUD,DIAGNOZY.NAME_DIAGNOZY,
DOLJNOSTI.NAME_DOLJNOSTI,LEKARSTVA.NAME_LEKARSTVA
DROP VIEW [�����2];
select * from [�����2]
select * from [���_���_��];
CREATE VIEW [���_���_��] AS SELECT PERSONAL.FIO ,  dbo.COL_VR_PAC(ISTORIYA_BOLNOGO.KOD_SOTRUD) [KOL]
FROM ISTORIYA_BOLNOGO INNER JOIN PERSONAL ON ISTORIYA_BOLNOGO.KOD_SOTRUD = PERSONAL.KOD_SOTRUD GROUP BY  PERSONAL.FIO,ISTORIYA_BOLNOGO.KOD_SOTRUD

--�������� ���� ������
SELECT *FROM PERSONAL;
SELECT * FROM OTDELENIJA;
SELECT * FROM DOLJNOSTI;
SELECT * FROM PACIENTY;
SELECT * FROM DIAGNOZY;
SELECT * FROM LEKARSTVA;
SELECT * FROM PROCEDURY;
SELECT * FROM DIAGNOZ_LEKAR;
SELECT * FROM DIAGNOZ_PROC;
SELECT * FROM ISTORIYA_BOLNOGO;

 --������� ����� ������ �����������
 SELECT * FROM [������ �����������];
 
 -- ������ ��������� 
 SELECT * FROM [������ ���������];
 
 --������ ���������� 
 SELECT * FROM  [������ ����������];
 
 --������ ��������� 
 SELECT * FROM [������ ���������];
 
 --������ ���������
 SELECT * FROM [������ ���������];
 
  --������ ����������� � ���������
  SELECT * FROM [������_����������� ���������];
  
 --������ ����������� �� ������������ ���������
 SELECT * FROM [����������_������������_���������];
 
 --������ �����������, ����� ������� ��������� n-� �����
 SELECT * FROM [�����];
 
 --������ ��������� �� ������������� ��������
 SELECT * FROM [��������_�_���������];
 
 --������ ��������� � ������� ��� ���
 SELECT * FROM [��������_���������];
 
 --������ ��������� � ��������� ��� ���
 SELECT * FROM [��������_���������];
 
--����� �������� ����� ��������� � ����� �������� ��� ����� ��������
 SELECT * FROM [�����];
 
-- (�) ������� ����������� �� ������������ ��������� 
 SELECT * FROM [����������_���������];
 
 --(�) �������� � ������������ ���������
 SELECT * FROM [��������_�������];
 
--(�) ��� ���������� � ���������
 SELECT * FROM [����������_�����];
 
--(�) ���������� ���� ����������� 
SELECT * FROM [���������� �����������];

--(�) ������� ����������� � ���������
SELECT * FROM [���������� � ���������];

--(�) ���������� ��������� 
SELECT * FROM [���������� ���������];

--(�) ���������� ��������� ������� ����� � ���������
SELECT * FROM [���_���_����];

--(�) ���������� ��������� � ������������ ��������� 
SELECT * FROM  [���_���_����];

 --(�) ������� � ����� �������� 
 SELECT *FROM [���_���_��];
 
 --����� �������� ��� �������� 
 SELECT * FROM [�����_���������];
 
 --����� ��������� ��� ��������
 SELECT * FROM [�����_���������];
 
--(�) ������� �������� �������� �������� 
 SELECT * FROM [���_���_��������];
 
--������� ������� �������� �������� � ������� �������� 
 SELECT * FROM [���_������_������_����];
 
--������ ��������� ������� ��������
SELECT * FROM [��������];
 
--������ ��������� ������� ��� �� ��������
SELECT * FROM [�� ��������];
 
--(�) ����� ���������, ������� ���� � �������� �� ������������ ���
SELECT * FROM dbo.PAC_G('2015');
 
--(�) ����� ���������, ������� ���� � �������� �� ������������ �����
SELECT * FROM dbo.PAC_M('2') 
 
--(�) ����� ���������, ������� ���� � �������� �� ������������ ��� � �����
SELECT * FROM dbo.PAC_MG('2','2016') 

--(�) ����� ������� �������� �������
SELECT * FROM [�����������_����_��_�������];

--(�) �������� �� ��������� 
SELECT * FROM [�������_�����];

--(�) ��������� ��� ���������
SELECT * FROM [���������_�����];

 -- 37 ���� � �������� 
 SELECT * FROM [INFA];

  -- ���������� ��������
 declare @rc int; 
exec @rc=NEW_PACIENT @n ='���������� ���� ��������', @g = '�',
@KT = 2, @AD =  '�. ����� ��. ���� 2', @KD = 3, 
@DP = '2016-04-22', @DV = '2016-05-05';
print '������ ��������' ;
select * from PACIENTY

-- ������ ����������  
DECLARE @CS VARCHAR(30);
EXECUTE UPDATE_SOTRUDNIKA @NN = '������� ������ ������������', 
@N = '������ ��������� �������',
@AD = '�. �����, ��. ���������� 129 ',
@DR = '26.11.1992',
@COUNTS = @CS OUTPUT ;
PRINT N'������� �����������: ' + CONVERT(NVARCHAR(30), @CS);
select * from PERSONAL;


--���������� ���������� 
declare @rc int; 
exec @rc=NEW_SOTRUDNIKA @n ='������� ������ ������������', 
 @AD =  '�. �����, ��. ������� 22', @DR = '27.01.1982', 
@T = '8017-509-74-03', @KO = 2, @KD = 1;
print '��������� ��������'

--������ ���� �������� 
SELECT * FROM [���� ��������];

-- ������� ��� ��������
 SELECT * FROM TR_PAC;
--�������
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI) 
values ('���������� ���� �������������','�',2,'�. ����� ��.������ 13',3,'2016-03-24','2016-04-07');
--��������
DELETE FROM PACIENTY WHERE ADDRESS = '�. ����� ��.������ 13';
--���������
UPDATE PACIENTY SET FIO = '���������� ����� �������������'
WHERE ADDRESS = '�. ����� ��.������ 13';
SELECT * FROM PACIENTY WHERE ADDRESS = '�. ����� ��.������ 13';
 