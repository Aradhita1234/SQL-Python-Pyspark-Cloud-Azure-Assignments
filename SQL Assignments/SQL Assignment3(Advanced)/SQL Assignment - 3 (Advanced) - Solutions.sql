#Mini-Project: TATA NEU Sales Analysis Using SQL
use flipkart_db;

#Problem Statements:

#1) Write a query to calculate the total records in both tables?

SELECT (SELECT COUNT(*) FROM tata_tb1) AS tb1_records,
(SELECT COUNT(*) FROM tata_tb2) AS tb2_records;

#2) Write a query to calculate the total unique count of customers?

select count(distinct customername) as unique_customers from tata_tb1;

#3) Write a query to fetch the oldest order date and latest order date?

select min(orderdate) as oldest_order_date ,max(orderdate) as latest_order_date from tata_tb1;

#4) Write query to get years in table?

select distinct year(orderdate) as years from tata_tb1;

#5) Write a query to get the no. of regions and display the region names?

SELECT COUNT(DISTINCT region) AS number_of_regions
FROM tata_tb1;
SELECT DISTINCT region AS region_name
FROM tata_tb1;

#6) Write a query to get the no. of countries and display the country names?

SELECT COUNT(DISTINCT country) AS number_of_countries
FROM tata_tb1;
SELECT DISTINCT country AS country_name
FROM tata_tb1;

#7) Write a query to get the no. of states and display the state names?

SELECT COUNT(DISTINCT state) AS number_of_states
FROM tata_tb1;
SELECT DISTINCT state AS state_name
FROM tata_tb1;

#8) Write a query to get the no. of cities and display the city names?

SELECT COUNT(DISTINCT city) AS number_of_cities
FROM tata_tb1;
SELECT DISTINCT city AS city_name
FROM tata_tb1;

#9) Write a query to calculate the total count of customers?

SELECT COUNT(distinct CustomerName) AS total_customers FROM tata_tb1;

#10) Write a query to calculate the total count of products?

SELECT COUNT(distinct ProductName) AS total_products FROM tata_tb2;

#11) Write a query to calculate total sales, total profit and total order quantity?

SELECT  SUM(Sales) AS total_sales, SUM(Profit) AS total_profit, SUM(OrderQuantity) AS total_order_qty
FROM TATA_TB2;

#12) Write a query to calculate the total sales amount for each category. Display the
#category, total sales, and total order qty and order by total sales from highest to lowest?

select category,SUM(sales) as total_sales,SUM(OrderQuantity) as total_order_qty
from tata_tb2 
group by category
order by total_sales desc;

#13) Write a query to calculate the total profit amount for each category. Display the
#category, total profit, and total order qty and order by total profit from highest to lowest?

select category,SUM(Profit) as total_profit,SUM(OrderQuantity) as total_order_qty
from tata_tb2 
group by category
order by total_profit desc;

#14) Write a query to fetch the subcategories where total sales are greater than 100000?

select subcategory,sum(sales) as total_sales from tata_tb2 
 group by subcategory
 having total_sales>100000;
 
#15) Write a query to fetch the products where total profit is greater than 1000?

select productname,sum(profit) as total_profit from tata_tb2 
 group by productname
 having total_profit>1000;
 
#16) Write a query to get the total sales and total profit for Office Supplies category?

SELECT  SUM(Sales) AS total_sales, SUM(Profit) AS total_profit
FROM TATA_TB2
where category='Office Supplies';

#17) Write a query to get the total sales and total profit for Furniture category and the Tables
#and Bookcases sub-categories ?

SELECT  SubCategory, SUM(Sales) AS total_sales, SUM(Profit) AS total_profit
FROM TATA_TB2
where category='Furniture' and subcategory in("Tables","Bookcases")
GROUP BY SubCategory;

#18) Write a query to get the total sales and total profit for Technology category and the
#Accessories, Copiers, Phones sub-categories ?

SELECT  SubCategory, SUM(Sales) AS total_sales, SUM(Profit) AS total_profit
FROM TATA_TB2
where category='Technology' and subcategory in('Accessories', 'Copiers', 'Phones')
GROUP BY SubCategory;

#19) Write a query to get total sales and total profit by Region, Segment?

SELECT  t1.Region, t1.Segment, SUM(t2.Sales) AS total_sales, SUM(t2.Profit) AS total_profit
FROM TATA_TB1 t1
JOIN TATA_TB2 t2 ON t1.OrderID = t2.OrderID
GROUP BY t1.Region, t1.Segment;

#20) Write a query to get total sales and total profit by Country, State and city?

SELECT  t1.Country,t1.state,t1.city, SUM(t2.Sales) AS total_sales, SUM(t2.Profit) AS total_profit
FROM TATA_TB1 t1 join TATA_TB2 t2 on t1.orderid=t2.orderid
group by t1.Country,t1.state,t1.city;

#21) Write a query to get total sales and total orderqty by CustomerName sort it by totalsales
#from highest to lowest?

