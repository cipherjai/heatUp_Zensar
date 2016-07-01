

create table sales
	(
		product varchar2(20),
		month VARCHAR(20),
		amount NUMBER(20)
	);

	INSERT INTO sales VALUES('SONY','01-JAN-14',45000);
	INSERT INTO sales VALUES('LG','19-FEB-15',78000);
	INSERT INTO sales VALUES('MI','01-MAY-10',23000);

	select * from sales;

create table sales_history
	(
		product varchar2(20),
		month varchar2(20),
		amount number(20)
	);

	INSERT INTO sales_history VALUES('SONY','15-JAN-16',45000);
	
	INSERT INTO sales_history VALUES('MI','01-MAY-10',23000);

	select * from sales_history;



	merge into sales_history sh using(select product, month, amount from sales)s
	on(s.product=sh.product)
	when matched then update set sh.month = s.month, sh.amount = s.amount
	when not matched then insert ( sh.product, sh.month, sh.amount)
	values(s.product, s.month, s.amount);


/* DECODE :::: use for conditional statements */
	select last_name, job_id, salary,
		DECODE (job_id, 'AC_ACCOUNT', 1.10 * salary,
				'AC_MGR', 1.15 * salary,  
				'AD_ASST', 1.20 * salary,
				salary) REVISED_SALARY from employees;




create table test
(
	status varchar2(2)
);
insert into test values('y');
insert into test values('y');
	insert into test values('n');
		insert into test values('y');insert into test values('n');insert into test values('n');insert into test values('n');
			insert into test values('y');

				SELECT status,
				DECODE(status, 'y', 'PAID',
								'n', 'UNPAID') from test;



select LAST_NAME, JOB_ID,SALARY,
(CASE
WHEN JOB_ID LIKE 'SA_MAN' AND SALARY < 10000 THEN '10%')













  
				select last_name, job_id, salary(
					when job_id like 
					)

create table PRODUCTS
(
  PRODUCT_ID number(5) constraint PRODUCTS_PRDCTID_PK primary key,
  PRODUCT_NAME varchar2(20),
  PRODUCT_PRICE number(8,2)
)
insert into PRODUCTS values('23445', 'HP', ' 4449');
insert into PRODUCTS values('23423', 'HP', ' 4449');
insert into PRODUCTS values('23445', 'HP', ' 4449');
insert into PRODUCTS values('23423', 'HP', ' 4449');
insert into PRODUCTS values('23445', 'HP', ' 4449');
insert into PRODUCTS values('23442', 'HP', ' 4449');
insert into PRODUCTS values('23467', 'HP', ' 4449');
insert into PRODUCTS values('23421', 'HP', ' 4449');	

select PRODUCT_ID
from PRODUCTS
group by product
having count (* ) >1;





