use parks_and_recreation;
show tables;
select * from employee_demographics;
select * from employee_salary;
select * from parks_departments;

#ASSOCIATED WITH SELECT STATEMENT

#CASE_STATEMENTS: CASE
					#WHEN LOGIC THEN SOLUTION
				#END
                
#find salary and bouns
#<50000 = 5%
#>50000=7%
#FINANCE= 10%

select first_name,last_name,salary,
CASE
	WHEN salary<50000 THEN salary*1.05
	WHEN salary>50000 THEN salary*1.07
END AS SALARY_HIKED,
CASE 
	WHEN dept_id=6 THEN salary*.10
END AS BOUNS 
FROM employee_salary;

select dept_id,first_name,employee_id,
CASE 
	WHEN dept_id>1 THEN salary*1.05
    WHEN dept_id>4 AND dept_id<6 THEN salary*1.07
END AS BASED_DEPT_ID,
CASE
	WHEN employee_id=9 THEN salary*.10
END AS HIGH_VALUE
from employee_salary;


