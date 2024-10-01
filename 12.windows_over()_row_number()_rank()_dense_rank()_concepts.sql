use parks_and_recreation;
show tables;
select * from employee_demographics;
select * from employee_salary;
select * from parks_departments;

#WINDOWS FUNCTIONS
#ITS GIVE THE DATA ROW WISE MEAN EVERY RECORD IT SHOW DULICATE ALSO

#depend upon the seleect and joins concept 
#replace of group by

#GROUP BY USED 
select demo.gender,avg(salary) from employee_demographics as demo 
join employee_salary as sal on demO.employee_id=sal.employee_id group by gender; 

#WINDOWS FUNCTIONS USE : OVER()
select demo.gender,avg(salary) over() from employee_demographics as demo 
join employee_salary as sal on demo.employee_id=sal.employee_id;

#OVER(PARTITION BY) USED
select demo.gender,avg(salary) over(PARTITION BY gender) 
from employee_demographics as demo join employee_salary as sal on demO.employee_id=sal.employee_id;

#OVER(PARTITION BY +ORDER BY)
select demo.first_name,demo.last_name,demo.gender,sal.salary,sum(salary) 
over(PARTITION BY gender order by demo.employee_id) 
AS new_on from employee_demographics as demo join employee_salary as sal on demo.employee_id=sal.employee_id;

#row_number()
select demo.first_name,demo.gender,salary, ROW_NUMBER() over() as ro_ov from employee_demographics as demo join
 employee_salary as sal on demO.employee_id=sal.employee_id;
 
 select demo.first_name,demo.gender,salary, ROW_NUMBER() over(partition by gender order by salary desc) as ro_ov
 from employee_demographics as demo join
 employee_salary as sal on demO.employee_id=sal.employee_id;
 
#rank()
select demo.first_name,demo.gender,salary, ROW_NUMBER() over(partition by gender order by salary ) as ro_ov,
rank() over(partition by gender order by salary ) as rank_ov from employee_demographics as demo join
 employee_salary as sal on demO.employee_id=sal.employee_id;
 
#DENSE_RANK()
select demo.first_name,demo.gender,salary, ROW_NUMBER() over(partition by gender order by salary ) as ro_ov,
rank() over(partition by gender order by salary ) as rank_ov,
dense_rank() over(partition by gender order by salary) as den_ra from employee_demographics as demo join
 employee_salary as sal on demO.employee_id=sal.employee_id;