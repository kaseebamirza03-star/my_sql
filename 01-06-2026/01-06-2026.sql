-- TOPIC - (2)
use company_db;
show tables;
select * from customers;
select * from products;
select * from orders;
select * from employees;

-- Q1. Show each customer's name along with the total number of orders they have placed.

select c.customer_name, count(order_id) as total_orders from customers c
left join orders o
on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name;

-- Q2. List each product name with the total revenue generated from orders.

SELECT p.product_name, SUM(o.amount) AS total_revenue
FROM products p
JOIN orders o
ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name;








