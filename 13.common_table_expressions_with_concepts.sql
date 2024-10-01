use parks_and_recreation;
show tables;
select * from employee_demographics;
select * from employee_salary;
select * from parks_departments;

#commom table expressions: its create the right below of cte and call/use its fine but after that its not okay

#normal case
select gender,avg(salary) as avg_sal,min(salary) as min_sal,max(salary) as max_sal,count(salary) as cou_sal 
from employee_demographics as demo join employee_salary as sal on demo.employee_id=sal.employee_id group by gender;

#CTE example 
with cte_example as 
(select gender,avg(salary) as avg_sal,min(salary) as min_sal,
max(salary) as max_sal,count(salary) as cou_sal 
from employee_demographics as demo join 
employee_salary as sal on demo.employee_id=sal.employee_id group by gender)
select * from cte_example;

with cte_example as 
(select gender,avg(salary) as avg_sal,min(salary) as min_sal,
max(salary) as max_sal,count(salary) as cou_sal 
from employee_demographics as demo join 
employee_salary as sal on demo.employee_id=sal.employee_id group by gender)
select avg(avg_sal) from cte_example;

#without cte
select avg(avg_sal) from 
(select gender,avg(salary) as avg_sal,min(salary) as min_sal,
max(salary) as max_sal,count(salary) as cou_sal 
from employee_demographics as demo join 
employee_salary as sal on demo.employee_id=sal.employee_id group by gender)
example_subquery;   #example_subquery is own aliasiyas  its need it to get result

#error of cte 
with cte_example as 
(select gender,avg(salary) as avg_sal,min(salary) as min_sal,
max(salary) as max_sal,count(salary) as cou_sal 
from employee_demographics as demo join 
employee_salary as sal on demo.employee_id=sal.employee_id group by gender)
select * from cte_example;   # its give the out put not a problem

select * from cte_example ; # its give error of CTE_EXAMPLE IS NOT EXIST IN DB ERROR SHOWS 
#CTE_EXAMPLE IS NOT A TABLE/VIEW/TEMP TABLE ALSO 

#DOUBLE CTE
with cte_example as 
(select gender,employee_id,birth_date
from employee_demographics as demo where birth_date>'1985_01_01'
),
cte_example2 as
(
select employee_id,salary from employee_salary as sal where salary>50000)
select * from cte_example as c1 join cte_example2 as c2 on c1.employee_id=c2.employee_id;




