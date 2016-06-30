-- SUB QQUERIES -- **** -4-- 
/* When to go for sub queries.... IF U DONT GET JOIN CONDITIONS 
   NESTING QUERIES-INNER QUERY

   SYNTAX::(OUTER QUERY) where (INNER QUERY)
   select department_id from employees where last_name = 'Kochhar';
   select * from employees where department_id = 90;

*/
-- tell which people work under kochhar department!

select * from employees where department_id = select department_id from employees where last_name = 'Kochhar');


-- USING "IN" --
   /* If the qwuery is returning 1 row ===== SINGLE ROW SUB QUERY
      IF WE GET THE multiple rows == MULTI ROW SUB QUERIES


      -- OPERATORS -- 
      --------------------------------

      SINGLE QUERY uses ..... =  <  >  
      IF MULTI ROW QUERY .... IN  EXISTS  >ANY  <ANY  >ALL  <ALL

      IS "notIn" used ?
   */ 

   -- IF in your query .. u use group fubnctions such as average add sum  etc. AVOID the use of these as there is a low performance ... Need performance tuning 

   /* >any -- picks the minimum value from the list, which are more than min
      <any -- picks the max value from the list, which are less than max

      >all -- picks the max value from the list, which are more than max
      < all -- picks the min value ffrom the list , which are the list than min !

      */

-- display all employees data if salary of employees is more than minimum salary of 10th department .

-- This query will work but with more time comlexity... 
select * from employees where salary > (select min (salary) from employees where department_id = 10);
                              ----  OR  ------
-- using >any 
select * from employees where salary > any(select salary from employees where department_id =10);

-- dfisplay all employee dattaif  salary of employee is less than maximum salary of 20 th department

select * from employees where salary < any(select salary from employees where department_id = 20);

-- display all emp data if salary of employee is more than maximum sakary of 20th deopartment

select * from employees where salary >all (select salary from employees where department_id = 20);

-- display all emp data 

select * from employees where salary <all (select salary from employees where department_id = 20);
      -- using :::: outer first and inner then ----- (inner) >all ((outer))

-- create table test male and female is there 
-- which ever is duplicated 

create table test 
   (
      apllication_no number(6), 
      person_no number(6),
      gender varchar2(20),
      name varchar2(20)
   );

   insert into test values (101,1,'M','vinay');
   insert into test values (101,2,'M','balloo');
   insert into test values (102,1,'M','JAi');
   insert into test values (102,2,'F','rhythm');
   insert into test values (103,1,'F','binay');
   insert into test values (103,1,'F','bnikhil');
------------------------------------------------------------------------------------------
      select apllication_no, gender, name from test where 
      (
         where application_no, gender) in
         (select application_no, gender from 
            test group by application_no, gender
            having count(*)>1);
      );



-------------------------------------------------------------------------------------------

create table items (
   id number primary key,
   name varchar2(20),
   price number(7,2)
);

insert into items values (1, 'cmpl', 15.20);
   insert into items values (2, 'cmp2', 14.20);
      insert into items values (3, 'cmp3', 13.20);
         insert into items values (4, 'cmp4', 12.20);
            insert into items values (5, 'cmp5', 167.20);
               insert into items values (6, 'cmp5', 15.20);
                  insert into items values (7, 'cmp6', 18.20);
                     insert into items values (8, 'cmp7', 19.20);
                        insert into items values (9, 'cmpl', 10.20);
                           insert into items values (10, 'cmp5', 194.20);
                              insert into items values (11, 'cmp3', 132.20);
                                 insert into items values (12, 'cmp2', 123.20);
                                    insert into items values (13, 'cmpl', 124.20);
                                       insert into items values (14, 'cmp7', 167.20);



-- rownum-- drawback -- only less than will work-- gives the specified amount of rows from zero to num

select * from items where rownum <6; 

-----6 to 10----
-- if we want > greater than to work any how then , use sub query
select name, price
from ( select rownum r, name, price
   from items
   )
where r>5 and r < 11;


---- DELETE a ROW: DELETE is DML  need commit
---- TRUNCATE IS DDL: FASTER than DELETE


-----------------------------------------------------------------VIEWS-------------------------------------------------------------

/* View doesn't hold data , its a virtual table,,,,,,,,, To hide the confidential data, 
Views are stored as USER_views
 */

select * from USER_views


-- SIMPLE VIEW -- FOR ONE TABLE
create VIEW empvu80
   AS select employee_id, last_name, salary
   from employees
   where department_name
-----------------------------------------------------------------------------------------------------------------------------------------------------------------



