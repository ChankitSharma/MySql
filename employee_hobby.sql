create table employee_hobby 
(
	id int unsigned not null unique auto_increment primary key,
	fk_employee_id int unsigned not null,
	fk_hobby_id int unsigned not null,
	foreign key (fk_employee_id) references employee(id),
	foreign key (fk_hobby_id) references employee(id)
);

insert into employee_hobby (fk_employee_id, fk_hobby_id) values 
	(1,3),
	(1,1),
	(2,2),
	(2,1),
	(3,5),
	(1,2),
	(1,4),
	(1,5);

select * from employee_hobby;
update employee_hobby set fk_employee_id = 5 where id = 5;
delete from employee_hobby where id = 3;
truncate table employee_hobby;