use parks_and_recreation;
show tables;
select * from employee_demographics;
select * from employee_salary;
select * from parks_departments;

#TEMPORARY TABLES : USE  TO STORE THE TEMPORARY DATA 
				    # its avaliable for that session only

#new one create 
create temporary table temp1
(first_name varchar(50),
last_name varchar(50),
movie_liked varchar(50));

select * from temp1;
insert into temp1(first_name,last_name,movie_liked) values("sam","srann","pillajaminddar");

#take data from the other table
create temporary table birth_date_more_1980
(select * from employee_demographics where birth_date>"1980-01-01");

select * from  birth_date_more_1980;
drop table birth_date_more_1995;