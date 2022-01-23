select name from v$database  ; 
DESCRIBE dba_data_files
select TABLESPACE_NAME ,STATUS ,AUTOEXTENSIBLE  from dba_data_files ;
desc V$parameter
select value from V$parameter where upper(name) = 'DB_CREATE_FILE_DEST' ; 
create tablespace DATA01 datafile 'C:\app\ISGA\oradata\orcl2\data01.dbf' size 10M 
EXTENT MANAGEMENT LOCAL ;

create tablespace DATA02 datafile 'C:\app\ISGA\oradata\orcl2\data02.dbf' size 10M 
EXTENT MANAGEMENT LOCAL uniform size 500K ;

create tablespace INDEX01 datafile 'C:\app\ISGA\oradata\orcl2\INDEX01.dbf' size 1M AUTOEXTEND ON NEXT 1M
Maxsize 5M EXTENT MANAGEMENT LOCAL uniform size 100K  ;

create tablespace RONLY datafile 'C:\app\ISGA\oradata\orcl2\RONLY.dbf' size 5M ;

desc v$datafile  ;
select name ,  ENABLED  from  v$datafile ; 
desc dba_tablespaces ; 

select TABLESPACE_NAME , status  from dba_tablespaces ;
Alter database datafile 'C:\app\ISGA\oradata\orcl2\data02.dbf' resize 13M ;

alter tablespace index01 offline  ; 

Alter TABLESPACE index01 Rename datafile 'C:\app\ISGA\oradata\orcl2\INDEX01.dbf' To 
'C:\app\ISGA\oradata\orcl2\u06\INDEX01.dbf' ;

alter tablespace index01 online  ; 

select name ,  ENABLED  from  v$datafile ; 

-- question 4 
create table table_test (nom varchar2(15), prenom varchar2(30)) tablespace RONLY;

ALTER tablespace RONLY read only ;
select TABLESPACE_NAME , status  from dba_tablespaces ;

create table table_test2 (nom varchar2(10), prenom varchar2(10)) tablespace RONLY;

drop table table_test ; 

DROP TABLESPACE ronly including contents and DATAFILES ;
select name ,  ENABLED  from  v$datafile ;

select value from v$PARAMETER WHERE upper(name)= 'DB_CREATE_FILE_DEST' ; 

alter system set DB_CREATE_FILE_DEST = 'C:\app\ISGA\oradata\orcl2\u05' SCOPE = MEMORY ; 

create tablespace DATA03 datafile size  10M ;

create tablespace DATA04  ;









