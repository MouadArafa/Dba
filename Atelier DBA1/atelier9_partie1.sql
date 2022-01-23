CREATE USER EMI identified by MARY 
default tablespace DATA01
temporary tablespace temp 
quota 10M on Data01 ; 
GRANT CREATE SESSION , create table to EMI ;
GRANT SELECT ON EMI.CUSTOMERS TO BOB  ; 
desc DBA_tab_privs  ; 
select * from DBA_tab_privs where GRANTEE='BOB' ; 
CREATE USER TREVOR IDENTIFIED BY TREVOR ;
ALTER USER TREVOR QUOTA 1m ON USERS ;
grant create session to trevor ;
 