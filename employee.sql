create table employee
(
	id int unsigned not null unique auto_increment primary key,
	first_name varchar(45) not null,
	last_name varchar(45) not null,
	age tinyint not null ,
	mobile_number varchar(20),
	address text
);

insert into employee values 
	(1,"Rohan","Parmar",30,8971679301,"Ahmedabad"),
	(2,"Amit","jain",22,2345678949,"Dehli"),
	(3,"Chirag","Bunker",25,9845678977,"Kota"),
	(4,"Kartik","jain",24,9878657288,"Banswara"),
	(5,"Chankit","Sharma",24,8078616571,"Banswara"),
	(6,"Ishan","Sompura",20,7756831999,"Jaipur"),
	(7,"Garvit","Gupta",26,8561714891,"Banglore"),
	(8,"Harshit","Sompura",28,8567982960,"prayagraj");
select * from employee;
update employee set mobile_number = 6378548864 where id = 2;
delete from employee where id = 3;
truncate table employee;