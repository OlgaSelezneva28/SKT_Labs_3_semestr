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

--1-----------Создание и заполнение таблицы  OTDELENIJA
create table OTDELENIJA
(  KOD_OTDEL integer  identity(1,1) constraint  OTDELENIJA_PK  primary key,
     NAME_OTDEL varchar(50) NOT NULL)
insert into  OTDELENIJA   (NAME_OTDEL)   values ('Отделение аллергологии и профпатологии');
insert into  OTDELENIJA   (NAME_OTDEL)   values ('Гинекологическое отделение');
insert into  OTDELENIJA   (NAME_OTDEL)   values ('Неврологическое отделение');

--DROP table OTDELENIJA;

--2-----------Создание и заполнение таблицы  DOLJNOSTI
create table DOLJNOSTI
(  KOD_DOLJNOSTI integer  identity(1,1)constraint  DOLJNOSTI_PK  primary key, 
     NAME_DOLJNOSTI varchar(50) NOT NULL,
     OKLAD INTEGER   NOT NULL  )
insert into  DOLJNOSTI   (NAME_DOLJNOSTI,OKLAD)   values ('Заведущий отделением',9000000);  
insert into  DOLJNOSTI   (NAME_DOLJNOSTI,OKLAD)   values ('Старшая медсестра',5000000); 
insert into  DOLJNOSTI   (NAME_DOLJNOSTI,OKLAD)   values ('Врач-аллерголог',7000000); 
insert into  DOLJNOSTI   (NAME_DOLJNOSTI,OKLAD)   values ('Врач-невролог',6500000);
insert into  DOLJNOSTI   (NAME_DOLJNOSTI,OKLAD)   values ('Врач акушер-гинеколог',10000000);

--DROP table DOLJNOSTI;

--3-----------Создание и заполнение таблицы  PERSONAL
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
--заведущие и страшие медсестры                     
insert into  PERSONAL  (FIO,ADDRESS,DATA_ROJD,TELEFON,KOD_OTDEL,KOD_DOLJNOSTI) 
values ('Кукишев Сергей Владимирович','г. Минск, ул. Ванеева 22','27.01.1982','8017-509-74-03',2,1);
insert into  PERSONAL  (FIO,ADDRESS,DATA_ROJD,TELEFON,KOD_OTDEL,KOD_DOLJNOSTI) 
values ('Лученок Ирина Александровна','г. Минск, ул. Спортивная 123','07.03.1991','8017-509-75-63',2,2);
insert into  PERSONAL  (FIO,ADDRESS,DATA_ROJD,TELEFON,KOD_OTDEL,KOD_DOLJNOSTI) 
values ('Ткаченко Людмила Васильева','г. Минск, ул. Дружная 34','01.07.1985','8017-509-75-82',1,1);
insert into  PERSONAL  (FIO,ADDRESS,DATA_ROJD,TELEFON,KOD_OTDEL,KOD_DOLJNOSTI) 
values ('Билим Элла Леонидовна','г. Минск, ул. Комсомольская 55','23.04.1989','8017-509-75-70',1,2);
insert into  PERSONAL  (FIO,ADDRESS,DATA_ROJD,TELEFON,KOD_OTDEL,KOD_DOLJNOSTI) 
values ('Филимончик Наталья Александровна','г. Минск, ул. Карнеева 90','16.02.1981','8017-509-74-92',3,1);
insert into  PERSONAL  (FIO,ADDRESS,DATA_ROJD,TELEFON,KOD_OTDEL,KOD_DOLJNOSTI) 
values ('Гулякевич Анна Иосифовна','г. Минск, ул. Сухарева 167','28.12.1979','8017-509-74-92',3,2);
--врачи
insert into  PERSONAL  (FIO,ADDRESS,DATA_ROJD,TELEFON,KOD_OTDEL,KOD_DOLJNOSTI) 
values ('Малахова Илиса Дмитриевна','г. Минск, ул. Токарева 45','15.03.1977','8017-509-73-65',1,3);
insert into  PERSONAL  (FIO,ADDRESS,DATA_ROJD,TELEFON,KOD_OTDEL,KOD_DOLJNOSTI) 
values ('Широчин Алексей Викторович','г. Минск, ул. Кирова 89','10.05.1975','8017-509-73-44',3,4);
insert into  PERSONAL  (FIO,ADDRESS,DATA_ROJD,TELEFON,KOD_OTDEL,KOD_DOLJNOSTI) 
values ('Яковлева Светлана Егоровна','г. Минск, ул. Дружная 13','22.09.1978','8017-509-73-32',2,5);

--DROP table PERSONAL;

--4-----------Создание и заполнение таблицы  DIAGNOZY
create table DIAGNOZY
(  KOD_DIAGNOZA integer  identity(1,1) constraint  DIAGNOZY_PK  primary key,
     NAME_DIAGNOZY varchar(50) NOT NULL,
     KOD_OTDEL      integer  constraint DIAGNOZY_FK foreign key         
                      references OTDELENIJA(KOD_OTDEL))
insert into  DIAGNOZY  (NAME_DIAGNOZY,KOD_OTDEL)   values ('Бронхиальная астма',1);  
insert into  DIAGNOZY  (NAME_DIAGNOZY,KOD_OTDEL)   values ('Отек Квинке',1);
  
insert into  DIAGNOZY  (NAME_DIAGNOZY,KOD_OTDEL)   values ('Опухоли яичников ',2);  
insert into  DIAGNOZY  (NAME_DIAGNOZY,KOD_OTDEL)   values ('Синдром склерокистозных яичников',2);  

insert into  DIAGNOZY  (NAME_DIAGNOZY,KOD_OTDEL)   values ('Артериальной гипертонии',3);
insert into  DIAGNOZY  (NAME_DIAGNOZY,KOD_OTDEL)   values ('Инфаркт миокарда',3); 

--DROP table DIAGNOZY;

