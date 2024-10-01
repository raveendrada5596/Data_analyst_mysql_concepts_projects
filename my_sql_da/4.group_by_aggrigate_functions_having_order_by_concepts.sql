#GROUP BY: group the records in to suumary rows
use parks_and_recreation;
show tables;
select * from employee_demographics;
select * from employee_salary;
select * from parks_departments;
select gender from employee_demographics group by gender;

#AGGRIGATE FUNCTIONS: AVG, SUM, MAX, MIN, COUNT : ITS PERFORM CALCULATION OPERATIONS NEED THE DIFFERENT VALUES FOR PERFROM ACTIONS
select gender,first_name from employee_demographics group by gender,first_name;
select first_name,sum(age),count(age),max(age) from employee_demographics group by first_name having count(age)<=1;
select * from employee_salary;
select first_name,count(salary) from employee_salary group by first_name ;

#ORDER BY:  ARRANGE THE DATA IN ASCENDING ORDER: LOW TO HIGH OR DESCENDING ORDER: HIGN TO LOW
select * from employee_salary order by salary;
select first_name,count(employee_id),avg(salary),employee_id from employee_salary group by first_name,employee_id having employee_id<10 and employee_id>4 order by employee_id desc;