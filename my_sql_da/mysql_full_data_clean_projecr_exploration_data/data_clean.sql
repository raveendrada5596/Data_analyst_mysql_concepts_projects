SELECT * FROM world_layoffs.layoffs;

#dos
#1 remove the duplicates / check for duplicates and remove any
#2 standardize the data /standardize data and fix errors
#3 Null values or blank values /  Look at null values and see what 
#4 Remove any columns or rows we need / un neccesory data /remove any columns and rows that are not necessary - few ways 

#creating the new table and copy the data all
create table layoffs_staging like layoffs; # create the table and take the 

select * from  layoffs_staging;


#insert data taking from other table
insert into layoffs_staging select * from layoffs;

#identify the unique things dor identify the duplictaes
#add the windows finctions : over() and rownumber()
select *,
row_number() over(partition by company,location, industry, total_laid_off, percentage_laid_off, 'date', stage,
 country, funds_raised) as row_num 
 from layoffs_staging;
 
#cte create 
with duplicate_cte as
(select *,
row_number() over(partition by company,location, industry, total_laid_off, percentage_laid_off, 'date', stage,
 country, funds_raised) as row_num 
 from layoffs_staging) 
 select * from duplicate_cte where row_num>1;
 
 #create the new duplicate table like the layoffs_staging
 
CREATE TABLE layoffs_staging2 (
    `company` text,
    `location` text,
    `industry` text,
    `total_laid_off` text,
    `percentage_laid_off` text,
    `date` text,
    `stage` text,
    `country` text,
    `funds_raised` text,
    `row_num` INT # added this row_num its need for row_number to identfy the rows 
);


# insert data same as raw data
insert into layoffs_staging2 select *, row_number() 
over(partition by company, location, 
industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised) as row_num
from layoffs_staging
;
select * from layoffs_staging2 where row_num>1;
#deleteing the data row_num>1 data
delete from layoffs_staging2 where row_num>1;
set sql_safe_updates=0;
commit;

#standardize data and fix errors 

select * from layoffs_staging2;

#company related 
select company,trim(company) from layoffs_staging2 order by 1;
update layoffs_staging2 set company=trim(company);
set sql_safe_updates=0;

#industry related
select  distinct industry from layoffs_staging2 order by 1;  #gived the no value columns first
select industry,trim(industry) from layoffs_staging2 order by industry,trim(industry); 
#I LIKED
update layoffs_staging2 set industry="crypto" where industry like "crypto%";
commit;

select distinct location from layoffs_staging2 order by 1;
#country related
select distinct country from layoffs_staging2 order by 1;  #gived the no value columns first
select country,trim(country) from layoffs_staging2;

select * from layoffs_staging2 where country like "United states%" order by 1;

#remove thoe dots in the country columns
select distinct country,trim(TRAILING '.' from country) from layoffs_staging2; 

update layoffs_staging2 set country=trim(TRAILING '.' from country) where country like "United States%";
commit;
# changing the date text format to date date fromat 
select date from layoffs_staging2;
select date,
str_to_date('date', '%m/%d/%Y')from layoffs_staging2;
#SELECT date, STR_TO_DATE(date, '%m/%d/%Y') AS formatted_date FROM layoffs_staging2; #chat gpt given
SELECT 'date', STR_TO_DATE('date', '%m/%d/%Y') FROM layoffs_staging2;
select date,type(date) from layoffs_staging2;

update layoffs_staging2 set date =str_to_date('date', '%m/%d/%Y');
select * from layoffs_staging2;

alter table layoffs_staging2 modify column date DATE;

select * from layoffs_staging2;

# Null values or blank values /  Look at null values and see what

select * from layoffs_staging2 where total_laid_off=" " and percentage_laid_off=" "; #its nt worked first convery empty to null

#identify the null or empyt places 
#upadte the emppty to null
update layoffs_staging2 set percentage_laid_off=null where percentage_laid_off='';

select distinct industry from layoffs_staging2 where industry is null or industry='';

select * from layoffs_staging2;
select * from layoffs_staging2 order by 1;
select industry from layoffs_staging2 where industry=''; 
update layoffs_staging2 set industry=null where industry='';

