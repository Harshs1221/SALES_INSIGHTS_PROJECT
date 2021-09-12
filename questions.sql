-- Skills Used : Aggregate functions, DDL Commands like alter, Joins, CASE Function, 


-- 1 Show total number of customers
select count(customer_code)
from customers;

-- 2 Show transactions for Chennai market (market code for chennai is Mark001)
alter table markets
rename column markets_code to market_code;

select t.*
from transactions t
JOIN
markets m ON m.market_code = t.market_code
where markets_name = "Chennai";

-- 3 Show distinct product codes that were sold in chennai

SELECT distinct(t.product_code) 
FROM transactions t
JOIN
markets m ON m.market_code = t.market_code
where markets_name = "Chennai";

-- 4 Show transactions where currency is US dollars
select * 
from transactions 
where currency = "USD";

-- 5 convert usd sales_amount to INR currency
select *,
Case
when currency = 'USD' Then sales_amount * 73
else sales_amount
end as new_sales_amount
from transactions;
commit;

select *,
case
when currency = "USD" Then "INR" else currency
end as new_currency
from transactions;

-- Show transactions in 2020 join by date table

select t.*,d.year
from transactions t
join date d ON d.date = t.order_date
where year = '2020';

-- Show total revenue in year 2020
select sum(t.sales_amount)
from transactions t
join date d ON d.date = t.order_date
where d.year = '2020';

-- Show total revenue in year 2020, January Month,
select sum(t.sales_amount), d.month_name
from transactions t
join date d ON d.date = t.order_date
where d.year = '2020' and d.month_name = 'January';




















