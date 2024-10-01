select * from parks_and_recreation.employee_demographics;

select first_name,last_name,birth_date,age+10 new_age from parks_and_recreation.employee_demographics;
#PEMDAS
select first_name,(age+10)*10 from parks_and_recreation.employee_demographics;

select * from parks_and_recreation.parks_departments;
#Distinct
select distinct first_name,age,gender from parks_and_recreation.employee_demographics;
select distinct gender from parks_and_recreation.employee_demographics;
