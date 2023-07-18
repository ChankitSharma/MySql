/* Create a separate select queries to get a hobby, employee, employee_salary, employee_hobby. */

select
  * 
from
  employee_hobby 
  inner join hobby on employee_hobby.fk_hobby_id = hobby.id 
  inner join employee on employee_hobby.fk_employee_id = employee.id 
  inner join employee_salary on employee_salary.fk_employee_id = employee_hobby.id;

/* Create a select single query to get all employee name, all hobby_name in single column */

select 
  name 
from 
  hobby 
UNION ALL 
select 
  CONCAT(first_name, ' ', last_name) 
from 
  employee;

/* Create a select query to get  employee name, his/her employee_salary */

select 
	employee.first_name, 
	employee_salary.salary 
from 
	employee 
	inner join employee_salary on employee_salary.fk_employee_id = employee.id;

/* Create a select query to get employee name, total salary of employee, hobby name(comma-separated - you need to use subquery for hobby name) */

select
	employee.first_name, 
	employee.last_name, 
	employee_salary.salary, 
  (
    select 
      GROUP_CONCAT(
        distinct h.name 
        order by 
          h.name SEPARATOR ', '
      ) 
    from 
      hobby h 
      inner join employee_hobby eh on h.id = eh.fk_hobby_id 
    where 
      eh.fk_employee_id = employee.id
  ) as Hobby_Names 
from 
  employee 
  join employee_salary on employee.id = employee_salary.fk_employee_id;