--5-----------Создание и заполнение таблицы  PACIENTY
create table PACIENTY
( KOD_PACIENTA   integer  identity(1,1)constraint PACIENTY_PK  primary key,
 FIO    nvarchar(100) NOT NULL,
 GENDER        char(1) CHECK (GENDER in ('м', 'ж')),
KOD_OTDEL      integer  constraint P_OT_FK foreign key         
                      references OTDELENIJA(KOD_OTDEL),
 ADDRESS    nvarchar(100) NOT NULL,
KOD_DIAGNOZA   integer  constraint P_DIA_FK foreign key         
                      references DIAGNOZY(KOD_DIAGNOZA),
 DATA_POSTUP DATE NOT NULL,
 DATA_VYPISKI DATE NOT NULL)                   
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Макаренко Владимир Иванович','м',2,'г. Минск ул. Серова 1',3,'2016-03-21','2016-04-04');--в
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Маковец Наталья Степановна','ж',3,'г. Минск ул. Фед 56',6,'2016-02-28','2016-03-29');--в
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Марьяновский Владимир Андреевич','м',2,'г. Минск ул. Кирова 123',4,'2016-03-22','2016-04-26');--в
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Морозова Лариса Степановна','ж',1,'г. Минск ул. Котава 45',1,'2016-02-09','2016-05-09');--в
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Некрасов Валентин Павлович','м',2,'г. Минск ул. Верхняя 15',3,'2016-03-30','2016-02-13');--в
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Никонов Павел Михайлович','м',3,'г. Минск ул. Казинца 23',5,'2016-03-28','2016-02-25');--в
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Новицкая Татьяна Александровна','ж',1,'г. Минск ул. Ванеева 78',2,'2016-03-15','2016-03-25');--в
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Новиков Андрей Василльевич','м',1,'г. Минск ул. Зеленая 11',2,'2016-03-29','2016-04-08');--в
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Болотников Алексей Игоревич','м',1,'г. Минск ул. Авакяна 1',1,'2015-03-29','2015-06-29');--в
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Вершилин Максим Алексеевич','м',2,'г. Минск ул. Бабушкина 35',4,'2015-12-29','2016-02-08');--10
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Григорьев Иван Владимирович','м',2,'г. Минск ул. Багратиона 2',3,'2015-01-27','2015-02-28');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Есимова камель Муратовна','ж',1,'г. Минск ул. Адама Шемеша 123',2,'2015-11-15','2016-11-30');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Железный Александр Олегович','м',3,'г. Минск ул. Гагарина 33',6,'2015-08-09','2015-08-28');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Журавлев Артем Дмитриевич','м',3,'г. Минск ул. Водоложского 21',5,'2015-05-10','2015-05-17');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Зарецкая Татьяна Игоревна','ж',1,'г. Минск ул. Азгура 22',2,'2015-03-05','2015-03-20');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Иванова Анна Евгеньевна','ж',1,'г. Минск ул. Гало 59',1,'2016-03-29','2016-06-29'); --невыписан
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Искандаров Азамат Булатович','м',3,'г. Минск ул. Брагинская 243',6,'2016-01-29','2016-02-13');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Камиенов Самат Валиханович','м',3,'г. Минск Дальний переулок 13',5,'2016-02-05','2016-02-12');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Карклиньш Роберт Игоревич','м',2,'г. Минск ул. Карла Маркса 90',4,'2016-02-15','2016-03-25');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Комков Степан Алексеевич','м',2,'г. Минск ул. Индустриальная 202',3,'2016-02-20','2016-03-20');--20
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Лафдал Алиса Ахмедова','ж',3,'г. Минск ул. Ленина 12',6,'2016-01-10','2016-01-25');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Лопатников Алексей Александрович','м',3,'г. Минск ул. Малинина 55',5,'2016-01-03','2016-01-10');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Манжина Ольга Андреевна','ж',1,'г. Минск ул. Луговая 1',2,'2016-01-11','2016-01-27');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Семенов Павел Андревич','м',2,'г. Минск ул. Нахимова 67',4,'2016-03-01','2016-05-08');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Соколова Юлия Евгеньевна','ж',2,'г. Минск ул. Малявки 45',3,'2016-03-10','2016-04-11');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Сыртланов Рустам Вилевич','м',2,'г. Минск ул. Кирова 14',4,'2016-03-20','2016-05-01');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Тимошинов Дмитрий Иванович','м',1,'г. Минск ул. Заводская 158',2,'2016-03-12','2016-02-28');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Толкачев Иван Павлович','м',3,'г. Минск ул. Октяборьская 34',6,'2016-04-05','2016-04-21');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Трушина Кристина Андреевна','ж',2,'г. Минск ул. Первомайская 99',3,'2016-04-11','2016-05-11');--29
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Фаттахова Лиана Ильдаровна','ж',3,'г. Минск ул. Рыбалко 4',5,'2016-04-15','2016-04-22');--30
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Николаева Наталья Михайловна','ж',1,'г. Минск ул. Семенова 69',2,'2016-04-21','2016-05-02');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Таранюк Татьяна Юрьевна','ж',3,'г. Минск ул. Тростенецкая 50',6,'2016-04-27','2016-05-13');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Вакульская Ольга Вадимовна','ж',1,'г. Минск ул. Смоленская 269',2,'2016-04-30','2016-05-16');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Лапотько Александра Александровна','ж',3,'г. Минск ул. Фабричная 49',5,'2016-04-30','2016-05-07');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Стригалева Виктория Андреевна','ж',1,'г. Минск ул. Полтавская 23',2,'2016-05-01','2016-05-16');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Дергай Татьяна Александровна','ж',1,'г. Минск ул. Физкультурная 94',1,'2016-05-03','2016-08-04');--невып
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Быкова Ольга Андреевна','ж',2,'г. Минск ул. Веры Слуцкой 1',3,'2016-05-05','2016-06-06');--невы
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Богданович Денис Романович','м',2,'г. Минск ул. Энгельса 70',4,'2016-05-06','2016-06-12');--невып
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Матуйзо Артем Александрович','м',3,'г. Минск ул. Якубова 56',5,'2016-05-08','2016-05-15');--39
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Горбель Анделика Фкдоровна','ж',3,'г. Минск ул. Янки Купалы 66',6,'2016-05-10','2016-05-26');--40
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Жоль Анна Атоновна','ж',3,'г. Минск ул. Брестская 11',6,'2016-05-11','2016-05-28');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Лабуть Юлия Павловна','ж',3,'г. Минск ул. Зубачева 56',5,'2016-05-13','2016-05-20');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Ситкевич Кристина Дмитриевна','ж',2,'г. Минск ул. Ивановская 2',4,'2016-05-15','2016-06-22');--невып
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Драбович Владислав Тадеушевич','м',2,'г. Минск ул. Кабушкина 59',3,'2016-05-18','2016-06-19');--невып
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Ситдикова Яна Евгеньевна','ж',1,'г. Минск ул. Калинина 54',2,'2016-05-20','2016-06-06');--невып
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Рокач Илья Александрович','м',1,'г. Минск ул. Ломоносова 4',1,'2016-05-21','2016-08-22');--невып
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Бобкевич Рита Владимировна','ж',2,'г. Минск ул. Малая 45',4,'2016-05-22','2016-06-30');--невып
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Лукьяненко Полина Владимировна','ж',3,'г. Минск ул. 8 Марта 3',6,'2016-05-23','2016-06-13');--невып
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Ковалевский Александр Дмитриевич','м',1,'г. Минск ул. Нагорная 45',2,'2016-05-23','2016-06-14');--н --49
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Ефимова ОЛьга Михайловна','м',2,'г. Минск ул. Никитина 96',3,'2016-05-24','2016-06-25'); --50 н
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Чичко Наталья Владимировна','ж',3,'г. Минск ул. Аллейная 88',5,'2016-05-25','2016-06-01'); --н
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Шелестова Светлана Вастльевна','ж',1,'г. Минск ул. Бумажково 3',2,'2016-05-25','2016-06-11');  --н
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Шункевич Екатерина Александровна','ж',2,'г. Минск ул. Амурская 56',4,'2016-05-26','2016-07-02');--н
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Якубович Наталья Анатольевна','ж',3,'г. Минск ул. Вавиллова 5',6,'2016-05-26','2016-06-11');--н
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Нелепко Татьяна Николаевна','ж',1,'г. Минск ул. Николаевская 6',1,'2016-05-27','2016-08-28');--н
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Кот Владислав Владимирович','м',2,'г. Минск ул. Ванеева 51',3,'2016-05-27','2016-06-27');--н
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Гуцанович Наталья Сергеевна','ж',2,'г. Минск ул. Аладовых 60',4,'2016-05-28','2016-06-29');--н
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Майоров Александр Иванович','м',3,'г. Минск ул. Добровская 56',5,'2016-05-29','2016-06-05');--н
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Мажейков Анастасия Ивановна','ж',3,'г. Минск ул. Марцинкева 4',6,'2016-05-29','2016-05-14');--н 59
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Олехник Никита Сергеевич','м',2,'г. Минск ул. Горуна 9',4,'2016-05-30','2016-07-08');--н 60
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Сырокваш Виктория Валентиновна','ж',2,'г. Минск ул. Жебрака 34',3,'2016-05-30','2016-06-30');--н
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Штык Виталий Васильевич','м',1,'г. Минск ул. Ковалева 40',2,'2016-05-31','2016-06-15');--н
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Клименко Дмитрий Олегович','м',1,'г. Минск ул. Беруто 8',1,'2016-04-25','2016-07-26');--н
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Мазырко Елена Иосифовна','ж',3,'г. Минск ул. Брикета 67',6,'2016-04-27','2016-05-12');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Шатило Александр Дмитриевич','м',2,'г. Минск ул. Добанка 7',4,'2016-04-15','2016-05-23');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Пешкур Виктор Викторович','м',1,'г. Минск ул. Одинцова 50',2,'2016-04-22','2016-03-30');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Папкович Юлия Сергеевна','ж',2,'г. Минск ул. Пункина 70',6,'2016-04-20','2016-05-28');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Зуев Александр Алексееввич','м',3,'г. Минск ул. Лещинского 54',6,'2016-04-19','2016-05-27');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Литвинчик Артем Николаевич','м',1,'г. Минск ул. Пинская 48',2,'2016-04-15','2016-04-30'); --69
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Шиман Оксана Ивановна','ж',1,'г. Минск ул. Серлина 59',1,'2016-04-13','2016-07-14');--н 70
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Ловцевич Данил Ильич','м',2,'г. Минск ул. Одинцова 6',3,'2016-04-10','2016-05-10');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Истратов Висктор Игоревич','м',3,'г. Минск ул. Панченко 45',5,'2016-04-07','2016-04-16');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Бирисюк Вера Сергеевна','ж',3,'г. Минск ул. Федорова 33',6,'2016-04-05','2016-02-10');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Макаронок Максим Юрьевич','м',2,'г. Минск ул. Ярковская 9',4,'2016-04-03','2016-05-10');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Симончик Андрец Николаевич','м',1,'г. Минск ул. Ольевского 60',2,'2016-04-01','2016-04-16');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Стальмахович Виктор Сергеевич','м',1,'г. Минск ул. Чигладзе 1',1,'2016-03-29','2016-06-30');-- невып
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Тадра Мария Вечяславовна','ж',1,'г. Минск ул. Ширмы 320',2,'2016-03-27','2016-04-14');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Акрушо Едена Евгеньевна','ж',3,'г. Минск ул. Жукова 50',6,'2016-03-25','2016-04-11');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Зайцев Андрей Игоревич','м',3,'г. Минск ул. Королева 20',5,'2016-03-20','2016-03-26'); --79
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Вовалевский Марк Сергеевич','м',3,'г. Минск ул. Матросова 7',3,'2016-03-19','2016-04-20');--80
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Борисюк Вера Сергеевна','ж',3,'г. Минск ул. Мавра 55',4,'2016-03-16','2016-04-25');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Якубовский Валерий Александрович','м',1,'г. Минск ул. Зеленая 11',2,'2016-03-15','2016-03-30');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Герасимук ян Васильевич','м',1,'г. Минск ул. Петра Глебки 6',1,'2016-03-12','2016-06-13');--невып
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Лешко Юлия Сергеевна','ж',2,'г. Минск ул. Лесная 127',4,'2016-03-10','2016-04-11');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Соловей Алеся Васильевна','ж',3,'г. Минск ул. Минская 69',5,'2016-03-07','2016-03-16');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Верич Юрий Владимирович','м',1,'г. Минск ул. Восточная 11',2,'2015-12-29','2016-01-15');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Качановский Александер Юрьевич','м',3,'г. Минск ул. Садовая 45',6,'2015-11-15','2015-11-30');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Пинчук Владимир Иванович','м',3,'г. Минск ул. Мира 230',5,'2015-11-05','2015-11-12');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Селицкая Алеся Алексеевна','ж',2,'г. Минск ул. Тельмана 49',4,'2015-10-20','2015-11-29');--89
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Руцкий Александр Валерьевич','м',2,'г. Минск ул. Чехова 4',3,'2015-10-17','2015-11-18');--90
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Хитрик Виктория Олеговна','ж',1,'г. Минск ул. Суоворова 1',2,'2015-10-14','2015-10-30');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Слуи Егор Валерьевич','м',3,'г. Минск ул. Торговая 290',6,'2015-10-13','2015-10-29');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Титенкова Екатерина Сергеевна','ж',2,'г. Минск ул. Нахимова 49',3,'2015-10-07','2015-11-08');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Ранцевич Владислав Валерьевич','м',3,'г. Минск ул. Чапского 39',6,'2015-10-03','2015-10-19');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Руденко Кирил Анатольевич','м',1,'г. Минск ул. Южная 6',1,'2015-10-01','2016-01-02');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Першина Алеся Викторовна','ж',2,'г. Минск ул. Энергетиков 59',4,'2015-09-29','2015-11-04');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Десюнкевич Наталья Васильевна','ж',1,'г. Минск ул. Особая 150',2,'2015-09-25','2015-10-11');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Сорока Дмиттриц Войтехевич','м',3,'г. Минск ул. Жружная 11',5,'2015-09-20','2015-09-27');
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Лейко Полина Витальевна','ж',3,'г. Минск ул. Спартивная 40',6,'2015-09-15','2015-09-30'); --99
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI)   values ('Полякова Екатерина Борисовна','ж',1,'г. Минск ул. Горовца 78',1,'2016-03-15','2016-06-15');--невып 100

