-- DAY 5-----------------------------------------------------

/* 
-- Implicit cursor
-- Explicit Cursdor
Ref Cursor
Exceptions
Exceptions 1
Triggers 1
triggers 2
Dependencies

*/


-- Differences b/w normal and reference cursor
/* what is NOrmal Curso?

For a query , we write a cursor.....

REF cursor can be used for different queries .. 

in procedure ... ref cursor can be passed onto 

normal cursor cannnot be passed 
Ref cursor is dynamiic and normal is static


you cannot pass ref cursor to procedures ----------------


 WHen we want to give the cursor to front end guys !
Anonymous call can be from a procedure
*/

select * from location_id


select * from regions

--// for the front end guys ... 
set serveroutput ontobegin
ckr_locations_pr(1);
end;



-- TRIGGERS---
/*  stored under USER_TRIGGER


procedures  functions and pakages are stored in user_source


- Statement Level Trigger
: NEW
: OLD

Raised Application error/



what is meant by column new and column old?

>> New row or new data ... Whenever new data comes ... used with inserts 
>> Old row or old data --> Using updates along with old data .. PERFORMING updates .... 


:new and :old are only used with ROW LEVEL TRIGGER


HOW to identify ? 




When to use these ?

I f we use all  columns of the table then we use statement level trigger 
if we use only some columns of the table .. we use row level trigger !

*/

-- TRIGGER EXAMPLE NEW -- 

create table emp_temp(empno number(6), sal number(6));

create or replace trigger trg_inst
before insert on emp_temp -- on is used for ???? and in is used for ----- ????? 
for each row
begin
if :new.sal<5000 then
raise_application_error(-20009,'sal should be above 5000');
end if;
end;
-- Triggers are compiled  -- 

insert into emp_temp values(12345, 4000);

create table log(
log_date date,
log_user varchar2(20),
log_description varchar2(20))



/*

EMP_TEMP
Create log TAble
Compile the trigger

*/

create table emp_temp(empno number(6), sal number(6)); 
create or replace trigger trg_salchk
before insert on emp_temp
for each row
begin
if :new.sal<5000 then
raise_application_error(-20009,'sal should be above 5000');
end if;
end;


insert into emp_temp values(12345, 4000);
select * from emp_temp;
update emp_temp set sal = 5500 where empno = 12345;

select * from emp_temp;


create table log(
log_date date,
log_user varchar2(20),
log_description varchar2(20))



create or replace trigger log_trg
after insert or update or delete on emp_temp
declare
v_trn varchar2(20);
begin
if inserting then
v_trn :='inserted';
elsif updating then
v_trn :='updated';
elsif  deleting then
v_trn :='deleted';
end if;
insert into log values(sysdate,user,v_trn);
end;

select * from emp_temp;

Update emp_temp set sal = 50000 where empno =12345;
insert into emp_temp values (12346, 5001);

SELECT TO_CHAR(LOG_DATE,'DD-MON-YY HH24:MI:SS')
AS "LOG DATE",LOG_USER,LOG_DESCRIPTION FROM LOG





---- ALways use oracle help for the errors ------
/* Description -- and definitions*/



DECLARE
  l_name departments.DEPARTMENT_ID%TYPE;
BEGIN
  SELECT DEPARTMENT_NAME
        INTO l_name
      FROM departments;
EXCEPTION
--WHEN TOO_MANY_ROWS THEN
 DBMS_OUTPUT.PUT_LINE('SQLCODE: '||SQLCODE);
 DBMS_OUTPUT.PUT_LINE('SQLERRM: '||SQLERRM);
END;

SQLCODE -- ORA 4140 oracle error 
SQLERRM -- error no and descrtiption
NEED TO KNOW THE FLOW OF PROJECT
-------------------------------------------------------------------------------------------------------
DECLARE
  l_name departments.DEPARTMENT_ID%TYPE;
