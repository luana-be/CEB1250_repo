-- Write a SQL query to get the third highest salary of an employee from employee_table
create or replace view highest_salaries as select * from salaries order by salary desc limit 3
-- to see <who> has the third highest salary:
select * from employees where emp_no = 
 (select emp_no from highest_salaries order by salary asc limit 1)
-- to see <which> one is third highest salary:
select emp_no, salary from highest_salaries order by salary asc limit 1
 
-- Write a SQL query to find the names of employees that begin with ‘A’
select first_name from employees where first_name like 'A%'

-- What is the difference between ‘HAVING’ CLAUSE and a ‘WHERE’ CLAUSE
-- in the two cases below, they both return the same content
select first_name from employees where first_name like 'A%'
select first_name from employees having first_name like 'A%'
-- however, when using the aggregation operator "group by", only "having" is allowed
-- this works:
select first_name, count(*) as amt_of_fei from employees where first_name = 'Fei'
-- this outputs nothing:
select first_name, count(*) as amt_of_fei from employees having first_name = 'Fei'
-- this works:
select first_name, count(*) as amt_of_fei from employees group by first_name having first_name = 'Fei'
-- this does not work:
select first_name, count(*) as amt_of_fei from employees group by first_name where first_name = 'Fei'

-- List, and explain the elements of an Entities and Relationships model
-- What are the different categories of SQL statements, what does each group do
-- List and explain the different types of joins
-- What is the difference between NULL value, Zero, and Blank space

-- Write a SQL that returns the employee name and title for all employees with even number as actual salary (to_date is 9999-01-01)
create or replace view even_salaries as select * from salaries where mod(salary,2) = 0 and to_date ='9999-01-01'

create or replace view employees_with_even_salaries as
select distinct first_name, last_name, employees.emp_no, to_date, salary 
from employees inner join even_salaries on employees.emp_no=even_salaries.emp_no
 
select distinct first_name, last_name, title, salary, titles.emp_no, employees_with_even_salaries.to_date 
from titles inner join employees_with_even_salaries on employees_with_even_salaries.emp_no=titles.emp_no

-- What is wrong with the following query, re-write it making the needed corrections.
-- SELECT employee.emp_no, AVG(salaries.salary)
-- FROM employee INNER JOIN salaries AT employee.emp_no = salaries.emp_no
-- HAVING AVG(salaries.salary) > 10000
-- GROUP BY employee.emp_no

SELECT employees.emp_no, AVG(salaries.salary)
FROM employees INNER JOIN salaries ON employees.emp_no = salaries.emp_no
GROUP BY employees.emp_no
HAVING AVG(salaries.salary) > 10000