--DROP TABLE PACIENTY;


--6-----------Создание и заполнение таблицы  LEKARSTVA
create table LEKARSTVA
(  KOD_LEKARSTVA integer  identity(1,1)constraint  LEKARSTVA_PK  primary key, 
   NAME_LEKARSTVA varchar(30) NOT NULL,
   KOL_V_DEN VARCHAR(50) NOT NULL,
   RAZ_V_DEN VARCHAR(50) NOT NULL,
   DLITEL_KURSA VARCHAR(50) NOT NULL  )
insert into LEKARSTVA  (NAME_LEKARSTVA,KOL_V_DEN,RAZ_V_DEN, DLITEL_KURSA)   values ('Зиртек','10 мг','1 таблетка или 20 капель в сутки','10 дней'); 
insert into LEKARSTVA  (NAME_LEKARSTVA,KOL_V_DEN,RAZ_V_DEN, DLITEL_KURSA)   values ('Карбоплатин','300-400 мг/м^2','1 раз в день','до выздоравления');
insert into LEKARSTVA  (NAME_LEKARSTVA,KOL_V_DEN,RAZ_V_DEN, DLITEL_KURSA)   values ('Сальбутамол','2-4 мг','3-4 раза/сут','3 месяца');  
insert into LEKARSTVA  (NAME_LEKARSTVA,KOL_V_DEN,RAZ_V_DEN, DLITEL_KURSA)   values ('Таксол','175 мг/м^2','в течение 3 часов каждые 3 недели','до выздоравления');
insert into LEKARSTVA  (NAME_LEKARSTVA,KOL_V_DEN,RAZ_V_DEN, DLITEL_KURSA)   values ('Телфаст','120 мг','1 раз в день','5 недель');  
insert into LEKARSTVA  (NAME_LEKARSTVA,KOL_V_DEN,RAZ_V_DEN, DLITEL_KURSA)   values ('Эриус','20 мг','1 раз в день','2 недели');
 
--DROP TABLE LEKARSTVA;

--7-----------Создание и заполнение таблицы  DIAGNOZ_LEKAR
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

--8-----------Создание и заполнение таблицы  PROCEDURY
create table  PROCEDURY
(  KOD_PROCED integer  identity(1,1)constraint   PROCEDURY_PK  primary key, 
   NAME_PROCEDURY varchar(30) NOT NULL ,
   KOD_SOTRUD integer  constraint  PROCEDURY_FK foreign key         
                      references PERSONAL(KOD_SOTRUD),
   DLITELNOST integer NOT NULL,
   OPLATA INTEGER NOT NULL)
              
insert into  PROCEDURY (NAME_PROCEDURY,KOD_SOTRUD,DLITELNOST,OPLATA)   values ('Галотерапия',1,10,25000); --10 сеансов
insert into  PROCEDURY (NAME_PROCEDURY,KOD_SOTRUD,DLITELNOST,OPLATA)   values ('Гальванизация',5,15,55000);
insert into  PROCEDURY (NAME_PROCEDURY,KOD_SOTRUD,DLITELNOST,OPLATA)   values ('Лечебная физкультура ',6,30,40000);
insert into  PROCEDURY (NAME_PROCEDURY,KOD_SOTRUD,DLITELNOST,OPLATA)   values ('Химиотерапия ',3,6,1000000);
insert into  PROCEDURY (NAME_PROCEDURY,KOD_SOTRUD,DLITELNOST,OPLATA)   values ('Хлоридно-натриевые ванны',2,15,30000);

--DROP TABLE PROCEDURY;

--9-----------Создание и заполнение таблицы  DIAGNOZ_PROC
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

--9-----------Создание и заполнение таблицы  ISTORIYA_BOLNOGO
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

--просмотр всех таблиц
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


 --1 список сотрудников И ДОЛЖНОСТЬ.
CREATE VIEW [СПИСОК_СОТРУДНИКОВ ДОЛЖНОСТЬ] AS SELECT PERSONAL.FIO [FIO], DOLJNOSTI.NAME_DOLJNOSTI [DOLJNOSTI]
FROM PERSONAL INNER JOIN DOLJNOSTI ON PERSONAL.KOD_DOLJNOSTI = DOLJNOSTI.KOD_DOLJNOSTI
GROUP BY PERSONAL.FIO, DOLJNOSTI.NAME_DOLJNOSTI 
SELECT * FROM [СПИСОК_СОТРУДНИКОВ ДОЛЖНОСТЬ];
-- DROP  VIEW [СПИСОК_СОТРУДНИКОВ ДОЛЖНОСТЬ];

--2 СПИСОК ОТДЕЛЕНИЙ
CREATE VIEW [СПИСОК ОТДЕЛЕНИЙ] AS SELECT  OTDELENIJA.NAME_OTDEL [OTDEL]
FROM OTDELENIJA 
SELECT * FROM [СПИСОК ОТДЕЛЕНИЙ];
--DROP [СПИСОК ОТДЕЛЕНИЙ];

-- 3 СПИСОК СОТРУДНИКОВ НА ОТДЕЛЕНИЯХ ????
CREATE VIEW [СПИСОК СОТРУДНИК ОТДЕЛЕНИЙ] AS SELECT  OTDELENIJA.NAME_OTDEL [OTDEL], PERSONAL.FIO [FIO]
FROM PERSONAL INNER JOIN OTDELENIJA ON PERSONAL.KOD_OTDEL = OTDELENIJA.KOD_OTDEL
SELECT * FROM [СПИСОК СОТРУДНИК ОТДЕЛЕНИЙ];
--DROP  VIEW [СПИСОК СОТРУДНИК ОТДЕЛЕНИЙ]  ;
--список сотрудников 
CREATE VIEW [СПИСОК СОТРУДНИКОВ] AS SELECT PERSONAL.FIO [FIO] FROM PERSONAL;
SELECT * FROM [СПИСОК СОТРУДНИКОВ];
DROP VIEW [СПИСОК СОТРУДНИКОВ];
--4 СПИСОК ДОЛЖНОСТЕЙ 
CREATE VIEW [СПИСОК ДОЛЖНОСТЕЙ] AS SELECT DOLJNOSTI.NAME_DOLJNOSTI [DOLJNOSTI] FROM DOLJNOSTI;
SELECT * FROM  [СПИСОК ДОЛЖНОСТЕЙ];
-- DROP VIEW  [СПИСОК ДОЛЖНОСТЕЙ];

