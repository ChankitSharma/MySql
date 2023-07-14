use employee;
create table employee_salary
(
	Id int unsigned not null unique auto_increment primary key,
    FK_of_employee int unsigned not null,
    Salary int not null,
    date DATE,
    FOREIGN KEY (FK_of_employee) REFERENCES employee(Id)
);
insert into employee_salary (Id, FK_of_employee, Salary, date) values 
(1,1,12000,'2023-5-1'),
(2,2,21500,'2023-5-1'),
(3,4,25000,'2023-5-1'),
(4,3,12000,'2023-5-1'),
(5,6,10000,'2023-5-1'),
(6,5,15000,'2023-5-1'),
(7,8,20000,'2023-5-1'),
(8,7,18000,'2023-5-1');
select * from employee_salary;
update employee_salary set Salary = 28000 where id = 7;
delete from employee_salary where  id = 4;
truncate table employee_salary;