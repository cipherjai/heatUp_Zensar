select to_char(sysdate, '12-07-1994', 'dd/mm/yy') from dual;// 
/* sysdate is a pseudocolumn, can be used only to covert to characer , it takes the date from the automatic system */
select to_date('12/09/09', 'dd-mm-yy')from dual;
/*we need this just change the format.TO PUT IN THE SPECIFIED DATE WHICH IS CUSTOM



/*BETWEEN OPERATOR*/

-- USe to range and chose between two values(upper and lower)

SELECT last_name, salary from employees where salary BETWEEN 2500 and 3500
--____ _ _ __ _ _ _ _ _ _ _ _ _ _ _ _ __ _ _ _ _ __ _ _ _ _ __ _ _ _ _ _

select add_month('31-aug-2001',1) from dual;
select months_between('01-JAN-11', '09-jan-10') from dual;

-- between is used for difference


select next_day(sysdate,'tue') from dual;


select last_day('02-feb-08') from dual;


--NVL

-- Where there are nulls we are replacing with zero .. reason: to get a value as something .. 
-- where there are nuls , if we add or operate on nulls , we'll get nothing.
--NULL

select salary, COMMISSION_PCT,
NVL(COMMISSION_PCT, 0)
+ salary
from employees


-- LENGTH 
/* where to use 
To check and increase --------further
*/

select length('HELLO WORLD') from dual;
-- then we increase if the digits doesn't fits in real projects


-- JOIN -- 
/* whenever we need DATA from MORE THAN ONE TABLE

/* EQUIJOIN-- SIMPLE JOIN-- INNER JOIN 


supplier_id		supplier_name
10000			IBM
10001			Hewlett Packard
10002			Microsoft
10003			NVIDIA



order_id		supplier_id			order_date
500125			10000				2003/05/12
500126			10001				2003/05/13
500127			10004				2003/05/14


-- common column in both the table 
--1> matched rows of both data is displayed
-- PRACTICAL PROBLEM -- 
we dont have a common coloumn in real projects .. 
so how do we write joins


we use joins by VIEWS

VIEW SCRIPT- -> OPEN THE JOIN SCRIPT -- THEN WRITE JOINS.. COMMON  are not there.

LEFT-- EQUI - JOINS + REAMAINING LEFT DATA WILL COME TO DATA ON RIGHT

RIGHT - EQUI - JOINS + REAMAINING right DATA WILL COME TO DATA ON RIGHT EXCEPT THE COMMON 

FULL - ALL THE RECORDS FROM BOTH THE TABLE COMMON COLUMN + EQUI-JOINS


interview prospective:
> tell ABOUT ORACLE 9(I) JOINS.. 
> TELL ABOUT LATEST JOINS
> ISO JOINS


tell about URSELF-- about ur projects>>>>> doing work, positivity to learn in less time, confidence, 


______________________________________________________________________
* LATEST JOINS*

> USING CLAUSE 
> ON CLAUSE 
> LEFT OUTER JOINS
> RIGHT OUTER JOINS
> FULL OUTER JOINS

USING CLAUSE >> can be used with ur EQUI JOINS AND OUTER JOINS
not using equijoin clause in projects

ON --------- CLAUSE

using 'on' in place of 'where'

------ LEFT OUTER JOIN ----- (+) 
removed the + and usning "left outer join" 
not used in project

Left outer join:  Oracle8i

select
   last_name,
   department_name
from
   employees e,
   departments d
where
   e.department_id = d.department_id(+);
Left outer join:  Oracle9i and beyond

select
   last_name,
   department_name
from
   employees e
left outer join
   departments d
on
   e.department_id = d.department_id;
--USed earlier with + but now directly writing

   --------------------------------------------------------------------------------------------------


   N-1  ( n= no of tables)
suppose there are 8 tables .. so here N-1 ... there will be 8-1 ie 7 Joins..
so we need to count the where condition
whwere employees department_id = department. department_id
and employee.employees_id=100


Check your query see the output.. if in ur o/p the duplication is there... there is a mistake in tg
   in your query


Joins are faster than the sub queries! why ?
join is faster or where ...?
if data is less in tables.. then joins will be faster.. 
we create indexes per where query
--------------------------------------------------------------




SELF JOINS***********


Taking the copy of the tble 
we dont write the common column of the table !

practice in staff table!





*/



