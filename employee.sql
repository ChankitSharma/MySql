use employee;
create table employee
(
	Id int unsigned not null unique auto_increment primary key,
    First_Name varchar(45) not null,
    Last_Name varchar(45) not null,
    Age tinyint not null ,
    Mobile_Number varchar(20),
    Address text
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
update employee set Mobile_Number = 6378548864 where id = 2;
delete from employee where id = 3;
truncate table employee;