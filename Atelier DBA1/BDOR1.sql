create or replace Type T_ADRESSAGE  as object
(IP varchar2(15) ,DNS VARCHAR2(100)) ;
create or replace Type T_localisation  as object
(campus varchar2(50) ,BATIMENT VARCHAR2(20),salle number(3)) ;

create table Serveur (Numserv number(3),Adressage T_ADRESSAGE ,
Localisation  T_localisation ) ; 

insert into serveur values (0,T_ADRESSAGE('159.84.143.204','www.dns1.com'),
T_localisation('C1','B1',1));

insert into serveur values (1,T_ADRESSAGE('159.84.143.120','www.dns2.com'),
T_localisation('C2','B2',2));

insert into serveur values (2,T_ADRESSAGE('159.84.143.249','www.dns3.com'),
T_localisation('C2','B2',3));

insert into serveur values (3,T_ADRESSAGE('159.84.143.252','www.dns4.com'),
T_localisation('C2','B2',2));

insert into serveur values (4,T_ADRESSAGE('159.84.143.251','www.dns5.com'),
T_localisation('C2','B2',2));

insert into serveur values (5,T_ADRESSAGE('159.84.143.250','www.dns6.com'),
T_localisation('C2','B2',4));

commit ; 

-- question 4 select * from serveur ; 




