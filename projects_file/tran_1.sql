SELECT * FROM sales.transactions;
#i_written joins used to get the data
select * from sales.transactions inner join sales.date on sales.transactions.order_date=sales.date.date;
#sir given 
select sales.transactions.*,
sales.date.* from sales.transactions
inner join sales.date 
on sales.transactions.order_date=sales.date.date;

#ssales done in the year 2020
select sales.transactions.*,sales.date.* from sales.transactions
inner join sales.date 
on sales.transactions.order_date=sales.date.date where sales.date.year="2020";

# 2020 sales sum 
select sum(st.sales_amount) 
from sales.transactions 
as st inner join sales.date as sd on st.order_date=sd.date where sd.year="2020";
# 2019 sales sum
select sum(st.sales_amount) 
from sales.transactions 
as st inner join sales.date as sd on st.order_date=sd.date where sd.year="2019";

# chennai region sum
#help of joins

select sum(st.sales_amount) from sales.transactions as st
inner join sales.date as sd on st.order_date=sd.date
inner join sales.markets as sm on st.market_code=sm.markets_code where sm.markets_name="Chennai";

select * from sales.transactions; #'Mark001'
select sum(sales_amount) from sales.transactions where sales.transactions.market_code='Mark001';

# 2020 in year chennai revenue
select sum(st.sales_amount) from sales.transactions as st
inner join sales.date as sd on st.order_date=sd.date
inner join sales.markets as sm on st.market_code=sm.markets_code where sm.markets_name="Chennai" and sd.year="2020";

select sum(sales_amount) from 
sales.transactions as st
inner join sales.date as sd on st.order_date=sd.date where st.market_code='Mark001' and sd.year="2020";

#unique products sold in chennai
select distinct product_code from sales.transactions where market_code="Mark001";

#see the duplicats also
select  distinct sales.transactions.currency from sales.transactions;

select distinct(currency) from transactions;