/*
   DECODE and JOIN

   1 - self enrolled,
   2 - approved by manager,
   3 - waiting,
   4 - self cancellation
   5 - confirmed by admin
   6 - rejected by manager
   7 - trainer spot entry
*/





----------------------------------PL / SQL--------------------------------------------------------------------------------------------------------------
set serveroutput on
declare
l_employee_id number(6);
l_last_name varchar2(25);
Begin
select
employee_id,
last_name


into



l_employee_id, l_last_name from employees where employee_id = 100;
dbms_output.put_line(1_employee_id ||'    '||l_last_name);
end;

/show errors

select e. employee_id , e.last_name
from employees;

--------------------------------------------Refer ppt for % 

set serveroutput on
declare
l_employee_id employees.employee_id%type;
l_last_name employees.last_name%type;
Begin
select
employee_id,
last_name
into
l_employee_id, l_last_name from employees where employee_id = 100;
dbms_output.put_line(1_employee_id ||'    '||l_last_name);
end;

-----------------------------------------------------------------------------------------------------------------------------------------------------------
declare
l_employee_id employees.employee_id%type;
l_first_name employees.first_name%type;
l_last_name employees.last_name%type;
l_email employees.email%type;
l_phone_number employees.phone_number%type;
l_hire_date employees.hire_date%type;
l_job_id employees.job_id%type;
l_salary employees.salary%type;
l_commission_pct employees.commission_pct%type;


/* SELECT 

INTO '


 FROM 


  WHERE' */

Begin
select 
      emp.employee_id,
      emp.first_name,
      emp.last_name,
      emp.email,
      emp.phone_number,
      emp.hire_date,
      emp.job_id,
      j.job_title,
      j.min_salary,
      j.max_salary,
      emp.salary,
      emp.commission_pct,
      emp.manager_id,
      emp.department_id,
      dept.department_name,
      dept.location_id,
      loc.street_address,
      loc.postal_code,
      loc.city,
      loc.state_province,
      loc.country_id,
      ctry.country_name,
      ctry.region_id,
      regi.region_name,
      mgr.first_name mgr_first_name,
      mgr.last_name mgr_last_name                                               */

from 
         employees emp,
         departments dept,
         locations loc,
         countries ctry,
         regions regi,
         jobs j,
         employees mgr
         
   where emp.department_id = dept.department_id(+)
   and dept.location_id =loc.location_id(+)
   and loc.country_id = ctry.country_id(+)
   and ctry.region_id = regi.region_id(+)
   and emp.manager_id = mgr.employee_id(+)
   and emp.job_id = j.job_id(+)


server output on

declare
l_employee_id employees.employee_id%type;
l_first_name employees.first_name%type;
l_last_name employees.last_name%type;
l_email employees.email%type;
l_phone_number employees.phone_number%type;
l_hire_date employees.hire_date%type;
l_job_id employees.job_id%type;
l_salary employees.salary%type;
l_commission_pct employees.commission_pct%type;

Begin 
select
      emp.employee_id,
      emp.first_name,
      emp.last_name,
      emp.email,
      emp.phone_number,
      emp.hire_date,
      emp.job_id,
      j.job_title,
      j.min_salary,
      j.max_salary,
      emp.salary,
      emp.commission_pct,
      emp.manager_id,
      emp.department_id,
      dept.department_name,
      dept.location_id,
      loc.street_address,
      loc.postal_code,
      loc.city,
      loc.state_province,
      loc.country_id,
      ctry.country_name,
      ctry.region_id,
      regi.region_name,
      mgr.first_name mgr_first_name,
      mgr.last_name mgr_last_name
      
      into 
      l_employee_id,
      l_first_name,
      l_last_name,
      l_email
      
      from 
         employees emp,
         departments dept,
         locations loc,
         countries ctry,
         regions regi,
         jobs j,
         employees mgr
         
   where emp.department_id = dept.department_id(+)
   and dept.location_id =loc.location_id(+)
   and loc.country_id = ctry.country_id(+)
   and ctry.region_id = regi.region_id(+)
   and emp.manager_id = mgr.employee_id(+)
   and emp.job_id = j.job_id(+) and
      emp.employee_id = 100;
      
      dbms_output.put_line(l_employee_id || '   ' ||
      l_first_name || '    ' ||
      l_last_name || '     ' || 
      l_email);
end;