select t1.customername, SUM(t2.sales) as total_sales, SUM(t2.orderQuantity) as total_orderqty 
from tata_tb1 t1 join tata_tb2 t2 on t1.orderid = t2.orderid
group by t1.customername
order by total_sales desc;

#22) Identify the top 5 products with the highest sales (by sales amount). Show the product
#name, total sales, and total qty?

select productname, SUM(sales) as total_sales, SUM(orderquantity) as total_qty
from tata_tb2
group by productname
order by total_sales desc  limit 5;

#23) Write a query to get total sales by City having sales greater than 2000?

select t1.city,SUM(t2.sales) as total_sales
from tata_tb1 t1 join tata_tb2 t2 on t1.orderid = t2.orderid
group by t1.city
having total_sales>2000;

#24) Write a query to get total sales by CustomerName having sales greater than 3000?

select t1.customername,SUM(t2.sales) as total_sales
from tata_tb1 t1 join tata_tb2 t2 on t1.orderid = t2.orderid
group by t1.customername
having total_sales>3000;

#25) Write a query to get total sales and total profit by shipmode?

select t1.shipmode,SUM(t2.sales) as total_sales,SUM(t2.profit) as total_profit
from tata_tb1 t1 join tata_tb2 t2 on t1.orderid = t2.orderid
group by t1.shipmode;

#26) Write a query to get total sales for North and central region?

select t1.region,SUM(t2.sales) as total_sales
from tata_tb1 t1 join tata_tb2 t2 on t1.orderid = t2.orderid
where region in('North','central')
group by t1.region;

#27) Write a query to get total sales and total profit for Italy and Spain countries?

select t1.country,SUM(t2.sales) as total_sales,SUM(t2.profit) as total_profit
from tata_tb1 t1 join tata_tb2 t2 on t1.orderid = t2.orderid
where country in('Italy','Spain')
group by t1.country;

#28) Write a query to get the total sales and total profit for each year?

select year(t1.orderdate) as yr,SUM(t2.sales) as total_sales,SUM(t2.profit) as total_profit
from tata_tb1 t1 join tata_tb2 t2 on t1.orderid = t2.orderid
group by yr;

#29) Find the top 10 customers who spent the most across all transactions. Display the
#customer name, total amount spent, and number of orders placed?

select t1.customername,SUM(t2.sales) as total_amt_spent,count(distinct t1.orderid)
from tata_tb1 t1 join tata_tb2 t2 on t1.orderid=t2.orderid
group by t1.customername
order by  total_amt_spent desc
limit 10;

#30) Write a query to find which products are most preferred by customers based on the
#total sales. Display customer name, favorite product9 (top 3 products per each customer), and total sales on that product?

select * from(  
select t1.customername,t2.productname, SUM(t2.sales) as total_sales,
dense_rank() over(partition by customername order by SUM(sales) desc) as rnk
from tata_tb1 t1 join tata_tb2 t2 on t1.orderid=t2.orderid
group by t1.customername,t2.productname)x  
WHERE rnk <= 3;

#31) Write a query to get 7th rank customer name based on total sales? Display customer
#name, sales amount and rank.

select * from(
select t1.customername,SUM(t2.sales) as total_sales,
dense_rank() over(order by SUM(sales) desc) as rnk
from tata_tb1 t1 join tata_tb2 t2 on t1.orderid=t2.orderid
group by t1.customername)x  
WHERE rnk = 7;

#32) Write query to get total sales and total profit between year 2011 and 2013?

SELECT YEAR(t1.OrderDate) as yr,SUM(t2.Sales) as total_sales, SUM(t2.Profit) as total_profit
FROM TATA_TB1 t1
JOIN TATA_TB2 t2 ON t1.OrderID = t2.OrderID
WHERE YEAR(OrderDate) BETWEEN 2011 AND 2013
group by yr ;

#33) Write a query to get total sales, total profit and total order qty by country, state, category
#and sub-category?

select t1.country,t1.state, t2.category,t2.subcategory,SUM(t2.sales),SUM(t2.profit), SUM(t2.orderQuantity)
FROM TATA_TB1 t1
JOIN TATA_TB2 t2 ON t1.OrderID = t2.OrderID
group by t1.country,t1.state, t2.category,t2.subcategory
order by country;

#34) Write stored procedure to get top 10 customers based on total sales?

delimiter %%
create procedure top10customers()
Begin
select t1.customername,SUM(t2.sales) as total_sales 
FROM TATA_TB1 t1
JOIN TATA_TB2 t2 ON t1.OrderID = t2.OrderID
group by t1.customername
order by total_sales desc limit 10;
end ;
%%
call top10customers();

#35) Create a virtual table (view) by using OrderID, OrderDate, CustomerName, Region,
#country, sales, profit and order qty?
#  ---- Not covered yet-----

#36) Create a stored procedure to get region sales?

delimiter $$
create procedure regionsales()
Begin
select t1.region,SUM(t2.sales) as total_sales 
FROM TATA_TB1 t1
JOIN TATA_TB2 t2 ON t1.OrderID = t2.OrderID
group by t1.region
order by total_sales desc;
end ;
$$
call regionsales();