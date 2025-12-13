#Ele_Store Data Set 
create database flipkart_db;
use flipkart_db;
select * from ele_store_tb limit 2;

#1) What is total number of orders placed?
#Query
select count(distinct orderID) from ele_store_tb;

#2) What are the unique channels present and how many are there?
#Query
select distinct channel,count(*) from ele_store_tb group by channel;

#3) How many cities are there?
#Query
select count(distinct city) from ele_store_tb;

#4) Query the total cities count by Country?
#Query
select country,count(distinct city) from ele_store_tb group by country;

#5) How many products are there?
select count(distinct ProductName) from ele_store_tb;  

#6) Query the total sales and total profit?
select sum(sales),sum(profit) from ele_store_tb;

#7) Query the total sales by region and country?
select region,country,sum(sales) from ele_store_tb
group by country,region order by region;


#8) Query the total order qty by promotion name?
select promotionname,sum(orderQty) from ele_store_tb 
group by promotionname;

#9) How much the total sales happened in Asia region?
select sum(sales) from ele_store_tb where region="Asia";

#10) How much profit got in Asia region and India?
select sum(profit) from ele_store_tb where region="Asia" and country="India";

#11) Query the total order qty by Manufacturer and Product Name?
select manufacturer,Productname,sum(orderQty) from ele_store_tb 
group by manufacturer,Productname order by manufacturer;

#12) Query the total order quantity greater than 27 by city?
select city,sum(orderQty) from ele_store_tb group by city having sum(orderQty)>27 order by city ;

#13) How much total sales happened in China and Beijing?
select sum(sales) from ele_store_tb where country='china' and city='Beijing';

#14) How much total sales happened in Asian Holiday Promotion?
select sum(sales) from ele_store_tb where promotionname='Asian Holiday Promotion';


#15) How much total profit value by Contoso, Ltd Manufacturer?
select sum(profit) from ele_store_tb where manufacturer='Contoso, Ltd';

#16) Query the total sales and total order qty by productcategory?
select productcategory,sum(sales),sum(orderQty) from ele_store_tb group by productcategory;

#17) Query the total sales value in between 1057 and 26700 by Region?
select region,sum(sales) from ele_store_tb group by region having sum(sales) Between 1057 AND 26700;

#18) How many orders placed in Pittsfield city?
select sum(OrderQty) from ele_store_tb where city='Pittsfield';

#19) Query the total sales and total profit by region, country and city?
select region,country,city,sum(sales),sum(profit) from ele_store_tb group by region,country,city order by region,country;

#20) Query the total unit cost and total price by productcategory, productsubcategory and Manufacturer?
select productcategory,productsubcategory,Manufacturer,sum(unitcost),sum(price) from ele_store_tb 
group by productcategory,productsubcategory,Manufacturer
order by productcategory,productsubcategory;
