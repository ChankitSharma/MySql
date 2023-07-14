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