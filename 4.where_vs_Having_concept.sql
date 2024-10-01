use parks_and_recreation;
show tables;
select * from employee_demographics;
select * from employee_salary;
select * from parks_departments;

#WHERE: FILTER THE ROWS BASED ON CONDITIION 
select * from employee_demographics where first_name="Tom"; 

#HAVING: TOP OF THE GROUPED DATA IF YOU NEED TO APPLY ANY CONDITION USE HAVING 
select occupation,avg(salary) from employee_salary where occupation like "%Manager%" group by occupation having avg(salary)>50000; 
select occupation, first_name,salary from employee_salary where salary like "7%" group by occupation,first_name,salary having salary>70000;