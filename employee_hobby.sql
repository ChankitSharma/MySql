use employee;
create table employee_hobby 
(
	id int unsigned not null unique auto_increment primary key,
    fk_employee int unsigned not null,
    fk_hobby int unsigned not null,
	FOREIGN KEY (fk_of_employee) REFERENCES employee(Id),
    FOREIGN KEY (fk_hobby) REFERENCES employee(id)
);
insert into employee_hobby (fk_of_employee, fk_hobby) values 
(1,3),
(1,1),
(2,2),
(2,1),
(3,5);
select * from employee_hobby;
update employee_hobby set fk_of_employee = 4 where id = 5;
delete from employee_hobby where id = 3;
truncate table employee_hobby;

/* Create a separate select queries to get a hobby, employee, employee_salary, employee_hobby. */
	select * from employee_hobby
	inner join hobby
	on employee_hobby.fk_hobby = hobby.id
	inner join employee 
	on employee_hobby.fk_of_employee = employee.id
	inner join employee_salary
	on employee_salary.FK_of_employee = employee_hobby.id;
    
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
  
 