------- CURSOR-------
/* 
IMPLICIT
EXPLICIT CURSOR or cursors


PRE defined exceptions-- oracle... two_many_rows , No_data_found.... works only with select.. not work with DMLS....
Want to use the 
+6

sql%rowcount|| '  ' -- gives how many nnumber of rows it has updated.. that count it will give !

Explicit cursor:: when to go for a cursor?
***if ur select statement is returning more than one row.. u have to go for a cursor!
**** ERROR*** exact fetch returns more than requested no of rows"
NOW USE CURSOR..... NOT A SYNTAX ERROR .. 


CONTEXT AREA OR PRIVATE AREA



OPEN// open is for opening an area
FETCH // fetching one by one 
CLOSE



CURSOR FOR LOOPS

_------------------------------

only syntax variation
for empreec in c_employees loop
whatever is in cursor 1 will goto cursor2

*/


set serveroutput on
DECLARE
L_EMPLOYEE_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
L_LAST_NAME EMPLOYEES.LAST_NAME%TYPE;
L_EMP_MAIL EMPLOYEES.EMAIL%TYPE;
L_PHONE EMPLOYEES.PHONE_NUMBER%TYPE;
L_HIRE EMPLOYEES.HIRE_DATE%TYPE;
L_JOB_ID EMPLOYEES.JOB_ID%TYPE;
L_JOB_TITLE JOBS.JOB_TITLE%TYPE;
L_MIN_SALARY JOBS.MIN_SALARY%TYPE;
L_MAX_SALARY JOBS.MAX_SALARY%TYPE;
L_SALARY EMPLOYEES.SALARY%TYPE;
L_SALARY_COMMISION EMPLOYEES.COMMISSION_PCT%TYPE;
L_MAN_ID EMPLOYEES.MANAGER_ID%TYPE;
L_DEPT_ID EMPLOYEES.DEPARTMENT_ID%TYPE;
L_DEPT_NAME DEPARTMENTS.DEPARTMENT_NAME%TYPE;
L_LOC_ID DEPARTMENTS.LOCATION_ID%TYPE;
L_STREET LOCATIONS.STREET_ADDRESS%TYPE;
L_POSTAL LOCATIONS.POSTAL_CODE%TYPE;
L_CITY LOCATIONS.CITY%TYPE;
L_STATE LOCATIONS.STATE_PROVINCE%TYPE;
L_COUNTRY_ID LOCATIONS.COUNTRY_ID%TYPE;
L_COUNTRY_NAME COUNTRIES.COUNTRY_NAME%TYPE;
L_REGION_ID COUNTRIES.REGION_ID%TYPE;
L_REGION_NAME REGIONS.REGION_NAME%TYPE;
L_MANAGER_FNAME EMPLOYEES.FIRST_NAME%TYPE;
L_MANAGER_LNAME EMPLOYEES.LAST_NAME%TYPE;


cursor c_employees is
select 
      emp.employee_id,
      emp.first_name,
      emp.last_name,
      emp.email,
      emp.phone_number,
      emp.hire_date,
      emp.job_id,
      j.job_title,
      j.min_salary,
      j.max_salary,
      emp.salary,
      emp.commission_pct,
      emp.manager_id,
      emp.department_id,
      dept.department_name,
      dept.location_id,
      loc.street_address,
      loc.postal_code,
      loc.city,
      loc.state_province,
      loc.country_id,
      ctry.country_name,
      ctry.region_id,
      regi.region_name,
      mgr.first_name mgr_first_name,
      mgr.last_name mgr_last_name

from 
         employees emp,
         departments dept,
         locations loc,
         countries ctry,
         regions regi,
         jobs j,
         employees mgr
         
   where emp.department_id = dept.department_id(+)
   and dept.location_id =loc.location_id(+)
   and loc.country_id = ctry.country_id(+)
   and ctry.region_id = regi.region_id(+)
   and emp.manager_id = mgr.employee_id(+)
   and emp.job_id = j.job_id(+)




