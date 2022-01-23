 
CREATE TYPE T_Salle AS OBJECT(
 Numero VARCHAR(20),  Videoprojecteur CHAR(1))
 NOT INSTANTIABLE
NOT FINAL ;
CREATE TYPE T_Salle_cours UNDER T_Salle(
 Capacite NUMBER(3), Retroprojecteur CHAR(1), Micro CHAR(1)) ;
 CREATE TYPE T_Salle_info UNDER T_Salle(
 Nb_ordinateurs NUMBER(2),
 OS VARCHAR(20))
/

CREATE TYPE T_Enseignement AS OBJECT(
 Code VARCHAR(20),
 Effectif NUMBER(3),
 Videoprojecteur CHAR(1))
NOT FINAL
/ 

CREATE TYPE T_CM UNDER T_Enseignement( 
 Retroprojecteur CHAR(1))
/ 

CREATE TYPE T_TD UNDER T_Enseignement( 
 Sur_machine CHAR(1))
/ 

CREATE TYPE T_Planning AS OBJECT( 
 Ref_salle REF T_Salle,
 Ref_ens REF T_Enseignement, 
 Jour VARCHAR(10),
 Heure_debut NUMBER(4,1), 
 Heure_fin NUMBER(4,1))
/

CREATE TABLE Salle OF T_Salle(
 CONSTRAINT Salle_pk PRIMARY KEY(Numero)); 

CREATE TABLE Enseignement OF T_Enseignement( 
 CONSTRAINT Ens_pk PRIMARY KEY(Code));
 
 CREATE TABLE Planning OF T_Planning(
 CONSTRAINT Planning_ref_salle Foreign key (Ref_salle) REFERENCES Salle,
  CONSTRAINT Planning_ref_salle_null CHECK (Ref_salle IS NOT NULL), 
 CONSTRAINT Planning_ref_ens Foreign key (Ref_ens) REFERENCES Enseignement,
 CONSTRAINT Planning_ref_ens_null CHECK (Ref_ens IS NOT NULL));
 
 
INSERT INTO Salle VALUES(T_Salle_cours('Amphi Cassin', 'O', 400, 'O', 'O'));
INSERT INTO Salle VALUES(T_Salle_cours('L231', 'N', 80, 'N', 'N'));
INSERT INTO Salle VALUES(T_Salle_cours('K188', 'N', 50, 'O', 'N'));
INSERT INTO Salle VALUES(T_Salle_info('L219', 'O', 12, 'Windows'));
INSERT INTO Salle VALUES(T_Salle_info('K192', 'N', 12, 'Windows/Linux')); 

INSERT INTO Enseignement VALUES( 'S0INFO', 500, 'N');
INSERT INTO Enseignement VALUES( T_CM('S1BDPROGCM', 50, 'O', 'N'));
INSERT INTO Enseignement VALUES( T_CM('S2BDACM', 25, 'O', 'N'));
INSERT INTO Enseignement VALUES( T_TD('S1BDPROGTD1', 50, 'O', 'N'));
INSERT INTO Enseignement VALUES( T_TD('S1BDPROGTD2', 25, 'N', 'O'));
INSERT INTO Enseignement VALUES( T_TD('S2BDATD', 25, 'N', 'N'));
 
INSERT INTO Planning VALUES(
 (SELECT REF(s) FROM Salle s WHERE s.Numero = 'L231'), 
 (SELECT REF(e) FROM Enseignement e WHERE e.Code = 'S1BDPROGCM'),'Mardi', 8, 9.5); 

INSERT INTO Planning VALUES( 
 (SELECT REF(s) FROM Salle s WHERE s.Numero = 'K188'),
 (SELECT REF(e) FROM Enseignement e WHERE e.Code = 'S2BDACM'), 'Mercredi', 8, 9.5);

INSERT INTO Planning VALUES(
 (SELECT REF(s) FROM Salle s WHERE s.Numero = 'L231'),
 (SELECT REF(e) FROM Enseignement e WHERE e.Code = 'S2BDACM'), 'Mercredi', 9.5, 11);

INSERT INTO Planning VALUES(
 (SELECT REF(s) FROM Salle s WHERE s.Numero = 'Amphi Cassin'),
 (SELECT REF(e) FROM Enseignement e WHERE e.Code = 'S0INFO'),'Lundi', 15, 16.5);

INSERT INTO Planning VALUES(
 (SELECT REF(s) FROM Salle s WHERE s.Numero = 'L231'),
 (SELECT REF(e) FROM Enseignement e WHERE e.Code = 'S1BDPROGTD1'),'Mardi', 9.5, 11);

INSERT INTO Planning VALUES(
 (SELECT REF(s) FROM Salle s WHERE s.Numero = 'K192'),
 (SELECT REF(e) FROM Enseignement e WHERE e.Code = 'S1BDPROGTD2'),'Mardi', 15, 16.5);

INSERT INTO Planning VALUES(
 (SELECT REF(s) FROM Salle s WHERE s.Numero = 'K192'),
 (SELECT REF(e) FROM Enseignement e WHERE e.Code = 'S2BDATD'), 'Jeudi', 9.5, 11);
 

 select * from salle ; 
  
 select value(s) from salle s ;
 
 select value(e) from Enseignement e ;
 
 select * from Planning  ;
 
 select distinct p.ref_ens.code , p.ref_salle.numero , p.jour , p.heure_debut , p.heure_fin  from Planning p ; 
 
 select  p.ref_ens.code , p.ref_salle.numero    from Planning p 
 where p.ref_ens.Videoprojecteur = 'O'  and p.ref_salle.Videoprojecteur = 'N' ; 
 
 select p.ref_salle.numero , count(distinct p.ref_ens) from Planning p
 group by  p.ref_salle.numero ; 
 
 select numero from salle where numero not in (select p.ref_salle.numero from Planning p ) ;  

 
 