BEGIN
  SELECT DEPARTMENT_NAME
        INTO l_name
      FROM departments;
--EXCEPTION
--WHEN TOO_MANY_ROWS THEN
 --DBMS_OUTPUT.PUT_LINE('SQLCODE: '||SQLCODE);
 DBMS_OUTPUT.PUT_LINE('SQLERRM: '||SQLERRM);
END;

--------------------------------------------------------------------------------------------
/*

Error report:
ORA-01422: exact fetch returns more than requested number of rows
ORA-06512: at line 4
01422. 00000 -  "exact fetch returns more than requested number of rows"_____________________________________ USE CURSOR
*Cause:    The number specified in exact fetch is less than the rows returned.
*Action:   Rewrite the query or change number of rows requested

*/

------------------------------------------------------------------------------------------------------------


When Others then 
v_Error_Msg  :=SQLERRM ; --  SQERRM -- captures the errors
DBMS_OUTPUT.PUT_LINE(v_Error_Msg);
end;



--------------------------------------------------------------------------------------------------------

set serveroutput on
declare
l_employee_id employees.employee_id%type;
l_first_name employees.first_name%type;
v_ErrorMesg			varchar2(45);
begin
select employee_id,first_name  into l_employee_id,l_first_name from employees where employee_id='&l_employee_id';
dbms_output.put_line(l_employee_id||'     '||l_first_name);
exception
--when no_data_found then
--dbms_output.put_line('no rows');
when too_many_rows then
dbms_output.put_line('many rows');

when others then
v_ErrorMesg	:= sqlerrm ;
dbms_output.put_line(v_ErrorMesg);
 
end;



/* 
anonymous block completed
ORA-01403: no data found

*/


for too many data ....
if u are not using cursor!


set serveroutput on
declare
l_employee_id employees.employee_id%type;
l_first_name employees.first_name%type;
v_ErrorMesg			varchar2(45);
begin

	begin

	select employee_id,first_name  into l_employee_id,l_first_name from employees where employee_id='&l_employee_id';
	dbms_output.put_line(l_employee_id||'     '||l_first_name);
	exception
	--when no_data_found then
	--dbms_output.put_line('no rows');
	--when too_many_rows then
	--dbms_output.put_line('many rows');

	when others then
	v_ErrorMesg	:= sqlerrm ;
	dbms_output.put_line(v_ErrorMesg);

	end;

	begin

	select employee_id,first_name  into l_employee_id,l_first_name from employees where employee_id='&l_employee_id';
	dbms_output.put_line(l_employee_id||'     '||l_first_name);
	exception
	when no_data_found then
	dbms_output.put_line('no rows with data found ');
	when too_many_rows then
	dbms_output.put_line('many rows');

	when others then
	v_ErrorMesg	:= sqlerrm ;
	dbms_output.put_line(v_ErrorMesg);
	end;

end;














select employee_id,first_name  into l_employee_id,l_first_name from employees where employee_id='&l_employee_id';
dbms_output.put_line(l_employee_id||'     '||l_first_name);
exception
--when no_data_found then
--dbms_output.put_line('no rows');
when too_many_rows then
dbms_output.put_line('many rows');

when others then
v_ErrorMesg	:= sqlerrm ;
dbms_output.put_line(v_ErrorMesg);
 
end;


-----------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------ VIEW VALID AND INVALID -----------------------------------------------------------------


whenever there is a dependency... procedures and functiobns becomes invalid and also ither related objects ... INVALID OCCURS when table is 
ALTERED at times >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.. Table ki dependecy dekh kar 


SELECT name, type, referenced_name, referenced_type
FROM   user_dependencies
WHERE  referenced_name IN ('EMPLOYEES','EMP_VW' ); 


CREATE VIEW commissioned AS
SELECT first_name, last_name, commission_pct FROM employees
WHERE commission_pct > 0.00;