--5 СПИСОК ДИАГНОЗОВ 
CREATE VIEW [СПИСОК ДИАГНОЗОВ] AS SELECT  DIAGNOZY.NAME_DIAGNOZY [DIAGNOZ] FROM  DIAGNOZY;
SELECT * FROM [СПИСОК ДИАГНОЗОВ];
-- DROP VIEW [СПИСОК ДИАГНОЗОВ];


--6 СПИСОК ПАЦИЕНТОВ
CREATE VIEW [СПИСОК ПАЦИЕНТОВ] AS SELECT PACIENTY.FIO [FIO] FROM PACIENTY;
SELECT * FROM [СПИСОК ПАЦИЕНТОВ];
--DROP VIEW [СПИСОК ПАЦИЕНТОВ];

 --7 Вывести список сотрудников по определенной должности.
 CREATE VIEW [СОТРУДНИКИ_ОПРЕДЕЛЕННОЙ_ДОЛЖНОСТИ] AS SELECT PERSONAL.FIO [FIO], DOLJNOSTI.NAME_DOLJNOSTI [DOLJNOSTI]
FROM PERSONAL INNER JOIN DOLJNOSTI ON PERSONAL.KOD_DOLJNOSTI = DOLJNOSTI.KOD_DOLJNOSTI
WHERE DOLJNOSTI.NAME_DOLJNOSTI = 'Старшая медсестра'
GROUP BY PERSONAL.FIO, DOLJNOSTI.NAME_DOLJNOSTI 
SELECT * FROM [СОТРУДНИКИ_ОПРЕДЕЛЕННОЙ_ДОЛЖНОСТИ];
-- DROP  VIEW [СОТРУДНИКИ_ОПРЕДЕЛЕННОЙ_ДОЛЖНОСТИ];

--8 Вывести список сотрудников, оклад которых превышает n-ю сумму
CREATE VIEW [ОКЛАД] AS SELECT PERSONAL.FIO [FIO], DOLJNOSTI.NAME_DOLJNOSTI [DOLJNOSTI], DOLJNOSTI.OKLAD [OKLAD]
FROM PERSONAL INNER JOIN DOLJNOSTI ON  PERSONAL.KOD_DOLJNOSTI = DOLJNOSTI.KOD_DOLJNOSTI
where DOLJNOSTI.OKLAD > (8000000)
SELECT * FROM [ОКЛАД];
-- DROP  VIEW [ОКЛАД];

--9 список пациентов по определенному диагнозу
CREATE VIEW [ПАЦИЕНТЫ_С_ДИАГНОЗОМ] AS SELECT PACIENTY.FIO [FIO], DIAGNOZY.NAME_DIAGNOZY [DIAGNOZ]
FROM PACIENTY INNER JOIN DIAGNOZY ON PACIENTY.KOD_DIAGNOZA = DIAGNOZY.KOD_DIAGNOZA 
WHERE  DIAGNOZY.NAME_DIAGNOZY = 'Инфаркт миокарда'
SELECT * FROM [ПАЦИЕНТЫ_С_ДИАГНОЗОМ];
-- DROP  VIEW [ПАЦИЕНТЫ_С_ДИАГНОЗОМ];

--10 СПИСОК ДИАГНОЗОВ И ЛЕКАРСВ ДЛЯ НИХ
CREATE VIEW [ДИАГНОЗЫ_ЛЕКАРСТВА] AS SELECT  DIAGNOZY.NAME_DIAGNOZY [DIAGNOZ] , LEKARSTVA.NAME_LEKARSTVA [LEKARSTVO]
FROM DIAGNOZY INNER JOIN DIAGNOZ_LEKAR ON DIAGNOZY.KOD_DIAGNOZA = DIAGNOZ_LEKAR.KOD_DIAGNOZA
INNER JOIN LEKARSTVA ON DIAGNOZ_LEKAR.KOD_LEKARSTVA = LEKARSTVA.KOD_LEKARSTVA
GROUP BY DIAGNOZY.NAME_DIAGNOZY, LEKARSTVA.NAME_LEKARSTVA;
SELECT * FROM [ДИАГНОЗЫ_ЛЕКАРСТВА];
-- DROP VIEW [ДИАГНОЗЫ_ЛЕКАРСТВА];

--11 СПИСОК ДИАГНОЗОВ И ПРОЦЕЕДУР ДЛЯ НИХ
CREATE VIEW [ДИАГНОЗЫ_ПРОЦЕДУРА] AS SELECT  DIAGNOZY.NAME_DIAGNOZY [DIAGNOZ], PROCEDURY.NAME_PROCEDURY [PROCEDURA],
PROCEDURY.OPLATA [OPLATA]
FROM DIAGNOZY INNER JOIN DIAGNOZ_PROC ON DIAGNOZY.KOD_DIAGNOZA = DIAGNOZ_PROC.KOD_DIAGNOZA
INNER JOIN PROCEDURY ON DIAGNOZ_PROC.KOD_PROCED = PROCEDURY.KOD_PROCED
GROUP BY DIAGNOZY.NAME_DIAGNOZY,  PROCEDURY.NAME_PROCEDURY,PROCEDURY.OPLATA;

SELECT * FROM [ДИАГНОЗЫ_ПРОЦЕДУРА];
--DROP VIEW [ДИАГНОЗЫ_ПРОЦЕДУРА];

 --12 какие даигнозы лечит сотрудник и какие лекарсва ему нужно выдавать
CREATE VIEW [ВРАЧИ] AS SELECT PERSONAL.FIO [FIO],NAME_DOLJNOSTI [DOLJNOSTI], DIAGNOZY.NAME_DIAGNOZY [DIAGNOZ], LEKARSTVA.NAME_LEKARSTVA [LEKARSTVA]
FROM PERSONAL INNER JOIN DOLJNOSTI ON PERSONAL.KOD_DOLJNOSTI=DOLJNOSTI.KOD_DOLJNOSTI
INNER JOIN OTDELENIJA ON PERSONAL.KOD_OTDEL=OTDELENIJA.KOD_OTDEL 
INNER JOIN DIAGNOZY ON OTDELENIJA.KOD_OTDEL=DIAGNOZY.KOD_OTDEL 
INNER JOIN DIAGNOZ_LEKAR ON DIAGNOZY.KOD_DIAGNOZA=DIAGNOZ_LEKAR.KOD_DIAGNOZA
INNER JOIN LEKARSTVA ON DIAGNOZ_LEKAR.KOD_LEKARSTVA = LEKARSTVA.KOD_LEKARSTVA
SELECT * FROM [ВРАЧИ];
--DROP  VIEW [ВРАЧИ];


--13 (Ф) ВЫВОДИТ СОТРУДНИКОВ НА ОПРЕДЕЛЕННОЙ ДОЛЖНОСТИ 
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
CREATE VIEW [СОТРУДНИКИ_ДОЛЖНОСТИ] AS SELECT  DOLJNOSTI.NAME_DOLJNOSTI,  dbo.SOTRUDNI_DOLJN(DOLJNOSTI.NAME_DOLJNOSTI) [VRACH] -- ВСВЕ ВМЕСТЕ 
FROM PERSONAL INNER JOIN DOLJNOSTI ON PERSONAL.KOD_DOLJNOSTI = DOLJNOSTI.KOD_DOLJNOSTI
GROUP BY DOLJNOSTI.NAME_DOLJNOSTI;

--DROP VIEW [СОТРУДНИКИ_ДОЛЖНОСТИ];
SELECT * FROM [СОТРУДНИКИ_ДОЛЖНОСТИ];
declare @ZV VARCHAR(300)=dbo.SOTRUDNI_DOLJN('Заведущий отделением');--ПО ОТДЕЛЬНОСТИ 
   print 'Заведущие отделениями: ' +  @ZV ;
declare @M VARCHAR(300)=dbo.SOTRUDNI_DOLJN('Старшая медсестра');
   print 'Старшие медсестры: '+ @M ;
declare @AL VARCHAR(300)=dbo.SOTRUDNI_DOLJN('Врач-аллерголог');
   print 'Врач-аллерголог: '+ @AL ;
declare @NV VARCHAR(300)=dbo.SOTRUDNI_DOLJN('Врач-невролог');
   print 'Врач-невролог: '+ @NV ;
declare @AG VARCHAR(300)=dbo.SOTRUDNI_DOLJN('Врач акушер-гинеколог');
   print 'Врач акушер-гинеколог: ' +@AG ;


-- 14(Ф) ПАЦИЕНТЫ С ОПРЕДЕЛЕННЫМ ДИАГНОЗОМ
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
CREATE VIEW [ПАЦИЕНТЫ_ДИАГНОЗ] AS SELECT  DIAGNOZY.NAME_DIAGNOZY,  dbo.PACIENT_DIAG(DIAGNOZY.NAME_DIAGNOZY) [ПАЦИЕНТЫ]
FROM PACIENTY INNER JOIN DIAGNOZY ON PACIENTY.KOD_DIAGNOZA = DIAGNOZY.KOD_DIAGNOZA 
GROUP BY DIAGNOZY.NAME_DIAGNOZY;

