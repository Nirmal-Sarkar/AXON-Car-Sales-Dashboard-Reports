USE classicmodels;


-- Advanced Analysis On MySQL:
-- Q1. Total Revenue ad sales generated over the years

select year(o.orderDate) as years,sum(od.quantityOrdered*od.priceEach) as revenue,
count(od.orderNumber) as no_of_orders from orderdetails od join orders o on od.orderNumber=o.orderNumber
group by 1;


-- Q2. Total customer transaction over years

select year(orderDate) 'Year', count(p.customerNumber) 'Total Transactions'
from orders o join payments p 
on o.customerNumber=p.customerNumber
group by 1;
 
-- Q3. New customers over the years

select year(first_order) 'Year',count(cn) 'New Customers' from
(select customerNumber cn,min(orderDate) first_order 
from orders
group by 1) f
group by 1;
