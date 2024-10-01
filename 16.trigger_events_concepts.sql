use parks_and_recreation;
show tables;
select * from employee_demographics;
select * from employee_salary;
select * from parks_departments;

#Triggers and Events
#Triggers: block of code it automatically executes the when the events takes place

DELIMITER $$
Create trigger employee_salary
	AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN
	insert into employee_demographics( employee_id,first_name,last_name)
    values(new.employee_id, new.first_name, new.last_name);
END $$
DELIMITER ;

insert into employee_salary values(13,"sam","srann","collector",1000000,3);

DELIMITER $$
Create trigger employee_salary4
	before INSERT ON employee_salary
    FOR EACH ROW
BEGIN
	insert into employee_demographics( employee_id,first_name,last_name)
    values(new.employee_id, new.first_name, new.last_name);
END $$
DELIMITER ;

insert into employee_salary values(16,"sam3","srann3","collector3",1000000,NULL);

select * from employee_demographics;
#EVENT

DELIMITER $$
create event delete_version
on schedule every 30 second 
do
begin 
	delete from employee_demographics where age>=60;
end $$
delimiter ;