--DROP VIEW [ПАЦИЕНТЫ_ДИАГНОЗ];
SELECT * FROM [ПАЦИЕНТЫ_ДИАГНОЗ];
declare @BA VARCHAR(400)=dbo.PACIENT_DIAG('Бронхиальная астма');
   print 'Бронхиальная астма: ' +  @BA ;
declare @OK VARCHAR(400)=dbo.PACIENT_DIAG('Отек Квинке');
   print 'Отек Квинке: '+ @OK ;
declare @OJ VARCHAR(400)=dbo.PACIENT_DIAG('Опухоли яичников');
   print 'Опухоли яичников: '+ @OJ ;



--15 (Ф) ВСЕ СОТРУДНИКИ В ОТДЕЛЕНИИ 
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
CREATE VIEW [СОТРУДНИКИ_ОТДЕЛ] AS SELECT  OTDELENIJA.NAME_OTDEL,  dbo.SOTRUDN_OTDEL(OTDELENIJA.KOD_OTDEL) [VRACH]
FROM PERSONAL INNER JOIN OTDELENIJA ON PERSONAL.KOD_OTDEL = OTDELENIJA.KOD_OTDEL 
GROUP BY OTDELENIJA.NAME_OTDEL, OTDELENIJA.KOD_OTDEL;
--DROP VIEW [СОТРУДНИКИ_ОТДЕЛ];
SELECT * FROM [СОТРУДНИКИ_ОТДЕЛ] 

declare @OD VARCHAR(400)=dbo.SOTRUDN_OTDEL('1');
   print 'Отделение аллергологии и профпатологии: ' +  @OD ;
declare @DV VARCHAR(400)=dbo.SOTRUDN_OTDEL('2');
   print 'Гинекологическое отделение: '+ @DV ;
declare @TR VARCHAR(400)=dbo.SOTRUDN_OTDEL('3');
   print 'Неврологическое отделение: '+ @TR ;

--16 (Ф)  ВСЕХ СОТРУДНИКОВ 
CREATE FUNCTION COUNT_SOTRUDNIKOV() RETURNS INT
AS BEGIN DECLARE @RC INT = 0;
SET @RC = (SELECT COUNT(*) FROM PERSONAL);
RETURN  @RC;
END;
-- DROP FUNCTION COUNT_SOTRUDNIKOV;
declare @KS VARCHAR(400)=dbo.COUNT_SOTRUDNIKOV();
   print 'КОЛИЧЕСТВО СОТРУДНИКОВ: '+ @KS;
 CREATE VIEW [количество сотрудников] AS SELECT TOP(1) dbo.COUNT_SOTRUDNIKOV()[KOL]  FROM PERSONAL;
 --DROP VIEW [количество сотрудников];
 SELECT * FROM [количество сотрудников];

--17 (Ф) ПОДСЧЕТА СОТРУДНИКОВ В ОТДЕЛЕНИИ 
CREATE FUNCTION COUNT_SOTR_OT(@OT VARCHAR(20)) RETURNS INT
AS BEGIN DECLARE @RC INT = 0;
SET @RC = (SELECT COUNT(*) FROM PERSONAL INNER JOIN OTDELENIJA 
ON PERSONAL.KOD_OTDEL = OTDELENIJA.KOD_OTDEL
WHERE  OTDELENIJA.KOD_OTDEL = @OT);
RETURN  @RC;
END;
-- DROP FUNCTION COUNT_SOTR_OT;

CREATE VIEW [СОТРУДНИКИ В ОТДЕЛЕНИИ] AS SELECT  OTDELENIJA.NAME_OTDEL,  dbo.COUNT_SOTR_OT(OTDELENIJA.KOD_OTDEL) [KOL]
FROM PERSONAL INNER JOIN OTDELENIJA ON PERSONAL.KOD_OTDEL = OTDELENIJA.KOD_OTDEL 
GROUP BY OTDELENIJA.NAME_OTDEL, OTDELENIJA.KOD_OTDEL;

--DROP VIEW [СОТРУДНИКИ В ОТДЕЛЕНИИ] ;
SELECT * FROM [СОТРУДНИКИ В ОТДЕЛЕНИИ] ; 
declare @KSO VARCHAR(400)=dbo.COUNT_SOTR_OT('1');
   print 'КОЛИЧЕСТВО СОТРУДНИКОВ  В 1 ОТДЕЛЕНИИ: '+ @KSO;
declare @KSO VARCHAR(400)=dbo.COUNT_SOTR_OT('2');
   print 'КОЛИЧЕСТВО СОТРУДНИКОВ ВО 2 ОТДЕЛЕНИИ: '+ @KSO;
declare @KSO VARCHAR(400)=dbo.COUNT_SOTR_OT('3');
   print 'КОЛИЧЕСТВО СОТРУДНИКОВ В 3 ОТДЕЛЕНИИ: '+ @KSO;

--18 (Ф) КОЛИЧЕСТВО ПАЦИЕНТОВ 
CREATE FUNCTION COUNT_PACIENT() RETURNS INT
AS BEGIN DECLARE @RC INT = 0;
SET @RC = (SELECT COUNT(*) FROM PACIENTY);
RETURN  @RC;
END;
-- DROP FUNCTION COUNT_PACIENT;
declare @KP VARCHAR(400)=dbo.COUNT_PACIENT(); 
   print 'КОЛИЧЕСТВО ПАЦИЕНТОВ: '+ @KP;

CREATE VIEW [КОЛИЧЕСТВО ПАЦИЕНТОВ] AS SELECT top(1) dbo.COUNT_PACIENT() [KOL] FROM PACIENTY;
--DROP VIEW [КОЛИЧЕСТВО ПАЦИЕНТОВ];
SELECT * FROM [КОЛИЧЕСТВО ПАЦИЕНТОВ];

--19 (Ф) КОЛИЧЕСТВО ПАЦИЕНТОВ КОТОРЫЕ ЛЕЖАТ В ОТДЕЛЕНИИ
CREATE FUNCTION COUNT_PAC_OT(@POT VARCHAR(20)) RETURNS INT
AS BEGIN DECLARE @RC INT = 0;
SET @RC = (SELECT COUNT(*) FROM PACIENTY INNER JOIN OTDELENIJA 
ON PACIENTY.KOD_OTDEL = OTDELENIJA.KOD_OTDEL
WHERE  OTDELENIJA.KOD_OTDEL = @POT);
RETURN  @RC;
END;
--DROP FUNCTION COUNT_PAC_OT;

CREATE VIEW [КОЛ_ПАЦ_ЛПАЦ] AS SELECT  OTDELENIJA.NAME_OTDEL,  dbo.COUNT_PAC_OT(OTDELENIJA.KOD_OTDEL) [KOL]
FROM PERSONAL INNER JOIN OTDELENIJA ON PERSONAL.KOD_OTDEL = OTDELENIJA.KOD_OTDEL 
GROUP BY OTDELENIJA.NAME_OTDEL, OTDELENIJA.KOD_OTDEL;

--DROP VIEW [КОЛ_ПАЦ_ЛПАЦ];
SELECT * FROM [КОЛ_ПАЦ_ЛПАЦ]
declare @KPO VARCHAR(400)=dbo.COUNT_PAC_OT('1');
   print 'КОЛИЧЕСТВО ПАЦИЕНТОВ  В 1 ОТДЕЛЕНИИ: '+ @KPO;
declare @KPO VARCHAR(400)=dbo.COUNT_PAC_OT('2');
   print 'КОЛИЧЕСТВО СОТРУДНИКОВ ВО 2 ОТДЕЛЕНИИ: '+ @KPO;
declare @KPO VARCHAR(400)=dbo.COUNT_PAC_OT('3');
   print 'КОЛИЧЕСТВО СОТРУДНИКОВ В 3 ОТДЕЛЕНИИ: '+ @KPO;

