use parks_and_recreation;
show tables;
select * from employee_demographics;
select * from employee_salary;
select * from parks_departments;
delete from employee_demographics where employee_id=13;
insert into employee_demographics values(13,"sam","srann",61,"Male","1998-12-17");
commit;
select age from employee_demographics where age>50;
select (age*10)+10 as added,first_name from employee_demographics;

select distinct gender from employee_demographics;
select distinct age from employee_demographics order by age ;

select employee_id,gender from employee_demographics where employee_id>5 group by employee_id,gender;
select * from employee_salary where salary<50000 and salary>=10000;
select * from employee_salary where salary>50000 or first_name like "d%";
select * from employee_demographics where age<50 or not gender='male';
select * from employee_demographics where birth_date like "1994%";
select first_name,age,avg(age),sum(age),min(age),max(age),count(age) from employee_demographics group by first_name,age 
having avg(age)>40 order by first_name limit 2,1;
select first_name,month(birth_date) as months from employee_demographics order by month(birth_date);
select first_name,year(birth_date) as year_num,day(birth_date) as day_num,monthname(birth_date) as mo_name from 
employee_demographics order by mo_name desc;

select occupation,salary,max(salary) from employee_salary where occupation like "%Manag%" group by occupation,salary;
#joins
select * from employee_demographics as dem inner join employee_salary as sal on dem.employee_id=sal.employee_id;
select dem.first_name,salary from employee_demographics as dem inner join
employee_salary as sal on dem.employee_id=sal.employee_id;

select * from employee_demographics as dem right join employee_salary as sal on dem.employee_id=sal.employee_id;
select * from employee_demographics as dem left join employee_salary as sal on dem.employee_id=sal.employee_id;

#i liked 
select * from employee_demographics as dem inner join employee_salary as sal on dem.employee_id=sal.employee_id
inner join parks_departments as pa_de on sal.employee_id= pa_de.department_id;
#self join
select sal1.salary,sal2.occupation,avg(sal1.salary) from employee_salary as sal1 join employee_salary sal2 on 
sal1.employee_id=sal2.employee_id where sal1.salary>50000 group by sal1.salary,sal2.occupation 
having avg(sal1.salary)>60000 order by sal1.salary ;


select dem.first_name,age,salary,"high_paid_one" as salary_label,"high_age" as age_label from employee_demographics as dem join employee_salary as sal 
on dem.employee_id=sal.employee_id where salary>60000  and age>40;

#unions
select * from employee_demographics as dem union distinct select * from employee_salary as sal;
select * from employee_demographics as dem union all  select * from employee_salary as sal;

select first_name,last_name, "old_lady" as label from employee_demographics where age>40 and gender="Female" union
select first_name,last_name, "old_man" as label from employee_demographics where age>40 and gender="Male" union
select first_name,last_name,"high_paid" as label  from employee_salary as sal where salary>60000 order by first_name;


select *, "old_lady" as label from employee_demographics where age>40 and gender="Female" union
select *, "old_man" as label from employee_demographics where age>40 and gender="Male" union
select *,"high_paid" as label  from employee_salary as sal where salary>60000  order by employee_id;

select first_name,last_name," young girl" as label from employee_demographics where age<34 and age>=20 and gender="Female" union 
select first_name,last_name," young boy" as label from employee_demographics where age<34 and age>=20 and  gender="Male" union
select first_name,last_name," old_man" as label from employee_demographics where age>45  and  gender="Male" union
select first_name,last_name,"old_girl" as label from employee_demographics where age>45 and  gender="Female" union
select first_name,last_name,"high_paid" as label from employee_salary where salary>65000 union
select first_name,last_name,"medium_paid" as label from employee_salary where salary<=50000 and salary>30000 union
select first_name,last_name,"low_paid" as label from employee_salary where salary<25000 order by first_name;

select *," young girl" as label from employee_demographics where age<34 and age>=20 and gender="Female" union 
select *," young boy" as label from employee_demographics where age<34 and age>=20 and  gender="Male" union
select *," old_man" as label from employee_demographics where age>45  and  gender="Male" union
select *,"old_girl" as label from employee_demographics where age>45 and  gender="Female" union
select *,"high_paid" as label from employee_salary where salary>65000 union
select *,"medium_paid" as label from employee_salary where salary<=50000 and salary>30000 union
select *,"low_paid" as label from employee_salary where salary<25000 order by employee_id;

#joins
select dem.first_name,dem.age, "high_age" as label,sal.first_name,sal.salary,"high_paid" as label from 
employee_demographics as dem join employee_salary  as sal on 
dem.employee_id=sal.employee_id where age>40 or salary>70000;

#string functions
#length:
select length("raveendra") as length;
select first_name,length(first_name) as len from employee_demographics order by len;
#UPPER,#LOWER
select first_name,upper(first_name) as len from employee_demographics;
select first_name,lower(first_name) as len from employee_demographics;
#locate
select first_name,locate("a",first_name) from employee_demographics;

#substring
select substring("raveendra",5,4);
select first_name,substring(first_name,3,3) from employee_demographics;

