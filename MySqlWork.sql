/* Create an “employee” database and 4 tables (hobby, employee, employee_salary, employee_hobby). */
create table hobby
(
	id int unsigned not null unique auto_increment primary key,
	name varchar(45) not null
);

create table employee
(
	id int unsigned not null unique auto_increment primary key,
	first_name varchar(45) not null,
	last_name varchar(45) not null,
	age tinyint not null ,
	mobile_number varchar(20),
	address text
);

create table employee_salary
(
	id int unsigned not null unique auto_increment primary key,
	fk_employee_id int unsigned not null,
	salary int not null,
	date DATE,
	foreign key (fk_employee_id) references employee(id)
);

create table employee_hobby 
(
	id int unsigned not null unique auto_increment primary key,
	fk_employee_id int unsigned not null,
	fk_hobby_id int unsigned not null,
	foreign key (fk_employee_id) references employee(id),
	foreign key (fk_hobby_id) references employee(id)
);
    
/* Insert multiple data in all tables */

/* hobby table */
insert into hobby values 
	(1,"Running"),
	(2,"Singing"),
	(3,"Movies"),
	(4,"Listening to music"),
	(5,"Gaming"),
	(6,"Hiking"),
	(7,"Yoga"),
	(8,"Cooking"),
	(9,"Traveling"),
	(10,"Writing");
    
/* employee table */
insert into employee values 
	(1,"Rohan","Parmar",30,8971679301,"Ahmedabad"),
	(2,"Amit","jain",22,2345678949,"Dehli"),
	(3,"Chirag","Bunker",25,9845678977,"Kota"),
	(4,"Kartik","jain",24,9878657288,"Banswara"),
	(5,"Chankit","Sharma",24,8078616571,"Banswara"),
	(6,"Ishan","Sompura",20,7756831999,"Jaipur"),
	(7,"Garvit","Gupta",26,8561714891,"Banglore"),
	(8,"Harshit","Sompura",28,8567982960,"prayagraj");
    
/* employee_salary table*/
insert into employee_salary (fk_employee_id, salary, date) values 
	(1,12000,'2023-5-1'),
	(2,21500,'2023-5-1'),
	(4,25000,'2023-5-1'),
	(3,14000,'2023-5-1'),
	(6,10000,'2023-5-1'),
	(5,15000,'2023-5-1'),
	(8,20000,'2023-5-1'),
	(7,18000,'2023-5-1');
    
/* employee_hobby table*/
insert into employee_hobby (fk_employee_id, fk_hobby_id) values 
	(1,3),
	(1,1),
	(2,2),
	(2,1),
	(3,5),
	(1,2),
	(1,4),
	(1,5);
    
/* Update data of all tables */
update hobby set name = "Movies" where id = 3;
update employee set mobile_number = 6378548864 where id = 2;
update employee_salary set salary = 28000 where id = 7;
update employee_hobby set fk_employee_id = 5 where id = 5;

/* Delete data of all tables */
delete from hobby where name = "writing";
delete from employee where id = 3;
delete from employee_salary where  id = 4;
delete from employee_hobby where id = 3;

/* Truncate data of all tables */
truncate table hobby;
truncate table employee;
truncate table employee_salary;
truncate table employee_hobby;

/* Create a separate select queries to get a hobby, employee, employee_salary, employee_hobby. */
select * from hobby;
select * from employee;
select * from employee_salary;
select * from employee_hobby;
    
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
	e.first_name, 
	es.salary
from 
	employee e
	inner join employee_salary es on es.fk_employee_id = e.id;

/* Create a select query to get employee name, total salary of employee, hobby name(comma-separated - you need to use subquery for hobby name) */

select
	e.first_name, 
	e.last_name, 
	sum(es.salary) as salary, 
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
      eh.fk_employee_id = e.id
  ) as Hobby_Names 
from 
  employee e
  join employee_salary es on e.id = es.fk_employee_id
  group by e.id;