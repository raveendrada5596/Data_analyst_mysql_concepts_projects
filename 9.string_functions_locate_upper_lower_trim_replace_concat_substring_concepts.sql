use parks_and_recreation;
show tables;
select * from employee_demographics;
select * from employee_salary;
select * from parks_departments;
#STRING FUNCTIONS
#LOCATE
#UPPER
#LOWER
#TRIM,LTRIM,RTRIM
#SUBSTRING
#CONCAT
#REPLACE
 SELECT * FROM EMPLOYEE_DEMOGRAPHICS;
 #LOCATE
select first_name, locate("a",first_name) from employee_demographics;
#UPPER
select first_name,upper(first_name) as upperd from employee_demographics;
#LOWER
select last_name,lower(last_name) as lowered from employee_demographics;
#TRIM
select trim('   ttt     ');
select first_name,trim(first_name) from employee_demographics;
#LTRIM
select first_name,ltrim(first_name) from employee_demographics;
#RTRIM
select first_name,rtrim(first_name) from employee_demographics;
#SUBSTRING
select first_name,substring(first_name,2,4) from employee_demographics;
select birth_date,substring(birth_date,6,2) as month_of_hire from employee_demographics;
#concat
select first_name,last_name,concat(first_name,' ',last_name) as full_name from employee_demographics;
#replace
select first_name,replace(first_name,"a","tt") as replaced_ones from employee_demographics;
