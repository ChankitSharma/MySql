/* Create a select single query to get all employee name, all hobby_name in single column */

SELECT name FROM hobby
UNION ALL
SELECT CONCAT(First_Name,' ', Last_Name) FROM employee;

/* Create a select query to get  employee name, his/her employee_salary */

select employee.First_Name, employee_salary.salary from employee 
inner join employee_salary
on employee_salary.FK_of_employee = employee.id;

/* Create a select query to get employee name, total salary of employee, hobby name(comma-separated - you need to use subquery for hobby name) */

SELECT
employee.First_Name,
employee.Last_Name,
employee_salary.Salary,
(
SELECT GROUP_CONCAT(distinct h.name order by h.name SEPARATOR ', ' )
FROM hobby h
INNER JOIN employee_hobby eh 
ON h.id = eh.fk_hobby
WHERE eh.fk_of_employee = employee.Id
) AS Hobby_Names
FROM
employee
JOIN
employee_salary ON employee.Id = employee_salary.FK_of_employee;