--20 (Ф) КОЛИЧЕСТВО ПАЦИЕНТОВ С ОПРЕДЕЛЕННЫМ ДИАГНОЗОМ 
CREATE FUNCTION COUNT_PAC_D(@PD VARCHAR(20)) RETURNS INT
AS BEGIN DECLARE @RC INT = 0;
SET @RC = (SELECT COUNT(*) FROM PACIENTY INNER JOIN DIAGNOZY
ON PACIENTY.KOD_DIAGNOZA = DIAGNOZY.KOD_DIAGNOZA
WHERE  DIAGNOZY.NAME_DIAGNOZY =@PD);
RETURN  @RC;
END;
--DROP FUNCTION COUNT_PAC_D;
CREATE VIEW [КОЛ_ПАЦ_ДИАГ] AS SELECT  DIAGNOZY.NAME_DIAGNOZY ,  dbo.COUNT_PAC_D(DIAGNOZY.NAME_DIAGNOZY) [KOL]
FROM PACIENTY INNER JOIN DIAGNOZY
ON PACIENTY.KOD_DIAGNOZA = DIAGNOZY.KOD_DIAGNOZA
GROUP BY DIAGNOZY.NAME_DIAGNOZY;
--DROP VIEW [КОЛ_ПАЦ_ДИАГ];
SELECT * FROM  [КОЛ_ПАЦ_ДИАГ]
declare @KPD VARCHAR(400)=dbo.COUNT_PAC_D('Бронхиальная астма');
   print 'КОЛИЧЕСТВО ПАЦИЕНТОВ  БОЛЬНЫХ Бронхиальной астмой: '+ @KPD;
declare @KPD VARCHAR(400)=dbo.COUNT_PAC_D('Отек Квинке');
   print 'КОЛИЧЕСТВО ПАЦИЕНТОВ  БОЛЬНЫХ Отеком Квинке: '+ @KPD;
declare @KPD VARCHAR(400)=dbo.COUNT_PAC_D('Опухоли яичников ');
   print 'КОЛИЧЕСТВО ПАЦИЕНТОВ  БОЛЬНЫХ Опухолью яичников:  '+ @KPD;
declare @KPD VARCHAR(400)=dbo.COUNT_PAC_D('Инфаркт миокарда');
   print 'КОЛИЧЕСТВО ПАЦИЕНТОВ  БОЛЬНЫХ Инфарктом миокарда: '+ @KPD;

 
 --21 (ф) сколько у врача пациетов 
CREATE FUNCTION COL_VR_PAC (@o VARCHAR(50)) RETURNS INT
AS BEGIN 
DECLARE @rc INT=(SELECT  COUNT(*) FROM ISTORIYA_BOLNOGO 
WHERE ISTORIYA_BOLNOGO.KOD_SOTRUD=ISNULL(@o,ISTORIYA_BOLNOGO.KOD_SOTRUD));
RETURN @rc; END;
--DROP FUNCTION COL_VR_PAC

CREATE VIEW [КОЛ_ПАЦ_ВР] AS SELECT PERSONAL.FIO ,  dbo.COL_VR_PAC(ISTORIYA_BOLNOGO.KOD_SOTRUD) [KOL]
FROM ISTORIYA_BOLNOGO INNER JOIN PERSONAL ON ISTORIYA_BOLNOGO.KOD_SOTRUD = PERSONAL.KOD_SOTRUD GROUP BY  PERSONAL.FIO,ISTORIYA_BOLNOGO.KOD_SOTRUD

--DROP VIEW [КОЛ_ПАЦ_ВР];
SELECT *FROM [КОЛ_ПАЦ_ВР]

--22 ПОИСК ЛЕКАРСВА ДЛЯ ДИАГНОЗА 
CREATE VIEW [ПОИСК_ЛЕКАРСТВО] AS SELECT DIAGNOZY.NAME_DIAGNOZY, LEKARSTVA.NAME_LEKARSTVA
FROM DIAGNOZY INNER JOIN DIAGNOZ_LEKAR 
ON DIAGNOZY.KOD_DIAGNOZA = DIAGNOZ_LEKAR.KOD_DIAGNOZA
INNER JOIN LEKARSTVA ON DIAGNOZ_LEKAR.KOD_LEKARSTVA = LEKARSTVA.KOD_LEKARSTVA
WHERE DIAGNOZY.NAME_DIAGNOZY = 'Инфаркт миокарда';
--DROP VIEW [ПОИСК_ЛЕКАРСТВО];
SELECT * FROM [ПОИСК_ЛЕКАРСТВО];

--23 ПОИСК ПРОЦЕДУРЫ ДЛЯ ДИАГНОЗА
CREATE VIEW [ПОИСК_ПРОЦЕДУРЫ] AS SELECT DIAGNOZY.NAME_DIAGNOZY [Диагноз], PROCEDURY.NAME_PROCEDURY [Процедура]
FROM DIAGNOZY INNER JOIN  DIAGNOZ_PROC ON DIAGNOZY.KOD_DIAGNOZA = DIAGNOZ_PROC.KOD_DIAGNOZA
INNER JOIN PROCEDURY ON DIAGNOZ_PROC.KOD_PROCED = PROCEDURY.KOD_PROCED
WHERE DIAGNOZY.NAME_DIAGNOZY = 'Инфаркт миокарда';

--DROP VIEW [ПОИСК_ПРОЦЕДУРЫ];
SELECT * FROM [ПОИСК_ПРОЦЕДУРЫ];

--24 (Ф) СКОЛЬКО ПАЦИЕНТУ ОСТАЛОСЬ ПРОЦЕДУР  
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
CREATE VIEW [КОЛ_ПАЦ_ПРОЦЕДУР] AS SELECT PACIENTY.FIO,  dbo.COL_VR_PRO_PAC(ISTORIYA_BOLNOGO.KOD_PACIENTA) [KOL]
FROM ISTORIYA_BOLNOGO INNER JOIN PACIENTY ON ISTORIYA_BOLNOGO.KOD_PACIENTA = PACIENTY.KOD_PACIENTA
WHERE dbo.COL_VR_PRO_PAC(ISTORIYA_BOLNOGO.KOD_PACIENTA) > 0
--DROP VIEW [КОЛ_ПАЦ_ПРОЦЕДУР];
 SELECT * FROM [КОЛ_ПАЦ_ПРОЦЕДУР]; 

 -- 33 СКОЛЬКО ПАЦИЕНТ ПРОДЕЛАЛ ПРОЦЕДУР И СКОЛЬКО ОСТАЛОСЬ 
 CREATE VIEW [КОЛ_ПРОДЕЛ_ОСТАВШ_ПРОЦ] AS SELECT PACIENTY.FIO, ISTORIYA_BOLNOGO.KOL_PRODEL_PROC, dbo.COL_VR_PRO_PAC(ISTORIYA_BOLNOGO.KOD_PACIENTA) [KOL_OSTAV_PROC]
 FROM ISTORIYA_BOLNOGO INNER JOIN PACIENTY ON ISTORIYA_BOLNOGO.KOD_PACIENTA = PACIENTY.KOD_PACIENTA
 
 --DROP VIEW [КОЛ_ПРОДЕЛ_ОСТАВШ_ПРОЦ];
 SELECT * FROM [КОЛ_ПРОДЕЛ_ОСТАВШ_ПРОЦ];


 --25 СПИСОК ПАЦИЕНТОВ КОТОРЫЕ ВЫПИСАНЫ 
  CREATE VIEW [ВЫПИСАНЫ] AS
 SELECT PACIENTY.FIO, PACIENTY.DATA_VYPISKI FROM PACIENTY
 WHERE PACIENTY.DATA_VYPISKI < GETDATE();
 --DROP VIEW [ВЫПИСАНЫ];
  SELECT * FROM [ВЫПИСАНЫ];

  --26 СПИСОК ПАЦИЕНТОВ КОТОРЫЕ ЕЩЕ НЕ ВЫПИСАНЫ
  CREATE VIEW [НЕ ВЫПИСАНЫ] AS
 SELECT PACIENTY.FIO, PACIENTY.DATA_VYPISKI FROM PACIENTY
 WHERE PACIENTY.DATA_VYPISKI > GETDATE();
 --DROP VIEW [НЕ ВЫПИСАНЫ];
  SELECT * FROM [НЕ ВЫПИСАНЫ];

  -- 27 ПАЦИЕНТЫ КОТОРЫЕ БЫЛИ В БОЛЬНИЦЕ В ОПРЕДЕЛЕННЫЕ ГОД
  CREATE FUNCTION PAC_G(@o VARCHAR(50)) RETURNS TABLE
AS RETURN
SELECT PACIENTY.FIO FROM PACIENTY WHERE @O =YEAR(DATA_POSTUP)
--DROP FUNCTION PAC_G
SELECT * FROM dbo.PAC_G('2015');
-- 28 МЕСЯЦ
  CREATE FUNCTION PAC_M(@o VARCHAR(50)) RETURNS TABLE
AS RETURN
SELECT PACIENTY.FIO FROM PACIENTY WHERE @O =MONTH(DATA_POSTUP);
--DROP FUNCTION PAC_M
SELECT * FROM dbo.PAC_M('2'); 

-- 29 МЕСЯЦ И ГОД
CREATE FUNCTION PAC_MG(@o VARCHAR(50),@M VARCHAR(50)) RETURNS TABLE
AS RETURN
SELECT PACIENTY.FIO FROM PACIENTY WHERE @O =MONTH(DATA_POSTUP) AND @M = YEAR(DATA_POSTUP)
--DROP FUNCTION PAC_MG
SELECT * FROM dbo.PAC_MG('2','2016') 

