#LIMIT: USE TO SET THE LIMIT HOW MANY RESULTS ON THE CONSOLE
select * from employee_demographics limit 3;
select * from employee_demographics order by birth_date desc limit 3;
#LIMIT CONTROL
select * from employee_demographics order by birth_date desc limit 3,1;
select * from employee_demographics order by birth_date desc limit 3,2;
select * from employee_demographics limit 2,1;
#limit 4,3 : MEAN ITS STARTS 4TH ROW AND 3 MEAN ITS GIVE 3 ROWS AFTER 4TH ROW
select * from employee_demographics;
select * from employee_demographics limit 4,3;

#ALIASING: CHANGE THE NAME IN THE RUN TIME/ SHORTER NAME OF THE COLUMN
select first_name,avg(age) as ave_age from employee_demographics group by first_name having avg(age)>40;





