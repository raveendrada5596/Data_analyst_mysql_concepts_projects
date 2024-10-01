#JOINS: USED TO COMBINE THE TWO TABLES AND GET THE DATA FROM THEN
#INNER JOIN: COMMOM DATA IN BOTH TABLES
#OUTER JOIN: LEFT JOIN: COMMON DATA +LEFT TABLE HAVING ALL DATA, RIGHT JOIN: COMMON DATA+ RIGHT TABLE HAVING ALL DATA
#SELF JOIN: TABLE CONNETING WITH SAME TABLE
use parks_and_recreation;
show tables;
select * from employee_demographics;
select * from employee_salary;
select * from parks_departments;
#inner join
select * from employee_demographics AS demo inner join employee_salary AS sal on demo.employee_id=SAL.employee_id;
select * from employee_salary AS sal inner join parks_departments AS pa on sal.employee_id=pa.department_id;
select demo.first_name,age from employee_demographics AS demo inner join employee_salary AS sal on demo.employee_id=SAL.employee_id;

#outer join: left join+ roght join
select department_name,occupation from parks_departments as pa left join employee_salary as sal on pa.department_id=sal.employee_id;
select * from parks_departments as pa left join employee_salary as sal on pa.department_id=sal.employee_id;
#right join
select * from parks_departments as pa right join employee_salary as sal on pa.department_id=sal.employee_id;

#self join
select * from employee_salary AS e1 join employee_salary as e2 on e1.employee_id=e2.employee_id;
select e1.first_name as e1_fi,e2.last_name as e2_la from employee_salary AS e1 join employee_salary as e2 on e1.employee_id=e2.employee_id;

#three table joins 
select demo1.first_name,age from employee_demographics as demo1 inner join 
employee_salary as sal1 on demo1.employee_id=sal1.employee_id inner join parks_departments
 as pa1 on sal1.employee_id=pa1.department_id;
 
select * from employee_demographics as e1 inner join employee_salary as s1 on e1.employee_id=s1.employee_id inner join parks_departments as p1 on s1.employee_id=p1.department_id;

