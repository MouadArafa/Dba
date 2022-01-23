create type T_salle as object (numero varchar(20), Videoproj char(1))
not INSTANTIABLE  not FINAL ;
create type T_salle_Cours  under  T_salle
(CAPACITe NUMBER(3), Retroprojecteur char(1), micro char(1)) ; 

create type T_salle_Info  under  T_salle
(Nb_ordinateurs NUMBER(2),OS varchar(20)) ;

create or replace type T_Enseignement  as object
(Code VARCHAR(20),Effectif Number(3), Videoprojecteur char(1))
not final ;

create type T_CM under T_Enseignement
(Retroprojecteur char(1));
create type T_TD under T_Enseignement
(Sur_machine char(1));
create type T_Planning  as OBJECT 
( Ref_salle REF T_salle,
Ref_ens  REF T_Enseignement ,
jour VARCHAR(10), heure_debut number(4,1) ,
heure_fin number(4,1));

CREATE TABLE SALLE OF T_Salle
(Constraint salle_pk PRIMARY KEY(Numero)); 

CREATE TABLE Enseignement OF  T_Enseignement
(Constraint Ens_pk PRIMARY KEY(code));

CREATE TABLE Planning OF  T_Planning
(Constraint Planning_ref_salle FOREIGN KEY(Ref_salle) 
REFERENCES SALLE ,
Constraint Planning_ref_ens FOREIGN KEY(Ref_ens) 
REFERENCES Enseignement ) ; 

insert into Salle values (T_salle_Cours('AMPHICassin','O',400,'O','O'));
insert into Salle values (T_salle_Cours('L231','N',80,'N','N'));
insert into Salle values (T_salle_Cours('K188','N',50,'O','N'));
insert into Salle values (T_salle_INFO('L219','N',13,'Windows'));
insert into Salle values (T_salle_INFO('k192','O',13,'Windows/Linux'));

insert into Enseignement values ('S0INFO',350,'N');
insert into Enseignement values(T_CM('S1BDPROGCM',50,'O','N'));
insert into Enseignement values(T_CM('S2BDACM',25,'O','N'));
insert into Enseignement values(T_TD('S1BDPROGTD1',50,'O','N'));
insert into Enseignement values(T_TD('S1BDPROGTD2',25,'N','O'));
insert into Enseignement values(T_TD('S2BDATD',25,'N','N'));

INSERT INTO planning VALUES (
(select REF(s) FROM SALLE s where s.numero = 'L231'),
(select REF(e) FROM Enseignement e where e.code = 'S1BDPROGCM'),'Mardi',8,9.5);






