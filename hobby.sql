use employee;
create table hobby
(
id int unsigned not null unique auto_increment primary key,
name varchar(45) not null
);
insert into hobby values 
(1,"Running"),
(2,"Singing"),
(3,"Blogging"),
(4,"Listening to music"),
(5,"Gaming"),
(6,"Hiking"),
(7,"Yoga"),
(8,"Cooking"),
(9,"Traveling"),
(10,"Writing");
select * from hobby;
update hobby set name = "Movies" where id = 3;
delete from hobby where name = "writing";
truncate table hobby;