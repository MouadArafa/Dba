CONNECT emi/abcd12

CREATE TABLE customers ( cust_code VARCHAR2(3),
                         name      VARCHAR2(50),
                         region    VARCHAR2(5)   )
TABLESPACE data01;

CREATE TABLE orders ( ord_id       NUMBER(3),
                      ord_date     DATE,
                      cust_code    VARCHAR2(3),
                      date_of_dely DATE         )
TABLESPACE data01;