CREATE VIEW six_figure_salary AS
SELECT * FROM employees
WHERE salary >= 100000;


SELECT object_name, status 
FROM user_objects 
WHERE object_type = 'VIEW'; 



ALTER TABLE employees MODIFY email VARCHAR2(50);
-----------------------------------------------------------------------------------------------------------------------------------
SELECT object_name, status 
FROM user_objects 
WHERE object_type = 'VIEW'; 



SELECT name, type, referenced_name, referenced_type
FROM   user_dependencies
WHERE  referenced_name IN ('EMPLOYEES','EMP_VW' ); 


CREATE VIEW commissioned AS
SELECT first_name, last_name, commission_pct FROM employees
WHERE commission_pct > 0.00;


CREATE VIEW six_figure_salary AS
SELECT * FROM employees
WHERE salary >= 100000;


SELECT object_name, status 
FROM user_objects 
WHERE object_type = 'VIEW'; 



ALTER TABLE employees MODIFY email VARCHAR2(50);

SELECT object_name, status 
FROM user_objects 
WHERE object_type = 'VIEW'; 

-0-------------------------------------------------------

-- AFTWER LUNCH---------------------------------
BAsic salary = salary*0.10
Hra = 20% of Basic salary
conveyance =_allow = 15% of basic salary
city_allow = 4500;
medical_allwance = 10% of basic salary
Bonus =700;

Gross earning  = Basic salary + HRA + conveyance_allo+city _allow + medical_allwance

PF = 12% of basic salary
TAX

Gross_deduction = PF + TAX

Net = GROSS EARNING - GROSS Gross_deduction






--------------------------------------------------------------------------------------

--gross earnings
--gross deductions
--net pay

-- assign 

-- code from ofho



