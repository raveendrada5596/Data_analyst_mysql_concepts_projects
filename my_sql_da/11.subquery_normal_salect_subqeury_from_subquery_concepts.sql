#SUB QUERIES: USED TO GET THE DATA FROM DIFFENT TABLES
#INNER QUERY
#OUTER QUERY

use parks_and_recreation;
show tables;
select * from employee_demographics;
select * from employee_salary;
select * from parks_departments;

#NORMAL CASE
select * from employee_demographics where employee_id in (select employee_id from employee_salary where dept_id=1);

#WRITE THE QUERY ON SELECT STATEMENT
select first_name,salary,(select avg(salary) from employee_salary) as avg_sal from employee_salary;
select avg(salary) from employee_salary;

#WRITE THE SUBQUERY ON FROM STATEMENT
select gender,avg(av_age), avg(mi_age) from
(select gender,avg(age) as av_age,
min(age) as mi_age,
max(age) as ma_age, 
count(age) as co_ag from employee_demographics group by gender) as add_table group by gender;