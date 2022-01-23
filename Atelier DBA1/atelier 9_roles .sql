DESC dba_sys_privs
select * from dba_sys_privs where upper(GRANTEE) = 'RESOURCE' ;

create Role DEV ; 
desc dba_roles ; 
select * from dba_roles ; 
grant create table , create view to DEV  ; 
grant select on "emi".CUSTOMERS to DEV ; 

grant resource , DEV to BOB ; 

Alter user BOB default role "RESOURCE" ;

grant select_catalog_role to bob  ; 

desc dba_rollback_segs

select SEGMENT_NAME from dba_rollback_segs where upper(STATUS) = 'ONLINE' ;  

/* sous system */ create view cust_view as select * from "emi".customers ; 





