-- Student Solution
-- IMPORTANT INSTRUCTIONS: Rename this file to <your_student_id>_Lab7.sql
-- Example: 2021A7PS0001G_Lab7.sql
--
-- Make sure the views and function name match as in the question.
-- Make sure to turn the delimiter back to a semicolon(;) after ending a function.
-- If you don't know the answer to a question, just write a semicolon (;)
-- DO NOT CHANGE OR REMOVE THE QUERIES GIVEN IN THE TEMPLATE FILE FOR 1B, 2B, 3B, 4B, AND 5C

-- DO NOT COPY '->' character from MySQL in the solution file
-- IMPORTANT: Multiline query is acceptable, but make sure words don't break into new lines, i.e., a complete word/string should remain in a single line.
-- Example of wrong query:(table name breaking into new line)
--           SELECT * FROM PASSE
--           NGERS; 
-- Example of wrong query: (keyword breaking into new line)
--           SELECT passenger_id FROM PASSENGERS UNI
--           ON SELECT passenger_id FROM TICKETS;
-- Example of wrong query: (string breaking into new line)
--          SELECT passenger_id FROM PASSENGERS WHERE name = "John
--          Wick"

-- Q1a: CREATE FUNCTION
DELIMITER $$ 
create function calculate_bonus(employee_id int) returns decimal(10, 2)
DETERMINISTIC 
begin 
    declare emp_salary decimal(10, 2); 
    declare bonus decimal(10, 2);
    declare emp_job_role varchar(50);
    
    select salary into emp_salary from Employees where emp_id = employee_id;
    select job_role into emp_job_role from Employees where emp_id = employee_id;

    if emp_job_role = 'Manager' then 
        set bonus = 0.2 * emp_salary;
    else 
        set bonus = 0.1 * emp_salary;
    end if;
    return bonus;
end $$ 
DELIMITER ;

-- Q1b: Execute SELECT
Select calculate_bonus(109);

-- Q2a: CREATE VIEW
create view it_staff as 
select * from Employees where dept_id = 1;

-- Q2b: Execute SELECT
SELECT * FROM it_staff;

-- Q3a: CREATE VIEW
create view emp_locations as 
select e.emp_id, e.emp_name, d.dept_name, d.location from Employees e 
inner join Departments d on e.dept_id = d.dept_id;

-- Q3b: Execute SELECT 
SELECT * FROM emp_locations;

-- Q4a: CREATE FUNCTION
DELIMITER $$ 
create function get_tax_bracket(employee_id int) returns varchar(15)
DETERMINISTIC
begin 
    declare emp_salary decimal(10, 2);
    declare tax_bracket varchar(15);
    select salary into emp_salary from Employees where emp_id = employee_id;

    if emp_salary >= 90000 then
        set tax_bracket = 'High';
    end if;

    if emp_salary >= 60000 and emp_salary <= 89999 then
        set tax_bracket = 'Medium';
    end if;

    if emp_salary < 60000 then
        set tax_bracket = 'Low';
    end if; 

    return tax_bracket;
end $$
DELIMITER ;

-- Q4b: Execute SELECT 
SELECT get_tax_bracket(104);

-- Q5a: CREATE VIEW
create view low_salary_group as 
select * from Employees where get_tax_bracket(emp_id) = 'Low';

-- Q5b: UPDATE (make sure to use VIEWS, FUNCTIONS created above)
update low_salary_group
set salary = salary + calculate_bonus(emp_id);

-- Q5c: Execute SELECT
SELECT emp_id, salary FROM Employees WHERE emp_id=109;

-- End of solution