-- 30 ДОБАВЛЕНИЕ ПАЦИЕНТА
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
print 'номер ошибки : ' + cast(error_number() as varchar(6)); 
print 'сообщение : ' + error_message(); 
print 'уровень : ' + cast(error_severity() as varchar(6)); 
print 'метка : ' + cast(error_state() as varchar(8)); 
print 'номер строки : ' + cast(error_line() as varchar(8)); 
if error_procedure() is not null 
print 'имя процедуры : ' + error_procedure(); 
return -1; 
end catch; 
go
declare @rc int; 
exec @rc=NEW_PACIENT @n ='Смулькевич Иван Иванович', @g = 'м',
@KT = 2, @AD =  'г. Минск ул. Сиза 2', @KD = 3, 
@DP = '2016-04-22', @DV = '2016-05-05';
print 'Клиент добавлен' ;
select * from PACIENTY

-- 31 ЗАМЕНА СОТРУДНИКА 
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
EXECUTE UPDATE_SOTRUDNIKA @NN = 'Кукишев Сергей Владимирович', 
@N = 'Коледа Александр Юрьевич',
@AD = 'г. Минск, ул. Пушкинская 129 ',
@DR = '26.11.1992',
@COUNTS = @CS OUTPUT ;
PRINT N'УДАЛЕНО СОТРУДНИКОВ: ' + CONVERT(NVARCHAR(30), @CS);
select * from PERSONAL;


--32 добавление сотрудника 
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
print 'номер ошибки : ' + cast(error_number() as varchar(6)); 
print 'сообщение : ' + error_message(); 
print 'уровень : ' + cast(error_severity() as varchar(6)); 
print 'метка : ' + cast(error_state() as varchar(8)); 
print 'номер строки : ' + cast(error_line() as varchar(8)); 
if error_procedure() is not null 
print 'имя процедуры : ' + error_procedure(); 
return -1; 
end catch; 

declare @rc int; 
exec @rc=NEW_SOTRUDNIKA @n ='Кукишев Сергей Владимирович', 
 @AD =  'г. Минск, ул. Ванеева 22', @DR = '27.01.1982', 
@T = '8017-509-74-03', @KO = 2, @KD = 1;
print 'Сотрудник ДОБАВЛЕН'
select * from PERSONAL;

-- 34 (Ф) ЧЕРЕЗ СКОЛЬКО ПАЦИЕНТА ВЫПИШУТ
CREATE FUNCTION COL_PC_VP(@IS VARCHAR(30)) RETURNS INT
AS BEGIN 
DECLARE @P VARCHAR(300) = (SELECT PACIENTY.DATA_VYPISKI FROM PACIENTY WHERE PACIENTY.DATA_VYPISKI > GETDATE() AND PACIENTY.FIO =  @IS );
RETURN DATEDIFF(DAY,GETDATE(),@P);  END;
--DROP FUNCTION COL_PC_VP

CREATE VIEW [КОЛИЧЕСТВВО_ДНЕЙ_ДО_ВЫПИСКИ] AS SELECT PACIENTY.FIO , dbo.COL_PC_VP('Богданович Денис Романович') [KOL_DNEY_DO_VIPISKI] 
FROM PACIENTY WHERE PACIENTY.FIO = 'Богданович Денис Романович'

--DROP VIEW [КОЛИЧЕСТВВО_ДНЕЙ_ДО_ВЫПИСКИ];
SELECT * FROM [КОЛИЧЕСТВВО_ДНЕЙ_ДО_ВЫПИСКИ];

-- 35 ПОЛНЫЙ ПУТЬ ПАЦИЕНТА 
CREATE VIEW [ПУТЬ ПАЦИЕНТА] AS
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

--DROP VIEW [ПУТЬ ПАЦИЕНТА];
SELECT * FROM [ПУТЬ ПАЦИЕНТА];

 -- 36 ДИАГНОЗЫ НА ОТДЕЛЕНИИ
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
CREATE VIEW [ДИАГНОЗ_ОТДЕЛ] AS SELECT  OTDELENIJA.NAME_OTDEL,  dbo.DIAGNOZ_OTDEL(OTDELENIJA.KOD_OTDEL) [DIAGNOZ]
FROM DIAGNOZY INNER JOIN OTDELENIJA ON DIAGNOZY.KOD_OTDEL = OTDELENIJA.KOD_OTDEL
GROUP BY OTDELENIJA.NAME_OTDEL, OTDELENIJA.KOD_OTDEL;

--DROP VIEW [ДИАГНОЗ_ОТДЕЛ];
SELECT * FROM [ДИАГНОЗ_ОТДЕЛ];

--37 (Ф) ЛЕКАРСТВА ДЛЯ ОТДЕЛЕНИЯ
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

CREATE VIEW [ЛЕКАРСТВА_ОТДЕЛ] AS SELECT  OTDELENIJA.NAME_OTDEL,  dbo.LECAR_OTDEL(OTDELENIJA.KOD_OTDEL) [LEKARSTVO]
FROM DIAGNOZY INNER JOIN OTDELENIJA ON DIAGNOZY.KOD_OTDEL = OTDELENIJA.KOD_OTDEL
GROUP BY OTDELENIJA.NAME_OTDEL, OTDELENIJA.KOD_OTDEL;

--DROP VIEW [ЛЕКАРСТВА_ОТДЕЛ];
SELECT * FROM [ЛЕКАРСТВА_ОТДЕЛ];

-- 37 ИНФА О БОЛЬНИЦЕ 
CREATE VIEW [INFA] AS SELECT OTDELENIJA.NAME_OTDEL,  dbo.SOTRUDN_OTDEL(OTDELENIJA.KOD_OTDEL) [VRACH],dbo.COUNT_SOTR_OT(OTDELENIJA.KOD_OTDEL) [KOL],
 dbo.COUNT_PAC_OT(OTDELENIJA.KOD_OTDEL) [KOL_PAC], dbo.DIAGNOZ_OTDEL(OTDELENIJA.KOD_OTDEL) [DIAGNOZ],
  dbo.LECAR_OTDEL(OTDELENIJA.KOD_OTDEL) [LEKARSTVO] FROM OTDELENIJA

-- DROP VIEW [INFA];
SELECT * FROM [INFA];

--ТАБЛИЦА ДЛЯ ТРИГГЕРА 
CREATE TABLE TR_PAC
(IG INT IDENTITY,
ST VARCHAR(20) CHECK(ST IN ('INS','DEL','UPD')),
TRN VARCHAR(50),
C VARCHAR(300))
-- DROP TABLE TR_PAC;

-- ТРИГЕР ДЛЯ СОБЫТИЙ INSERT, DELETE, UPDATE
CREATE TRIGGER TRIG_PAC ON PACIENTY AFTER INSERT, DELETE, UPDATE
AS DECLARE  @A1 NVARCHAR(100),@A2 CHAR(1), @A3 INT, @A4 NVARCHAR(100), 
@A5 INT, @A6 DATE, @A7 DATE, @IN VARCHAR(300);
DECLARE @INS INT=(SELECT COUNT(*) FROM inserted),
@DEL INT = (SELECT COUNT(*) FROM deleted);
IF @INS > 0 AND @DEL = 0 BEGIN PRINT 'СОБЫТИЕ INSERT';
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
IF @INS = 0 AND @DEL > 0 BEGIN PRINT 'СОБЫТИЕ: DELETE';
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
IF @INS > 0 AND @DEL > 0 BEGIN PRINT 'СОБЫТИЕ: UPDATE';
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
--ВСТАВКА
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI) 
values ('Стасюкевич Стас Александрович','м',2,'г. Минск ул.Карины 13',3,'2016-03-24','2016-04-07');
--УДАЛЕНИЕ
DELETE FROM PACIENTY WHERE ADDRESS = 'г. Минск ул.Карины 13';
--ИЗМЕНЕНИЕ
UPDATE PACIENTY SET FIO = 'Стасюкевич Игорь Александрович'
WHERE ADDRESS = 'г. Минск ул.Карины 13';
SELECT * FROM PACIENTY WHERE ADDRESS = 'г. Минск ул.Карины 13';


CREATE VIEW [ВРАЧИ2] AS SELECT PERSONAL.FIO [FIO],NAME_DOLJNOSTI [DOLJNOSTI], 
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
DROP VIEW [ВРАЧИ2];
select * from [ВРАЧИ2]
select * from [КОЛ_ПАЦ_ВР];
CREATE VIEW [КОЛ_ПАЦ_ВР] AS SELECT PERSONAL.FIO ,  dbo.COL_VR_PAC(ISTORIYA_BOLNOGO.KOD_SOTRUD) [KOL]
FROM ISTORIYA_BOLNOGO INNER JOIN PERSONAL ON ISTORIYA_BOLNOGO.KOD_SOTRUD = PERSONAL.KOD_SOTRUD GROUP BY  PERSONAL.FIO,ISTORIYA_BOLNOGO.KOD_SOTRUD