select employee_id, last_name, manager_id from employees


select worker.last_name || 'works for' || manager.last_name
FROM employees worker, employees manager
WHERE worker.manager_id = manager.employee_id;

--- staff
/*
employee_id
first_name
last_name
email
 phone_number
 hire_date
 job_id
 job_title
 min_salary
 max_salary
 salary
 commission_pct
 manager_id
 department_id
 department_name
 location_id
 street_address
 postal_code
 city
 state_province
 country_id
 country_name
 region_id
 region_name
 mgr_first_name
 mgr_last_name
employees coubntries regions locations jobs department */

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




-- *** LEVEL *** --
/* wHENEVER WE WANT A HEIRARCHY IN THE DISPLAY WE USE levels

*/

SELECT  * from staff;
select staff_name "employee",
level sys_connect_by_path(staff_name, ' / ') "path"
from staff
where level <=5
staff with staff_name = 'Pushpal Kapadia'
connect by prior staff_id = manager_id and level <= 6;


--
/* rdf report definition file

EXPLAIN PLAN :: WHEN to an not ot create indexes?
>> Select query .. right click .. EXECUTE EXPLAIN PLAN 
Full table scan.. searching from entire record 
See whether there are any full table scan ! if at all.. create an index so that it takes less time 
Initially cost will be more ..after creation of index it will reduce in order to ioncrease speed of the query


*** CARE TO TAKE ****

1> left side table data should be less... and right side will be more!
2> If you are writing OR .... AND should comebefore OR 

WE DONT create index on master table.... NOT on MASTER TABLE .. only on transaction table!
If there are LIKE and < or > operator.. indexes will not work!

user_



If indexes are not there for all join conditions! 


If thesee column are primary or unique key... By default "UNIQUE INDEX " is created

*/
-- IN will take large time .. if there is a hard coded value is there ,, the IN is used .. else
-- EXIST is used !


-- NORMAL INDEX
/* WOnt allow duplicate data in column */
-- COMPOSITE INDEX
-- FUNCTIONAL INDEX -- upper(last_name) // here the index is created even after cvreating one just because we are using function



--TYPES OF JOINS 
-- 1> HASH
-- 2> SORT MERGE
-- 3> NESTED 

/* NESTED -- if left side data is less --- than the right side data .. Nested join is created 
	HASH -- Two tabkle both having huge table data.. right side data (may or may not have INDEX)...  HASH JOIN is creted
	>> CONDITION.. GROUP BY AND HAVING are not used in HASH JOIN
	
	CBO-- Cost based optimization
	RBO -- 

	SORT_MERGE can use groub by and having clause... */

	-- INDEX OPERATION
	-- 	INDEX RANGE SCAN :: DUPLICATION in column occurs
	--	INDEX UNIQUE SCAN :: creted when unique or primary key is created 
	-- 	** INDEX SKIP SCAN :: when using COMPOSITE PRIMARY KEY, it will appear


	-- IN AND EXISTS
	/* create table emp_cop_backup
as
select * from employees

insert into emp_cop_backup
select *
from emp_cop_backup

select * from emp_cop_backup
where first_name in(select first_name from emp_cop_backup
where first_name='Neena')

select * from emp_cop_backup
where exists(select first_name from emp_cop_backup
where first_name='Neena') */

-- CREATING AN INDEX

/* 

create index indx_name on table_name(col_name);

unique index
create unique index ind_name on table_name(col_name);

Composite index
create index ind_name on table_name(col_name,col_name);


Function based index
   create index x on employees(upper(last_name));
	*/

-- UNIQUE INDEX

/* 
 When we create primary key or unique key buy default
 a unique index is created

  Drop table first_pay_dept
    
   CREATE TABLE first_pay_dept
   (jobcode      CHAR(2) CONSTRAINT prim_key_first_pay_dept PRIMARY KEY,
   jobname      VARCHAR2(20) CONSTRAINT jobname_uk UNIQUE,
   joblevel     VARCHAR2(5) CONSTRAINT joblevel_nn NOT NULL,
   SALARY NUMBER(5) CONSTRAINT FIRST_SAL_CHK CHECK(SALARY > = 1000));
   
   select * from user_indexes where table_name='FIRST_PAY_DEPT'   
   select * from user_ind_columns where table_name='FIRST_PAY_DEPT'
*/