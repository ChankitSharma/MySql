/* Create a separate select queries to get a hobby, employee, employee_salary, employee_hobby. */

select * from employee_hobby
inner join hobby
on employee_hobby.fk_hobby = hobby.id
inner join employee 
on employee_hobby.fk_employee = employee.id
inner join employee_salary
on employee_salary.fk_employee = employee_hobby.id;

/* Create a select single query to get all employee name, all hobby_name in single column */

SELECT name FROM hobby
UNION ALL
SELECT CONCAT(first_name,' ', last_name) FROM employee;

/* Create a select query to get  employee name, his/her employee_salary */

select employee.first_name, employee_salary.salary from employee 
inner join employee_salary
on employee_salary.fk_employee_id = employee.id;

/* Create a select query to get employee name, total salary of employee, hobby name(comma-separated - you need to use subquery for hobby name) */

SELECT
employee.first_name,
employee.last_name,
employee_salary.salary,
(
SELECT GROUP_CONCAT(distinct h.name order by h.name SEPARATOR ', ' )
FROM hobby h
INNER JOIN employee_hobby eh 
ON h.id = eh.fk_hobby
WHERE eh.fk_employee_id = employee.id
) AS Hobby_Names
FROM
employee
JOIN
employee_salary ON employee.id = employee_salary.fk_employee_id;