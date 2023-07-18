create table employee_salary
(
	id int unsigned not null unique auto_increment primary key,
	fk_employee_id int unsigned not null,
	salary int not null,
	date DATE,
	foreign key (fk_employee_id) references employee(id)
);

insert into employee_salary (fk_employee_id, salary, date) values 
	(1,12000,'2023-5-1'),
	(2,21500,'2023-5-1'),
	(4,25000,'2023-5-1'),
	(3,14000,'2023-5-1'),
	(6,10000,'2023-5-1'),
	(5,15000,'2023-5-1'),
	(8,20000,'2023-5-1'),
	(7,18000,'2023-5-1');
    
select * from employee_salary;
update employee_salary set salary = 28000 where id = 7;
delete from employee_salary where  id = 4;
truncate table employee_salary;