create database subquery;
-- Create Table
use subquery;
CREATE TABLE Employees (
EMP_ID INT PRIMARY KEY,
NAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALARY INT,
MANAGER_ID INT
);
-- Insert Data
INSERT INTO Employees (EMP_ID, NAME, DEPARTMENT, SALARY, MANAGER_ID) VALUES
(101, 'Alice', 'HR', 50000, NULL),
(102, 'Bob', 'IT', 80000, 101),
(103, 'Charlie', 'IT', 75000, 101),
(104, 'Diana', 'Finance', 90000, NULL),
(105, 'Eve', 'HR', 48000, 101),
(106, 'Frank', 'Finance', 95000, 104),
(107, 'Grace', 'IT', 82000, 101);
select * from employees;
create table departments(dept_id int, dept_name varchar(20), location varchar(20));

insert into departments values(10, 'HR' , 'Mumbai'), (20, 'IT', 'Banglore'), (30, 'Finance', 'Delhi');
select dept_name from departments where location in ('Banglore', 'Delhi') ;
select * from employees
where department in (select dept_name from departments where location in ('Banglore', 'Delhi')) ;
select * from employees
where department = any (select dept_name from departments where location in ('Banglore', 'Delhi')) ;
select*from employees as e where salary > (select avg(salary) from employees where department = e.department) ;
select * from employees;
-- find out those emoplyees who have highest salary of their own depatment--
select max(salary) from employees where department = 'IT';
select * from employees as eout where 
salary = (select max(salary) from employees where department = eout.department);
select * from employees as e where 50000 <= all(select salary from employees where department = e.department);

-- windows function 
use joinpractice;
show tables;
select * from employees;
-- partition by 
select * from employees;
select *, sum(salary) over ( partition by department),
sum(salary) over() from employees;

select *, sum(salary) over ( partition by name) from employees;
select *, sum(salary) over ( partition by manager_id) from employees;

select *, sum(salary) over ( partition by department order by salary) from employees;
select name , department, salary, sum(salary) over(partition by department),
(salary/sum(salary) over(partition by department))*100 from employees;
-- Windows 

create database windowsdb;
use windowsdb;


-- ============================================
--  Create the employees table
-- ============================================
CREATE TABLE employees (
  emp_id    INT,
  name      VARCHAR(50),
  dept      VARCHAR(30),
  salary    INT,
  hire_year INT
);
 
-- ============================================
--  Insert sample data (12 employees)
-- ============================================
INSERT INTO employees VALUES
  (1,  'Alice',   'IT',      90000, 2019),
  (2,  'Bob',     'IT',      75000, 2020),
  (3,  'Charlie', 'IT',      82000, 2018),
  (4,  'Diana',   'HR',      68000, 2021),
  (5,  'Eve',     'HR',      72000, 2019),
  (6,  'Frank',   'HR',      65000, 2022),
  (7,  'Grace',   'Sales',   55000, 2020),
  (8,  'Henry',   'Sales',   60000, 2021),
  (9,  'Iris',    'Sales',   58000, 2019),
  (10, 'Jack',    'Finance', 95000, 2017),
  (11, 'Karen',   'Finance', 88000, 2018),
  (12, 'Leo',     'Finance', 91000, 2020);



select * from employees;
 select *, sum(salary) over( partition by hire_year order by salary ) from employees;
  select *, max(salary) over( partition by dept order by hire_year ) from employees;
  select *, sum(salary) over( partition by dept order by hire_year ) from employees;
  select *, avg(salary) over( partition by dept), 
  case 
      when salary> avg(salary) over(partition by dept) then 'Above avg salary'
      else 'Less than avg salary'
      end 
      from employees;

select * , row_number() over(order by emp_id) from employees;
select *,row_number() over( order by emp_id) from employees;
select *, row_number() over(partition by dept) from employees;
-- comparison 
select *,rank() over( partition by dept order by salary) from employees;























