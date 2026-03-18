-- Notes

-- SYNTAX 
-- this creates a virtual table with names of employees with salary more than 10000 
create view emp_view as 
select emp_name, salary, emp_dept from employees where salary > 10000;

-- we can have subsequent quesries to be made on this view 
select * from emp_view where emp_name = 'Alice';

-- You can also modify a view using the ALTER VIEW statement, or delete it using the DROP VIEW statement.
drop view emp_view;

-- view can be updated in the following way 
-- if the view with this name exists it overwrites the previous one 
create or replace view active_employees as 
select id, emp_name, dept_name, salary from employees where active_status = 'active';

-- now we can make queries to this => eg. get the names of active HR employees 
select emp_name from active_employees where dept_name = 'HR';

/*
    In MySQL, a user-defined function (UDF) is a function that is created by the
    user and can be used in SQL statements just like built-in functions. A UDF
    can take parameters and return a value, and can be used to perform custom
    calculations, manipulate data, or perform other operations.

    Within the function body, you can write any valid SQL statements, including
    SELECT, INSERT, UPDATE, and DELETE statements. You can also use control
    flow statements like IF, WHILE, and CASE
*/

-- a simple User defined function to get the sum of two ints 
create function add_numbers(a int, b int) returns int 
begin 
    declare result int; 
    set result = a + b;  
    return result;
end;

select add_numbers(2, 3);  -- => returns 5 

-- Write a MySQL function to calculate the total sales made by a given salesman
create function total_sales(salesman_id int) returns decimal(10, 2)
begin 
    declare total decimal(10, 2);
    select sum(amount) into total from orders where salesman_id = salesman_id;  -- use into to put the value into total 
    return total;
end;


