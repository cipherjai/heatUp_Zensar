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

-- here use cursor