BEGIN
/*SELECT EMP.EMPLOYEE_ID , EMP.LAST_NAME ,EMP.EMAIL , EMP.PHONE_NUMBER ,
 EMP.HIRE_DATE , EMP.JOB_ID , J.JOB_TITLE , J.MIN_SALARY , J.MAX_SALARY ,
 EMP.SALARY , EMP.COMMISSION_PCT , EMP.MANAGER_ID , EMP.DEPARTMENT_ID ,
 DEPT.DEPARTMENT_NAME , DEPT.LOCATION_ID , LOC.STREET_ADDRESS , LOC.POSTAL_CODE ,
 LOC.CITY , LOC.STATE_PROVINCE , LOC.COUNTRY_ID , CTRY.COUNTRY_NAME ,
 CTRY.REGION_ID , REGI.REGION_NAME , MGR.FIRST_NAME , MGR.LAST_NAME

INTO L_EMPLOYEE_ID ,L_LAST_NAME,L_EMP_MAIL,L_PHONE,L_HIRE,L_JOB_ID,L_JOB_TITLE,L_MIN_SALARY,
L_MAX_SALARY,L_SALARY,L_SALARY_COMMISION,L_MAN_ID,L_DEPT_ID,L_DEPT_NAME,L_LOC_ID,L_STREET,L_POSTAL,L_CITY,
L_STATE , L_COUNTRY_ID , L_COUNTRY_NAME , L_REGION_ID , L_REGION_NAME , L_MANAGER_FNAME , L_MANAGER_LNAME

FROM EMPLOYEES EMP,DEPARTMENTS DEPT,LOCATIONS LOC,COUNTRIES CTRY,REGIONS REGI,JOBS J,EMPLOYEES MGR

where emp.department_id= dept.department_id
and dept.location_id=loc.location_id
and loc.country_id= ctry.country_id
and ctry.region_id= regi.region_id
AND EMP.MANAGER_ID= MGR.EMPLOYEE_ID
AND EMP.JOB_ID=J.JOB_ID 
AND EMP.EMPLOYEE_ID=101;
*/

for emprec in c_employees loop
L_EMPLOYEE_ID  := emprec.employee_id;
L_LAST_NAME := emprec.last_name;

DBMS_OUTPUT.PUT_LINE( L_EMPLOYEE_ID || ' | ' ||L_LAST_NAME);
-- || ' | ' || L_EMP_MAIL|| ' | ' ||L_PHONE|| ' | ' ||L_HIRE|| ' | ' ||L_JOB_ID|| ' | ' ||L_JOB_TITLE|| ' ' ||L_MIN_SALARY|| ' ' ||L_MAX_SALARY|| ' ' ||L_SALARY || ' ' ||L_SALARY_COMMISION|| ' ' ||L_MAN_ID|| ' ' ||L_DEPT_ID|| ' ' ||L_DEPT_NAME|| ' ' ||L_LOC_ID|| ' ' ||L_STREET|| ' ' ||L_POSTAL|| ' ' ||L_CITY|| ' ' ||L_STATE|| ' ' ||L_COUNTRY_ID|| ' ' ||L_COUNTRY_NAME|| ' ' ||L_REGION_ID|| ' ' ||L_REGION_NAME|| ' ' ||L_MANAGER_FNAME|| ' ' ||L_MANAGER_LNAME);
END;  



---- CORRECTED SYNTAX------------

set serveroutput on
DECLARE


L_EMPLOYEE_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
L_LAST_NAME EMPLOYEES.LAST_NAME%TYPE;
L_EMP_MAIL EMPLOYEES.EMAIL%TYPE;
L_PHONE EMPLOYEES.PHONE_NUMBER%TYPE;
L_HIRE EMPLOYEES.HIRE_DATE%TYPE;
L_JOB_ID EMPLOYEES.JOB_ID%TYPE;
L_JOB_TITLE JOBS.JOB_TITLE%TYPE;
L_MIN_SALARY JOBS.MIN_SALARY%TYPE;
L_MAX_SALARY JOBS.MAX_SALARY%TYPE;
L_SALARY EMPLOYEES.SALARY%TYPE;
L_SALARY_COMMISION EMPLOYEES.COMMISSION_PCT%TYPE;
L_MAN_ID EMPLOYEES.MANAGER_ID%TYPE;
L_DEPT_ID EMPLOYEES.DEPARTMENT_ID%TYPE;
L_DEPT_NAME DEPARTMENTS.DEPARTMENT_NAME%TYPE;
L_LOC_ID DEPARTMENTS.LOCATION_ID%TYPE;
L_STREET LOCATIONS.STREET_ADDRESS%TYPE;
L_POSTAL LOCATIONS.POSTAL_CODE%TYPE;
L_CITY LOCATIONS.CITY%TYPE;
L_STATE LOCATIONS.STATE_PROVINCE%TYPE;
L_COUNTRY_ID LOCATIONS.COUNTRY_ID%TYPE;
L_COUNTRY_NAME COUNTRIES.COUNTRY_NAME%TYPE;
L_REGION_ID COUNTRIES.REGION_ID%TYPE;
L_REGION_NAME REGIONS.REGION_NAME%TYPE;
L_MANAGER_FNAME EMPLOYEES.FIRST_NAME%TYPE;
L_MANAGER_LNAME EMPLOYEES.LAST_NAME%TYPE;
cursor c_employees is
select 
      emp.employee_id,
      emp.first_name,
      emp.last_name,
      emp.email,
      emp.phone_number,
      emp.hire_date,
      emp.job_id,
      j.job_title,
      j.min_salary,
      j.max_salary,
      emp.salary,
      emp.commission_pct,
      emp.manager_id,
      emp.department_id,
      dept.department_name,
      dept.location_id,
      loc.street_address,
      loc.postal_code,
      loc.city,
      loc.state_province,
      loc.country_id,
      ctry.country_name,
      ctry.region_id,
      regi.region_name,
      mgr.first_name mgr_first_name,
      mgr.last_name mgr_last_name

