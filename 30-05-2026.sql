create database company_db;
use company_db;

-- =========================
-- 1. EMPLOYEES TABLE
-- =========================

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    department VARCHAR(30),
    salary INT,
    manager_id INT NULL
);

INSERT INTO employees VALUES
(101,'Alice Johnson','IT',72000,NULL),
(102,'Bob Smith','IT',65000,101),
(103,'Carol White','HR',58000,NULL),
(104,'David Brown','HR',54000,103),
(105,'Eva Green','Finance',80000,NULL),
(106,'Frank Black','Finance',75000,105),
(107,'Grace Lee','IT',68000,101),
(108,'Henry Wilson','Marketing',60000,NULL),
(109,'Ivy Turner','Marketing',56000,108),
(110,'Jack Davis','Finance',70000,105),
(111,'Karen Moore','IT',63000,101),
(112,'Leo Harris','HR',50000,103),
(113,'Mia Clark','Marketing',62000,108),
(114,'Nate Lewis','Finance',78000,105),
(115,'Olivia Walker','IT',71000,101),
(116,'Paul Hall','HR',53000,103),
(117,'Quinn Young','Marketing',59000,108),
(118,'Rachel King','Finance',82000,105),
(119,'Sam Scott','IT',66000,101),
(120,'Tina Adams','HR',55000,103);


-- =========================
-- 2. PRODUCTS TABLE
-- =========================

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price INT,
    stock_qty INT
);

INSERT INTO products VALUES
(301,'Laptop','Electronics',55000,30),
(302,'Smartphone','Electronics',22000,80),
(303,'Headphones','Electronics',3500,120),
(304,'Monitor','Electronics',18000,45),
(305,'Keyboard','Accessories',1500,200),
(306,'Mouse','Accessories',900,250),
(307,'Desk Chair','Furniture',8500,40),
(308,'Standing Desk','Furniture',22000,15),
(309,'Webcam','Electronics',4200,70),
(310,'USB Hub','Accessories',1200,180),
(312,'Pen Set','Stationery',250,600),
(313,'Printer','Electronics',12000,25),
(314,'Scanner','Electronics',9000,20),
(315,'External SSD','Electronics',7500,60),
(316,'Lamp','Furniture',2200,90),
(317,'Whiteboard','Office Supplies',3800,35),
(318,'Cable Organiser','Accessories',600,300),
(319,'Power Bank','Electronics',2800,100),
(320,'Smart Watch','Electronics',15000,55);


-- =========================
-- 3. CUSTOMERS TABLE
-- =========================

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    country VARCHAR(50),
    join_year INT
);

INSERT INTO customers VALUES
(201,'Aarav Mehta','Mumbai','India',2021),
(202,'Priya Sharma','Delhi','India',2020),
(203,'Rohan Gupta','Pune','India',2022),
(204,'Sunita Patel','Ahmedabad','India',2021),
(205,'Vikram Rao','Bangalore','India',2019),
(206,'Neha Singh','Chennai','India',2023),
(207,'Arjun Kumar','Hyderabad','India',2020),
(208,'Deepa Nair','Kochi','India',2022),
(209,'Sanjay Joshi','Jaipur','India',2021),
(210,'Meera Iyer','Coimbatore','India',2023),
(211,'Ravi Verma','Lucknow','India',2020),
(212,'Anita Das','Kolkata','India',2019),
(213,'Kiran Reddy','Vizag','India',2022),
(214,'Pooja Shah','Surat','India',2021),
(215,'Amit Bose','Nagpur','India',2023),
(216,'Tara Menon','Trivandrum','India',2020),
(217,'Nikhil Kulkarni','Nashik','India',2022),
(218,'Swati Chatterjee','Bhopal','India',2019),
(219,'Rahul Pandey','Patna','India',2021),
(220,'Divya Tiwari','Indore','India',2023);


-- =========================
-- 4. ORDERS TABLE
-- =========================

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    amount INT,
    order_date DATE,
    
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id),

    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);

INSERT INTO orders VALUES
(1001,201,301,1500,'2024-01-05'),
(1002,202,302,2300,'2024-01-12'),
(1003,203,303,800,'2024-02-03'),
(1004,201,304,3200,'2024-02-14'),
(1005,204,301,1100,'2024-03-01'),
(1006,205,302,4500,'2024-03-15'),
(1007,202,303,950,'2024-03-22'),
(1008,206,304,2100,'2024-04-05'),
(1009,203,301,1750,'2024-04-18'),
(1010,207,302,3300,'2024-04-30'),
(1011,204,303,680,'2024-05-10'),
(1012,208,304,2900,'2024-05-22'),
(1013,205,301,1200,'2024-06-08'),
(1014,201,302,2700,'2024-06-15'),
(1015,209,303,500,'2024-06-28'),
(1016,206,304,3800,'2024-07-07'),
(1017,207,301,1600,'2024-07-19'),
(1018,210,302,4100,'2024-07-25'),
(1019,208,303,720,'2024-08-02'),
(1020,209,304,2200,'2024-08-14');
show tables;
select * from customers;
select * from products;
select * from orders;
select * from employees;


-- Q1. List each department along with the number of employees in it.

select department , count(*) as emp_count from employees 
group by department;


-- Q2. Find departments where the average salary is greater than 60,000.

select e.department , avg(salary) as avg_salary from employees e
group by e.department
having avg(salary) > 60000 ;

-- Q3.Show the total salary paid per department, ordered by total salary descending.

select department , sum(salary) from employees
group by department
order by sum(salary) desc;

-- Q4. Find departments that have more than 4 employees AND an average salary above 55,000.

select * from employees;
select department , count(*) as emp_count, avg(salary) as avg_salary from employees
group by department 
having (emp_count>4 and avg_salary >= 55000);


-- Q5. Using the orders table, find customer_ids who have placed more 
-- than 2 orders and whose total order amount exceeds 5,000.
select * from orders;
select customer_id , count(*) as order_count , sum(amount) as total_amount from orders
group by customer_id 
having count(*) >= 2 and total_amount >5000;











