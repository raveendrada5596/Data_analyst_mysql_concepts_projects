# store proceddure 
#store procedure are the way to store the sql code and thar you can reuse over and over again and again

#syntax
create PROCEDURE new_procedure() # create syntax
select * from employee_demographics; # neeeded data give here 
call new_procedure(); # calling procedure 

#selecting only possible not crate 
# reate PROCEDURE new_procedure() # create syntax
select * from employee_demographics; # neeeded data give here 
call new_procedure(); # calling procedure 
#above one is okay 

create PROCEDURE new_procedure() # create syntax
first_name varchar(20); # giving the new values and column names
call new_procedure(); # calling procedure 

# its not okay

#single select statemant 
create procedure salary_over_50k()
select * from employee_salary where salary>50000;
call salary_over_50k();

#dual statements
DELIMITER $$
create procedure salary_between_50k_to_10k()
begin 
	select * from employee_salary where salary>10000;
    select * from employee_salary where salary<50000;
end $$
DELIMITER ;
call salary_between_50k_to_10k();

#I LIKED
#parameters : VARIABLES THAT ARE PASSED INTO A STORE PROCEDURE ITS ALLOW THE STORE PROCEDURE TO ACCEPT THE INPUT values 

DELIMITER $$
CREATE PROCEDURE PARAMETER_CHECK(emp_salary int) # (WITH IN THIS PARAMTER)
BEGIN
	SELECT * FROM employee_salary where salary=emp_salary # HERE WE EQUALS THE employee_salary.SALARY=PARAMTER.SALARY
    ;
END $$
DELIMITER ;
CALL PARAMETER_CHECK(50000);