#replace
select replace("raveendra","a","z");
select first_name,replace(first_name,"a","bbb") from employee_demographics;

#trim 
select first_name,trim(first_name) from employee_demographics;
select first_name,ltrim(first_name) from employee_demographics;
select first_name,rtrim(first_name) from employee_demographics;

#concat
select concat(first_name," ",age) from employee_demographics;

select*,substring(birth_date,1,4) as years from employee_demographics;
select *,year(birth_date) as years from employee_demographics;

#CASE STATEMENTS
select *, 
case
	when age>40 then "old_person"
    when age between 30 and 40 then "middle_age"
    when age>20 and age<30 then "too_young" 
end as age_details 
from employee_demographics;

select * from employee_salary;
select * from parks_departments;
select *,
case 
	when salary>=75000 then salary+(salary*0.08)
    when salary<=74000 and salary>=40000 then salary+(salary*0.06)
    when salary<=40000 and salary>=15000 then salary+(salary*0.04)
end as sal_hicked,
case 
	when dept_id=6  then salary+(salary*0.10)
    when dept_id=12 then salary+(salary*0.10)
end as finance_related
from employee_salary;

#find salary and bouns
#<50000 = 5%
#>50000=7%
#FINANCE= 10%
select *,
case 
	when salary>=50000 then salary+(salary*0.07)
    when salary<50000 then salary+(salary*0.05)
    
end as bouns,
case
	when dept_id =6 then salary+(salary*0.10)
end as finance_bounse
from employee_salary;

#subqueries
select * from employee_demographics;
select * from employee_salary;
select * from employee_demographics where employee_id in
(select employee_id from employee_salary where dept_id=1);
#subquery in select
select first_name,salary,(select avg(salary) from employee_salary) from employee_salary;
select avg(salary) from employee_salary;

#subquery in from
select first_name,
avg(salary) as avvg_sal,
sum(salary) as sum_sal,
min(salary) as min_sal,
max(salary) as max_sal from employee_salary group by first_name order by avg(salary);

select first_name,avg(avg_sal) as avg_avg_sal from
(select first_name,
avg(salary) as avg_sal,
min(salary) as min_sal,
max(salary) as max_sal,
count(salary) as cou_sal from employee_salary group by first_name) as avg_sal1 group by first_name;

select gender,avg(av_age) from
(select gender,avg(age) as av_age,
min(age) as mi_age,
max(age) as ma_age, 
count(age) as co_ag from employee_demographics group by gender) as add_table group by gender;

select gender,avg(avg_sal) from (select gender,avg(age) as avg_sal,
min(age) as min_sal,
max(age) as max_salary,
count(age) as cou_age from employee_demographics group by gender) as employee_demographocs group by gender;

select gender,avg(avg_sal) from (select gender,avg(age) as avg_sal,
min(age) as min_sal,
max(age) as max_salary,
count(age) as cou_age from employee_demographics group by gender) as employee1 group by gender;

select max(salary) from employee_salary where salary<(select max(salary) from employee_salary
 where salary<(select max(salary)salary from employee_salary));
 
 #windows functions associated with select 
 
 select dem.gender,avg(salary) from employee_demographics as dem join employee_salary 
 as sal on dem.employee_id=sal.employee_id group by dem.gender;
 
 select *, 
 case 
	when salary>50000 then salary+(salary*0.03)
end as sal
from employee_salary;

select dem.gender,avg(salary) from employee_demographics as dem join employee_salary 
 as sal on dem.employee_id=sal.employee_id group by dem.gender;

select gender,avg(salary) over(partition by gender) from employee_demographics as dem join employee_salary 
as sal on dem.employee_id=sal.employee_id ;

select dem.first_name,dem.last_name,gender,salary,sum(salary) over(partition by gender order by dem.employee_id) as rolling_total
from employee_demographics as dem join employee_salary 
as sal on dem.employee_id=sal.employee_id ;

select dem.first_name,dem.last_name,gender,salary,
Row_number() over(partition by gender order by dem.employee_id) as rolling_total
from employee_demographics as dem join employee_salary 
as sal on dem.employee_id=sal.employee_id ;

select dem.first_name,dem.last_name,gender,salary,sum(salary)
over(partition by gender order by dem.first_name) as rolling_total
from employee_demographics as dem join employee_salary 
as sal on dem.employee_id=sal.employee_id ;

select dem.first_name,dem.last_name,gender,salary,
rank() over(partition by gender order by dem.employee_id) as rolling_total
from employee_demographics as dem join employee_salary 
as sal on dem.employee_id=sal.employee_id limit 3;

select dem.first_name,dem.last_name,gender,salary,
rank() over(partition by gender order by salary desc) as rolling_total
from employee_demographics as dem join employee_salary 
as sal on dem.employee_id=sal.employee_id ;

select dem.first_name,dem.last_name,salary,sum(salary)
over(partition by dem.first_name order by dem.employee_id) 
from employee_demographics as dem join employee_salary 
as sal on dem.employee_id=sal.employee_id ;