from 
         employees emp,
         departments dept,
         locations loc,
         countries ctry,
         regions regi,
         jobs j,
         employees mgr
         
   where emp.department_id = dept.department_id(+)
   and dept.location_id =loc.location_id(+)
   and loc.country_id = ctry.country_id(+)
   and ctry.region_id = regi.region_id(+)
   and emp.manager_id = mgr.employee_id(+)
   and emp.job_id = j.job_id(+);

BEGIN
/*SELECT EMP.EMPLOYEE_ID , EMP.LAST_NAME ,EMP.EMAIL , EMP.PHONE_NUMBER ,
 EMP.HIRE_DATE , EMP.JOB_ID , J.JOB_TITLE , J.MIN_SALARY , J.MAX_SALARY ,
 EMP.SALARY , EMP.COMMISSION_PCT , EMP.MANAGER_ID , EMP.DEPARTMENT_ID ,
 DEPT.DEPARTMENT_NAME , DEPT.LOCATION_ID , LOC.STREET_ADDRESS , LOC.POSTAL_CODE ,
 LOC.CITY , LOC.STATE_PROVINCE , LOC.COUNTRY_ID , CTRY.COUNTRY_NAME ,
 CTRY.REGION_ID , REGI.REGION_NAME , MGR.FIRST_NAME , MGR.LAST_NAME

INTO L_EMPLOYEE_ID ,L_LAST_NAME,L_EMP_MAIL,L_PHONE,L_HIRE,L_JOB_ID,L_JOB_TITLE,L_MIN_SALARY,
L_MAX_SALARY,L_SALARY,L_SALARY_COMMISION,L_MAN_ID,L_DEPT_ID,L_DEPT_NAME,L_LOC_ID,L_STREET,L_POSTAL,L_CITY,
L_STATE , L_COUNTRY_ID , L_COUNTRY_NAME , L_REGION_ID , L_REGION_NAME , L_MANAGER_FNAME , L_MANAGER_LNAME

FROM EMPLOYEES EMP,DEPARTMENTS DEPT,LOCATIONS LOC,COUNTRIES CTRY,REGIONS REGI,JOBS J,EMPLOYEES MGR

where emp.department_id= dept.department_id
and dept.location_id=loc.location_id
and loc.country_id= ctry.country_id
and ctry.region_id= regi.region_id
AND EMP.MANAGER_ID= MGR.EMPLOYEE_ID
AND EMP.JOB_ID=J.JOB_ID 
AND EMP.EMPLOYEE_ID=101;
*/

for emprec in c_employees loop
L_EMPLOYEE_ID := emprec.EMPLOYEE_ID;
L_LAST_NAME := emprec.LAST_NAME;
L_EMP_MAIL := emprec.email;



DBMS_OUTPUT.PUT_LINE( L_EMPLOYEE_ID || ' | ' ||L_LAST_NAME  || ' | ' || L_EMP_MAIL|| ' | ' ||L_PHONE|| ' | ' ||L_HIRE|| ' | ' ||L_JOB_ID|| ' | ' ||L_JOB_TITLE|| ' ' ||L_MIN_SALARY|| ' ' ||L_MAX_SALARY|| ' ' ||L_SALARY || ' ' ||L_SALARY_COMMISION|| ' ' ||L_MAN_ID|| ' ' ||L_DEPT_ID|| ' ' ||L_DEPT_NAME|| ' ' ||L_LOC_ID|| ' ' ||L_STREET|| ' ' ||L_POSTAL|| ' ' ||L_CITY|| ' ' ||L_STATE|| ' ' ||L_COUNTRY_ID|| ' ' ||L_COUNTRY_NAME|| ' ' ||L_REGION_ID|| ' ' ||L_REGION_NAME|| ' ' ||L_MANAGER_FNAME|| ' ' ||L_MANAGER_LNAME);
end loop;
END;  
