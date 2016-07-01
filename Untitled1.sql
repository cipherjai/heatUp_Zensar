set serveroutput on;
declare
l_employee_id number(6);
l_last_name varchar2(25);
Begin
select
employee_id,
last_name
into
l_employee_id, l_last_name from employees where employee_id = 100;
dbms_output.put_line(l_employee_id||'    '|| l_last_name);
end;