select dem.first_name,dem.last_name,gender,salary,
dense_rank() over(partition by gender order by salary desc) as rolling_total
from employee_demographics as dem join employee_salary 
as sal on dem.employee_id=sal.employee_id;

#common table expression 
with cte1 as
(select dem.first_name,avg(salary) as avg_sal,min(salary),max(salary),count(salary),department_name from employee_demographics as dem join employee_salary as 
sal on dem.employee_id=sal.employee_id 
join parks_departments as pak_de on sal.employee_id=pak_de.department_id 
group by dem.first_name,department_name)
select avg(avg_sal) from cte1 ;

with cte1 as
(select dem.first_name,avg(salary) as avg_sal,min(salary),max(salary),count(salary),department_name from employee_demographics as dem join employee_salary as 
sal on dem.employee_id=sal.employee_id 
join parks_departments as pak_de on sal.employee_id=pak_de.department_id 
group by dem.first_name,department_name)
select * from cte1 ;

select * from
(select dem.first_name,avg(salary) as avg_sal,min(salary),max(salary),count(salary),department_name from employee_demographics as dem join employee_salary as 
sal on dem.employee_id=sal.employee_id 
join parks_departments as pak_de on sal.employee_id=pak_de.department_id 
group by dem.first_name,department_name) as p1;

select *,
case 
	when salary>50000 then salary+(salary*0.05)
end as one_1,
case 
	when dept_id=6 then salary+(salary*0.05)
end as one_2
from employee_salary;
select * from employee_salary;

with cte_1 as
(select gender,employee_id,first_name,last_name from employee_demographics where employee_id>5),
cte2 as 
(select employee_id,salary,occupation from employee_salary where salary>40000)
select * from cte_1 join cte2 on cte_1.employee_id=cte2.employee_id;

with cte_three as
(select dem.first_name,dem.last_name,gender,salary,sum(salary) over(partition by gender order by dem.employee_id) as rolling_total
from employee_demographics as dem join employee_salary 
as sal on dem.employee_id=sal.employee_id join parks_departments as pak_1 on sal.employee_id=pak_1.department_id
) 
select * from cte_three;

with cte_three as
(select dem.first_name,dem.last_name,gender,salary,sum(salary) over(partition by gender order by dem.employee_id) as rolling_total
from employee_demographics as dem join employee_salary 
as sal on dem.employee_id=sal.employee_id join parks_departments as pak_1 on sal.employee_id=pak_1.department_id
) 
select * from cte_three;

# temporary tables

select * from employee_demographics;
select * from employee_salary;
select * from parks_departments;

create temporary table birth_date_over_1991
(select birth_date from employee_demographics where birth_date>1990); 
select * from birth_date_over_1991;

create temporary table temp3
(firt_name varchar(20),
last_name varchar(20)
);
insert into temp3 values("samsrann","sampathi");
select * from temp1;
select * from temp2 join temp3 on temp2.firt_name=temp3.firt_name;

#store procedure
create PROCEDURE one1()
select * from employee_salary where salary>40000;
call one1();

#select * from temp2 join one1() on temp2.firt_name=one1().first_name;  temporary table and procedire table join not possible 

#DELIMITER use 

DELIMITER $$
create procedure salary()
begin	
	select * from employee_salary where salary>10000;
    select * from employee_salary where salary<50000;
END $$
DELIMITER ;
call salary();

#I LIKED 
#PAMATER 
DELIMITER $$
CREATE PROCEDURE T1(emp1 int)
BEGIN
	SELECT * FROM employee_salary where employee_id=emp1;
END $$
DELIMITER ;
CALL T1(1); 

select * from employee_demographics;
delete from employee_demographics where employee_id=14;
select *from employee_salary;
#triggers & events
DELIMITER $$
create trigger insert_demo1
	after insert on employee_salary
    for each row
begin
	insert into employee_demographics(employee_id,first_name,last_name) values(new.employee_id,new.first_name,new.last_name);
end $$
DELIMITER ;
insert into employee_salary (employee_id,first_name,last_name,occupation,salary,dept_id) 
values(14,"om","shiva","god",1000000,NULL); #(employee_id,first_name,last_name,occupation,salary,dept_id)
    
DELIMITER $$
CREATE TRIGGER insert_demo1
AFTER INSERT ON employee_salary
FOR EACH ROW
BEGIN
    INSERT INTO employee_demographics (employee_id, first_name, last_name) 
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

-- Corrected insert statement
INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id) 
VALUES (14, 'om', 'shiva','god', '1000000', NULL);

delimiter $$
create trigger t2
	after insert on employee_salary
    for each row 
begin 
	insert into employee_demographics(employee_id,first_name,last_name)values(new.employee_id,new.first_name,new.last_name);
end $$
delimiter ;
insert into employee_salary values (20,"sri","ram","godd",1200000,NULL);

#evenet create
delimiter $$
create event del_over_60y
on schedule every 30 second 
do 
begin 
	delete 
    from employee_demographics where age>=60;
end $$
delimiter ;