/*
set serveroutput on
 declare
 l_employee_id number(6);
 l_last_name varchar(20);
 l_first_name employees.first_name%type;
 l_email employees.email%type;
 l_phone_number employees.phone_number%type;
 l_hire_date employees.hire_date%type;
 l_job_id employees.job_id%type;
 l_job_title jobs.job_title%type;
 l_min_salary jobs.min_salary%type;
 l_max_salary jobs.max_salary%type;
 l_manager_id departments.manager_id%type;
 l_department_id departments.department_id%type;
 l_department_name departments.department_name%type;
 l_location_id locations.location_id%type;
 l_street_address locations.street_address%type;
 l_postal_code locations.postal_code%type;
 l_city locations.city%type;
 l_state_province locations.state_province%type;
 l_country_id countries.country_id%type;
 l_country_name countries.country_name%type;
 l_region_id regions.region_id %type;
 l_region_name regions.region_name%type;

 --CHANGE---


 	l_basic_salary number(12,2);
 	l_hra number(12,2);
 	l_conveyance_allowance number(12,2);
	l_city_allowance number(12,2);
	l_medical_allowance number(12,2);
	l_bonus number(12,2);
	l_gross_earning number(12,2);
	l_PF number(12,2);
	l_tax number(12,2);
	l_gross_deduction number(12,2);
	l_net_salary number(12,2);


 cursor c_employees is
 select
 e.employee_id,
 e.last_name,
 e.first_name,
 e.email,
 e.phone_number,
 e.hire_date,
 e.job_id,
 j.job_title,
 j.min_salary,
 j.max_salary,
 d.manager_id,
 d.department_id,
 d.department_name,
 l.location_id,
 l.street_address,
 l.postal_code,
 l.city,
 l.state_province,
 c.country_id,
 c.country_name,
 r.region_id,
 r.region_name

from employees e , departments d, locations l,jobs j,countries c,regions r
where e.department_id =d.department_id
and d.location_id=l.location_id
and e.job_id=j.job_id
and l.country_id= c.country_id
and c.region_id=r.region_id;
begin
for emprec in c_employees loop
l_employee_id := emprec.employee_id;
l_last_name := emprec.last_name;

l_first_name := emprec.first_name;
l_email := emprec.email;
l_phone_number := emprec.phone_number;
l_hire_date := emprec.hire_date;
l_job_id := emprec.job_id;
l_job_title := emprec.job_title;
l_min_salary := emprec.min_salary;
l_max_salary := emprec.max_salary;
l_manager_id := emprec.manager_id;
l_department_id := emprec.department_id;
l_department_name := emprec.department_name;
l_location_id := emprec.location_id;
l_street_address := emprec.street_address;
l_postal_code := emprec.postal_code;
l_city := emprec.city;
l_state_province := emprec.state_province;
l_country_id := emprec.country_id;
l_country_name := emprec.country_name;
l_region_id := emprec.region_id;
l_region_name := emprec.region_name;



/*
BAsic salary = salary*0.10
Hra = 20% of Basic salary
conveyance =_allow = 15% of basic salary
city_allow = 4500;
medical_allwance = 10% of basic salary
Bonus =700;

Gross earning  = Basic salary + HRA + conveyance_allo+city _allow + medical_allwance

PF = 12% of basic salary
TAX

Gross_deduction = PF + TAX

Net = GROSS EARNING - GROSS Gross_deduction 
---- CHANGE ----
	l_basic_salary 			:= salary * 0.10;
 	l_hra 		   			:= l_basic_salary * 0.20;
 	l_conveyance_allowance 	:= l_basic_salary * 0.15;
	l_city_allowance		:= 4500;
	l_medical_allowance 	:= l_basic_salary * 0.10;
	l_bonus					:= 700;
	l_gross_earning			:= l_basic_salary + l_hra + l_conveyance_allowance + l_medical_allowance;
	l_PF					:= 0.12 + l_basic_salary;
	l_tax					:= ;
	l_gross_deduction		:= ;
	l_net_salary			:= ;

dbms_output.put_line(l_employee_id
 ||' '||l_last_name
 ||' '||l_first_name
 ||' '||l_email
 ||' '||l_phone_number
 ||' '||l_hire_date
 ||' '||l_job_id
 ||' '||l_job_title
 ||' '||l_min_salary
 ||' '||l_max_salary
 ||' '||l_manager_id
 ||' '||l_department_id
 ||' '||l_department_name
 ||' '||l_location_id
 ||' '||l_street_address
 ||' '||l_postal_code
 ||' '||l_city
 ||' '||l_state_province
 ||' '||l_country_id
 ||' '||l_country_name
 ||' '||l_region_id
 ||' '||l_region_name);
 end loop;
 end;
 /
 show error */

------------------------------------CODE FROM CHACHA -------------------------------

 set serveroutput on
 declare
 l_employee_id number(6);
 l_last_name varchar(20);
 l_first_name employees.first_name%type;
 l_email employees.email%type;
 l_phone_number employees.phone_number%type;
 l_hire_date employees.hire_date%type;
 l_job_id employees.job_id%type;
 l_job_title jobs.job_title%type;
 l_min_salary jobs.min_salary%type;
 l_max_salary jobs.max_salary%type;
 l_manager_id departments.manager_id%type;
 l_department_id departments.department_id%type;
 l_department_name departments.department_name%type;
 l_location_id locations.location_id%type;
 l_street_address locations.street_address%type;
 l_postal_code locations.postal_code%type;
 l_city locations.city%type;
 l_state_province locations.state_province%type;
 l_country_id countries.country_id%type;
 l_country_name countries.country_name%type;
 l_region_id regions.region_id %type;
 l_region_name regions.region_name%type;
 l_gross_sal number(12,2);
 l_gross_deduc number(12,2);
 l_net_pay number(12,2);
 l_sal number(12,2);
	l_hra number(12,2);
	l_basic_sal number(12,2);
	l_tax number(12,2);
 cursor c_employees is
 select
 e.employee_id,
 e.last_name,
 e.first_name,
 e.email,
 e.phone_number,
 e.hire_date,
 e.job_id,
 j.job_title,
 j.min_salary,
 j.max_salary,
 d.manager_id,
 d.department_id,
 d.department_name,
 l.location_id,
 l.street_address,
 l.postal_code,
 l.city,
 l.state_province,
 c.country_id,
 c.country_name,
 r.region_id,
 r.region_name

