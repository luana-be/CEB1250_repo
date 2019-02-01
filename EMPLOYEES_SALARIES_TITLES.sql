-- Get all female employees
select * from employees where gender = 'F'

-- Get all employees hired after 01-01-1995
select * from employees where hire_date > '1995-01-01'

-- Get all the valid titles (with to_date equals to 01-01-9999)
select title from titles where to_date = '9999-01-01'

-- Get all salaries from 60000 to 90000
select * from salaries where salary >= 60000 and salary <= 90000

-- Get all titles where title is equal to engineer
select * from titles where title = 'engineer'

-- Insert a new row into course table with 1, ‘CED-1250’, ‘Big Data Storage’
-- see COURSE.sql script

-- Delete all male employees hired at 01-01-2009
delete from employees where gender = 'M' and hire_date = '2009-01-01'

-- Update the salary of employee 499984 to 100000
update salaries
set salary = 100000
where emp_no = 499984;

-- Delete all titles not valid (with to_date not equal to 01-01-9999)
delete from titles where to_date != '9999-01-01'