--просмотр всех таблиц
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

 --Вывести общий список сотрудников
 SELECT * FROM [СПИСОК СОТРУДНИКОВ];
 
 -- СПИСОК ОТДЕЛЕНИЙ 
 SELECT * FROM [СПИСОК ОТДЕЛЕНИЙ];
 
 --СПИСОК ДОЛЖНОСТЕЙ 
 SELECT * FROM  [СПИСОК ДОЛЖНОСТЕЙ];
 
 --СПИСОК ДИАГНОЗОВ 
 SELECT * FROM [СПИСОК ДИАГНОЗОВ];
 
 --СПИСОК ПАЦИЕНТОВ
 SELECT * FROM [СПИСОК ПАЦИЕНТОВ];
 
  --список сотрудников И ДОЛЖНОСТЬ
  SELECT * FROM [СПИСОК_СОТРУДНИКОВ ДОЛЖНОСТЬ];
  
 --список сотрудников по определенной должности
 SELECT * FROM [СОТРУДНИКИ_ОПРЕДЕЛЕННОЙ_ДОЛЖНОСТИ];
 
 --список сотрудников, оклад которых превышает n-ю сумму
 SELECT * FROM [ОКЛАД];
 
 --список пациентов по определенному диагнозу
 SELECT * FROM [ПАЦИЕНТЫ_С_ДИАГНОЗОМ];
 
 --СПИСОК ДИАГНОЗОВ И ЛЕКАРСВ ДЛЯ НИХ
 SELECT * FROM [ДИАГНОЗЫ_ЛЕКАРСТВА];
 
 --СПИСОК ДИАГНОЗОВ И ПРОЦЕЕДУР ДЛЯ НИХ
 SELECT * FROM [ДИАГНОЗЫ_ПРОЦЕДУРА];
 
--какие даигнозы лечит сотрудник и какие лекарсва ему нужно выдавать
 SELECT * FROM [ВРАЧИ];
 
-- (Ф) ВЫВОДИТ СОТРУДНИКОВ НА ОПРЕДЕЛЕННОЙ ДОЛЖНОСТИ 
 SELECT * FROM [СОТРУДНИКИ_ДОЛЖНОСТИ];
 
 --(Ф) ПАЦИЕНТЫ С ОПРЕДЕЛЕННЫМ ДИАГНОЗОМ
 SELECT * FROM [ПАЦИЕНТЫ_ДИАГНОЗ];
 
--(Ф) ВСЕ СОТРУДНИКИ В ОТДЕЛЕНИИ
 SELECT * FROM [СОТРУДНИКИ_ОТДЕЛ];
 
--(Ф) КОЛИЧЕСТВО ВСЕХ СОТРУДНИКОВ 
SELECT * FROM [количество сотрудников];

--(Ф) ПОДСЧЕТ СОТРУДНИКОВ В ОТДЕЛЕНИИ
SELECT * FROM [СОТРУДНИКИ В ОТДЕЛЕНИИ];

--(Ф) КОЛИЧЕСТВО ПАЦИЕНТОВ 
SELECT * FROM [КОЛИЧЕСТВО ПАЦИЕНТОВ];

--(Ф) КОЛИЧЕСТВО ПАЦИЕНТОВ КОТОРЫЕ ЛЕЖАТ В ОТДЕЛЕНИИ
SELECT * FROM [КОЛ_ПАЦ_ЛПАЦ];

--(Ф) КОЛИЧЕСТВО ПАЦИЕНТОВ С ОПРЕДЕЛЕННЫМ ДИАГНОЗОМ 
SELECT * FROM  [КОЛ_ПАЦ_ДИАГ];

 --(ф) сколько у врача пациетов 
 SELECT *FROM [КОЛ_ПАЦ_ВР];
 
 --ПОИСК ЛЕКАРСВА ДЛЯ ДИАГНОЗА 
 SELECT * FROM [ПОИСК_ЛЕКАРСТВО];
 
 --ПОИСК ПРОЦЕДУРЫ ДЛЯ ДИАГНОЗА
 SELECT * FROM [ПОИСК_ПРОЦЕДУРЫ];
 
--(Ф) СКОЛЬКО ПАЦИЕНТУ ОСТАЛОСЬ ПРОЦЕДУР 
 SELECT * FROM [КОЛ_ПАЦ_ПРОЦЕДУР];
 
--СКОЛЬКО ПАЦИЕНТ ПРОДЕЛАЛ ПРОЦЕДУР И СКОЛЬКО ОСТАЛОСЬ 
 SELECT * FROM [КОЛ_ПРОДЕЛ_ОСТАВШ_ПРОЦ];
 
--СПИСОК ПАЦИЕНТОВ КОТОРЫЕ ВЫПИСАНЫ
SELECT * FROM [ВЫПИСАНЫ];
 
--СПИСОК ПАЦИЕНТОВ КОТОРЫЕ ЕЩЕ НЕ ВЫПИСАНЫ
SELECT * FROM [НЕ ВЫПИСАНЫ];
 
--(Ф) ПОИСК ПАЦИЕНТОВ, КОТОРЫЕ БЫЛИ В БОЛЬНИЦЕ ЗА ОПРЕДЕЛЕННЫЙ ГОД
SELECT * FROM dbo.PAC_G('2015');
 
--(Ф) ПОИСК ПАЦИЕНТОВ, КОТОРЫЕ БЫЛИ В БОЛЬНИЦЕ ЗА ОПРЕДЕЛЕННЫЙ МЕСЯЦ
SELECT * FROM dbo.PAC_M('2') 
 
--(Ф) ПОИСК ПАЦИЕНТОВ, КОТОРЫЕ БЫЛИ В БОЛЬНИЦЕ ЗА ОПРЕДЕЛЕННЫЙ ГОД И МКСЯЦ
SELECT * FROM dbo.PAC_MG('2','2016') 

--(Ф) ЧЕРЕЗ СКОЛЬКО ПАЦИЕНТА ВЫПИШУТ
SELECT * FROM [КОЛИЧЕСТВВО_ДНЕЙ_ДО_ВЫПИСКИ];

--(ф) ДИАГНОЗЫ НА ОТДЕЛЕНИИ 
SELECT * FROM [ДИАГНОЗ_ОТДЕЛ];

--(Ф) ЛЕКАРСТВА ДЛЯ ОТДЕЛЕНИЯ
SELECT * FROM [ЛЕКАРСТВА_ОТДЕЛ];

 -- 37 ИНФА О БОЛЬНИЦЕ 
 SELECT * FROM [INFA];

  -- ДОБАВЛЕНИЕ ПАЦИЕНТА
 declare @rc int; 
exec @rc=NEW_PACIENT @n ='Смулькевич Иван Иванович', @g = 'м',
@KT = 2, @AD =  'г. Минск ул. Сиза 2', @KD = 3, 
@DP = '2016-04-22', @DV = '2016-05-05';
print 'Клиент добавлен' ;
select * from PACIENTY

-- ЗАМЕНА СОТРУДНИКА  
DECLARE @CS VARCHAR(30);
EXECUTE UPDATE_SOTRUDNIKA @NN = 'Кукишев Сергей Владимирович', 
@N = 'Коледа Александр Юрьевич',
@AD = 'г. Минск, ул. Пушкинская 129 ',
@DR = '26.11.1992',
@COUNTS = @CS OUTPUT ;
PRINT N'УДАЛЕНО СОТРУДНИКОВ: ' + CONVERT(NVARCHAR(30), @CS);
select * from PERSONAL;


--добавление сотрудника 
declare @rc int; 
exec @rc=NEW_SOTRUDNIKA @n ='Кукишев Сергей Владимирович', 
 @AD =  'г. Минск, ул. Ванеева 22', @DR = '27.01.1982', 
@T = '8017-509-74-03', @KO = 2, @KD = 1;
print 'Сотрудник ДОБАВЛЕН'

--ПОЛНЫЙ ПУТЬ ПАЦИЕНТА 
SELECT * FROM [ПУТЬ ПАЦИЕНТА];

-- СОБЫТИЯ ДЛЯ ТРИГГЕРА
 SELECT * FROM TR_PAC;
--ВСТАВКА
insert into  PACIENTY (FIO,GENDER,KOD_OTDEL,ADDRESS,KOD_DIAGNOZA,DATA_POSTUP,DATA_VYPISKI) 
values ('Стасюкевич Стас Александрович','м',2,'г. Минск ул.Карины 13',3,'2016-03-24','2016-04-07');
--УДАЛЕНИЕ
DELETE FROM PACIENTY WHERE ADDRESS = 'г. Минск ул.Карины 13';
--ИЗМЕНЕНИЕ
UPDATE PACIENTY SET FIO = 'Стасюкевич Игорь Александрович'
WHERE ADDRESS = 'г. Минск ул.Карины 13';
SELECT * FROM PACIENTY WHERE ADDRESS = 'г. Минск ул.Карины 13';
 