select * from layoffs_staging2 where industry is null; 
select * from layoffs_staging2 where company= "Appsmith";
select company from layoffs_staging2 where industry is null;

#check the blank or null
select * from layoffs_staging2 t1 join layoffs_staging2 t2 on t1.company=t2.company where 
(t1.industry is null or t1.industry=''
)and t2.industry is not null;

select t1.industry,t2.industry from layoffs_staging2 t1 join layoffs_staging2 t2 on t1.company=t2.company where 
(t1.industry is null or t1.industry=''
)and t2.industry is not null;

# t1.industry =t2.industry upadteing
update  layoffs_staging2 t1 join layoffs_staging2 t2 on t1.company=t2.company set t1.industry=t2.industry 
where (t1.industry is null or t1.industry ='') and t2.industry is not null;

# deleteing the null values of total_laid_off and percentage_laid_off
delete  from layoffs_staging2 where percentage_laid_off is null and  total_laid_off  is null;
select percentage_laid_off, total_laid_off from layoffs_staging2  where percentage_laid_off is null and  total_laid_off is null;
 
select * from layoffs_staging2;
commit;


#exploration of data: projects

use world_layoffs;
select * from layoffs_staging2;
# see max(total_laid_off),max(percentage_laid_off)
select max(total_laid_off),max(percentage_laid_off) from layoffs_staging2;
select max(total_laid_off) from layoffs_staging2;
select min(total_laid_off) from layoffs_staging2;
alter table layoffs_staging2 drop column row_num;
commit;

select max(percentage_laid_off)  from layoffs_staging2;

select * from layoffs_staging2 where percentage_laid_off=1 order by total_laid_off desc;

select * from layoffs_staging2 where percentage_laid_off=1 order by funds_raised desc;
#checing the company=total loidoffs happens
select company,sum(total_laid_off)  from layoffs_staging2  group by company order by 2;
select company,sum(total_laid_off) sum_to from layoffs_staging2  group by company order by 2 desc;

#check the date
select max(date),min(date) from layoffs_staging2;

#industry which have the most laid_offs
select industry,sum(total_laid_off) from layoffs_staging2 group by industry order by 2 desc;

# total laid happens in country
select country,sum(total_laid_off) from layoffs_staging2 group by country order by 2 desc;

#which day which lay_offs happens
select date,sum(total_laid_off) from layoffs_staging2 group by date order by 2 desc;

#in year how many
select year(date) as year_,sum(total_laid_off)  from layoffs_staging2 group by year_ order by 1 desc;
select substring(date,1,4) as year_, sum(total_laid_off) from layoffs_staging2 group by year_ order by 1 desc;

select * from layoffs_staging2;
# which stage which happends
select stage,sum(total_laid_off) from layoffs_staging2 group by stage order by 2 desc;

# seee months in the date
select month(date) from layoffs_staging2;
select substring(date,6,2) from layoffs_staging2;

#month layoffs happens
select substring(date,6,2) as mon,sum(total_laid_off) from layoffs_staging2 group by mon order by 2 desc;

# year+month:laid_offs
select substring(date,1,7) as month,sum(total_laid_off) from layoffs_staging2 group by month order by 1 asc;

#rolling total 
select company,date,total_laid_off,sum(total_laid_off) from layoffs_staging2 group by company,date,total_laid_off order by 3 desc;

select substring(date,1,7) as 'month' ,sum(total_laid_off) as sum_total from layoffs_staging2 
where substring(date,1,7) is not null group by month order by 1 asc;

with rolling_total as 
(select substring(date,1,7) as 'month' ,sum(total_laid_off) as sum_total from layoffs_staging2 
where substring(date,1,7) is not null group by month order by 1 asc)
select month,sum_total,sum(sum_total) over(order by month) from rolling_total;

# company+year+sum(total_laid_off)
select company,year(date),sum(total_laid_off) as sum_total from layoffs_staging2 group by company,year(date) order by 3 desc;

# dense_rank using
with company_year(coma,dat_year,sum_total) as 
(select company,year(date),sum(total_laid_off) as sum_total from layoffs_staging2 
group by company,year(date) order by 3 desc),
cte1 as
(select *, dense_rank()  over(partition by dat_year order by sum_total desc) as r1 from 
company_year where dat_year is not null )
select * from cte1 where r1<=5;

