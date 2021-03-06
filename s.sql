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
  end;
	--when others then
	--v_ErrorMesg	:= sqlerrm ;
	--dbms_output.put_line(v_ErrorMesg);
	--end;

end;