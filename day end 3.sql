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
      mgr.first_name,
      mgr.last_name

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