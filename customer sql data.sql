create Database xyz;
use xyz;
create table customers(cust_id int, first_name char(15), second_name char (15), country char(10));
show tables;
desc customers;
insert into customers(cust_id, first_name, second_name, country) values (1, "John", "carter", "Australia");
insert into customers(cust_id, first_name, second_name, country) values (2, "Andrew", "NG","USA");
insert into customers values (3, "Steve", "Smith", "Australia");
select * from customers;
set sql_safe_updates = 0;
update customers set first_name = "Nicole" where cust_id = 1;
select * from customers;

 delete from customers first_name where cust_id = 2;
 select * from customers;
insert into customers(cust_id, first_name, second_name, country) values (2, "Andrew", "NG","USA");
insert into customers values (3, "Steve", "Smith", "Australia");
select * from customers;

truncate customers;
 insert into customers(cust_id, first_name, second_name, country) values (1, "John", "carter", "Australia");
insert into customers(cust_id, first_name, second_name, country) values (2, "Andrew", "NG","USA");
insert into customers values (3, "Steve", "Smith", "Australia");
select * from customers;
set sql_safe_updates = 0;
update customers set first_name = "Nicole" where cust_id = 1;
select * from customers;

-- select

use hr;
desc employees;
select * from employees;

-- wildcards : always used with like operators 
-- "-", "_", "[]", "^", "%"

show tables;
select * from employees;
select first_name from employees;
select salary from employees where salary is null;
select employee_id, salary from employees where salary > 1000;
select employee_id, salary from employees where salary <= 10000;
select employee_id, salary, first_name from employees where employee_id in(101,105,110);
select * from employees where first_name like "%s";
select * from employees where first_name like "s%";
select * from employees where salary between 3000 and 10000;
select distinct(salary) from employees;

-- set operations
-- union
-- union all
-- minus 
-- intersection 

-- aggregate function 
-- sum
-- min 
-- max
-- avg
-- count 

use hr;
select * from departments;
select sum(salary) from employees;
select avg(salary) from employees;
select distinct(count(salary)) from employees;
select count(distinct(salary)) from employees;

-- order by
select * from employees order by salary;
select employee_id, first_name, salary
from employees
order by salary desc limit 5;

-- group by 
select count(distinct(department_id))
from employees
group by department_id;

use hr;
select * from employees;
select employee_id, salary, hire_date, sum(salary)
from employees
group by employee_id, salary, hire_date;

select * from employees;
select employee_id, salary, hire_date, sum(salary)
from employees
group by employee_id, salary, hire_date
having sum(salary)>10000;

select salary from employees having salary>10000;

-- joins
-- natural join 
-- self join 
-- inner join - by default
-- left join 
-- right join 
-- cross join 

select * from departments;
select * from employees;

select * from departments as d join employees e on d.department_id = e.department_id;
select employee_id, d.department_id, salary 
from departments as d join employees e on d.department_id = e.department_id;

select employee_id, department_id, salary from employees;

select * from employees natural join departments;
select * from employees natural join job_history;
select * from employees cross join job_history;
use hr;
select * from departments;
select * from employees;
select * from employees natural join departments;
select * from employees e left join departments d on e.department_id = d.department_id;

select employee_id, first_name, salary,department_name
from employees e right join departments d
on e.department_id = d.department_id;

select * from employees e left join departments d on e.department_id = d.department_id union
select * from employees e right join departments d on e.department_id = d.department_id;

select employee_id, salary, department_name
from employees e join departments d on e.department_id = d.department_id
where salary > 10000;

-- select * from employees e full join on departments d on e.department_id = d.department_id;
select e1.employee_id, e2.first_name, e1.hire_date, e2.salary
from employees as e1 join employees e2 on e1.hire_date = e2.hire_date;


 





 