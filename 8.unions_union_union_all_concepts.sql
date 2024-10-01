use parks_and_recreation;
show tables;
select * from employee_demographics;
select * from employee_salary;
select * from parks_departments;

# union : combine the rows 
#UNION: give the unique data and  UNION All: give the total data all of both tables

select * from employee_demographics union select * from employee_salary;
select * from employee_demographics union all select * from employee_salary;

# distinct + union combination
select * from employee_demographics union distinct select * from employee_salary;
select distinct*from employee_demographics union all  select distinct* from employee_salary;

select first_name,last_name from employee_demographics union distinct select first_name,last_name from employee_salary;

#find oler and hgh paying employees

#select * from employee_demographics as demo join employee_demographics demo1 on demo.employee_id=demo1.employee_id;  

select first_name,last_name,age, "youngman" as label from employee_demographics where age>25 and age<35 and gender="Male" 
Union select first_name,last_name,age, "younggirl" as label from employee_demographics where age>25 and age<35 
union select first_name,last_name,salary, "high paying candicates" as label from employee_salary where salary>70000 order by first_name,last_name,age;

select first_name,age, "oldman" as lable from employee_demographics where age>40 and gender="Male" union
select first_name,age, "oldlady" as lable from employee_demographics where age>40 and gender="Female" union
select first_name,salary, "less paids" as lable from employee_salary where salary<40000 order by first_name;