from employees e , departments d, locations l,jobs j,countries c,regions r
where e.department_id =d.department_id
and d.location_id=l.location_id
and e.job_id=j.job_id
and l.country_id= c.country_id
and c.region_id=r.region_id;


begin


for emprec in c_employees loop


l_employee_id := emprec.employee_id;
l_last_name := emprec.last_name;
l_first_name := emprec.first_name;
l_email := emprec.email;
l_phone_number := emprec.phone_number;
l_hire_date := emprec.hire_date;
l_job_id := emprec.job_id;
l_job_title := emprec.job_title;
l_min_salary := emprec.min_salary;
l_max_salary := emprec.max_salary;
l_manager_id := emprec.manager_id;
l_department_id := emprec.department_id;
l_department_name := emprec.department_name;
l_location_id := emprec.location_id;
l_street_address := emprec.street_address;
l_postal_code := emprec.postal_code;
l_city := emprec.city;
l_state_province := emprec.state_province;
l_country_id := emprec.country_id;
l_country_name := emprec.country_name;
l_region_id := emprec.region_id;
l_region_name := emprec.region_name;
l_sal:=200000;
l_basic_sal:=l_sal*(0.10);
l_hra:=(0.2)*l_basic_sal;
l_gross_sal:=l_hra+l_basic_sal;
 
l_gross_deduc:=l_tax;
l_net_pay:=l_gross_sal-l_gross_deduc;


if l_sal>00000 and l_sal<250000 then
l_tax:=0;
l_gross_sal:=l_hra+l_basic_sal;
 dbms_output.put_line(l_basic_sal||' '||l_net_pay||' '||l_gross_deduc);
 dbms_output.put_line('between 0 and 2 lakhs');

 elsif
  l_sal>250000 and l_sal<500000 then
  l_tax:=10;
  l_gross_sal:=l_hra+l_basic_sal;
  dbms_output.put_line(l_basic_sal||' '||l_net_pay||' '||l_gross_deduc);
 dbms_output.put_line('between 3 lakh and 4 lakhs');

 elsif
  l_sal>500000 and l_sal<800000 then
  l_tax:=20;
  l_gross_sal:=l_hra+l_basic_sal;
  dbms_output.put_line(l_basic_sal||' '||l_net_pay||' '||l_gross_deduc);
 dbms_output.put_line('between 5 lakh and 6 lakhs');

 elsif
  l_sal>800000 then
  l_tax:=30;
  l_gross_sal:=l_hra+l_basic_sal;
  dbms_output.put_line(l_basic_sal||' '||l_net_pay||' '||l_gross_deduc);
  dbms_output.put_line('between 8 lakh and above');

else
SYS.DBMS_OUTPUT.PUT_LINE('out of range');

end if;



  

dbms_output.put_line(l_employee_id
 ||' '||l_last_name
 ||' '||l_first_name
 end loop;
 end;
 /
 show error
 */

||' '||l_email
 ||' '||l_phone_number
 ||' '||l_hire_date
 ||' '||l_job_id
 ||' '||l_job_title
 ||' '||l_min_salary
 ||' '||l_max_salary
 ||' '||l_manager_id
 ||' '||l_department_id
 ||' '||l_department_name
 ||' '||l_location_id
 ||' '||l_street_address
 ||' '||l_postal_code
 ||' '||l_city
 ||' '||l_state_province
 ||' '||l_country_id
 ||' '||l_country_name
 ||' '||l_region_id
 ||' '||l_region_name);
 