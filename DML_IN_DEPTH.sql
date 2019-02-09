-- Write a SQL query to get the third highest salary of an employee from employee_table
create or replace view highest_salaries as select * from salaries order by salary desc limit 3
-- to see <who> has the third highest salary:
select * from employees where emp_no = 
 (select emp_no from highest_salaries order by salary asc limit 1)
-- to see <which> one is third highest salary:
select emp_no, salary from highest_salaries order by salary asc limit 1
 
-- Write a SQL query to find the names of employees that begin with ‘A’

-- What is the difference between ‘HAVING’ CLAUSE and a ‘WHERE’ CLAUSE
-- List, and explain the elements of an Entities and Relationships model
-- What are the different categories of SQL statements, what does each group do
-- List, and explain, the different types of joins
-- What is the difference between NULL value, Zero, and Blank space
-- Write a SQL that returns the employee name and title for all employees with even number as actual salary (to_date is 9999-01-01)
-- What is wrong with the following query, re-write it making the needed corrections.
-- SELECT employee.emp_no, AVG(salaries.salary)
-- FROM employee INNER JOIN salaries AT employee.emp_no = salaries.emp_no
-- HAVING AVG(salaries.salary) > 10000
-- GROUP BY employee.emp_no