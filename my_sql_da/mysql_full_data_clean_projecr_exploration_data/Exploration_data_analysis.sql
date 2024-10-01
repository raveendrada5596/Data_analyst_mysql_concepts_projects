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