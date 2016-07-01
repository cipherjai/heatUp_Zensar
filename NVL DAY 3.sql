SELECT last_name, salary from employees where salary BETWEEN 2500 and 3500
select add_months('31-aug-2001',1) from dual;
select months_between( '01-JAN-10','01-FEB-10') from dual;
select next_day(sysdate,'tue') from dual;
select last_day('02-feb-08') from dual;


select salary, COMMISSION_PCT,
NVL(COMMISSION_PCT, 0)
+ salary
from employees


