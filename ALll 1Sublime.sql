SELECT COLUMN_NAME, CONSTRAINT FROM 
USER_CONNS_COLUMNS WHERE TABLE_NAME = 'EMPLOYEES'




create table MYTABLE (name VARCHAR2(50), id number, salary number(8,2), constraint MYTABLE_NAME_ID_PK PRIMARY KEY(id,name))