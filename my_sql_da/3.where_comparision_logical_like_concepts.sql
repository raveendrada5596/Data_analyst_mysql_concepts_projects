#where clause: filter the rows based on condition and its need the rows for compare and give the result
select age,first_name from parks_and_recreation.employee_demographics where first_name="Tom";

#comparision operators : >,<,=<,>=,==,!=   Compare the two values
select age,first_name from parks_and_recreation.employee_demographics where age<50; 
select * from parks_and_recreation.employee_demographics where birth_date<"1970-01-01";
SELECT * FROM parks_and_recreation.employee_demographics WHERE AGE>=30 AND AGE<=50;
SELECT * FROM parks_and_recreation.employee_demographics WHERE first_name="Leslie" AND gender="Female";
select * from parks_and_recreation.employee_demographics where age>40 or not gender="male";
select * from parks_and_recreation.employee_demographics where birth_date>"1980-01-01" or not gender!="male";
select first_name,gender from parks_and_recreation.employee_demographics;
select first_name,gender from parks_and_recreation.employee_demographics where first_name like "L%" or not gender="female";

#Logical operators: AND, OR ,NOT 
#AND: BOTH CONDITIONS ARE TRUE THAN ONLY GIVE THE RESULT
#OR: ANY ONE CONDITION IS TRUE GIVE RESULT
#NOT: ITS OPOSITE THE GIVEN CONDITION

select * from parks_and_recreation.employee_demographics fisrt_name where(first_name="Leslie" and age=44)or age>55; #PEMDAS + lOGICAL OPERATOR
select * from parks_and_recreation.employee_demographics where age>40 or not gender='male';
#PATTERN OPERATOR: LIKE
select * from parks_and_recreation.employee_demographics where birth_date like "1979%";
select * from parks_and_recreation.employee_demographics where first_name like"L%" ;
select * from parks_and_recreation.employee_demographics where first_name like "_es%";
select * from parks_and_recreation.employee_demographics where first_name like "%s%";



