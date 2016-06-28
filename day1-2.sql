create table test( employee_id varchar(20), first_name varchar(20), second_name varchar (20));
insert into test values('9997','Jai','Gupta');


create sequence employee_seq start with 1
increment by 1
minvalue 1
maxvalue 9999;



insert into test values (employee_seq.nextval,'Nikhil','Raj');
select * from test;

