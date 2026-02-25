-- Prcactice on Joins and Nested Queries 

-- ========================================
--            INNER JOIN 
-- ========================================

-- Inner Join returns only those records that have matching values on the joining column 

-- inner join is the default join in mysql 

-- example of inner join 
/*

    In inner join order of tables doesnt matter 

    Usage: 
    You use an INNER JOIN when you have a strict "must have" requirement. 
    You use it when you only care about the exact overlap between your tables, 
    and you actively want to filter out any incomplete or unmatched data

    Employees TABLE 
    Emp_id    Name     Dept_id 
    1         Alice    101
    2         Bob      102 
    3         Charlie  101  
    4         David    NULL             => david has no department 

    Department TABLE 
    Dept_id   Dept_Name   
    101       Engineering 
    102       Human resources 
    103       Marketing 

    when we do inner join only matching pairs are returned 
*/

select e.Name, d.Dept_Name from Employees e
inner join Department d on e.Dept_id = d.Dept_id;

/*
    the result of the above query 
    Name     Dept_Name 
    Alice    Engineering 
    Bob      Human resources 
    Charlie  Engineering 
*/


-- ================================================
--              LEFT OUTER JOIN 
-- ================================================

-- Left Join returns all records from the left table, 
-- and the matched records from the right table. 

/*
    The table mentioned first (after FROM) is the "Left" table.
    
    Usage:
    You use a LEFT JOIN when you want to keep ALL records from your primary table,
    even if they don't have a matching connection in the second table.
    
    Employees TABLE (Left Table)
    Emp_id    Name      Dept_id
    1         Alice     101
    2         Bob       102
    3         Charlie   101
    4         David     NULL        => david has no department
    
    Department TABLE (Right Table)
    Dept_id   Dept_Name
    101       Engineering
    102       Human resources
    103       Marketing
    
    when we do a left join, all employees are returned because Employees is the left table. 
    If an employee has no matching department, the Dept_Name will just be NULL.

    left join => left outer join (both are equivalent)
*/

select e.Name, d.Dept_id from Employees e 
left join Department d on e.Dept_id = d.Dept_id;

/*
    the result of the above query
    Name      Dept_Name
    Alice     Engineering
    Bob       Human resources
    Charlie   Engineering
    David     NULL
*/


-- =============================================
--              RIGHT OUTER JOIN 
-- =============================================

/*
    The table mentioned second (after the join clause) is the "Right" table.
    
    Usage:
    You use a RIGHT JOIN when your primary focus is the second table, and you 
    want to see all of its records regardless of whether they have a match 
    in the first table.
    
    Employees TABLE (Left Table)
    Emp_id    Name      Dept_id
    1         Alice     101
    2         Bob       102
    3         Charlie   101
    4         David     NULL        => david has no department
    
    Department TABLE (Right Table)
    Dept_id   Dept_Name
    101       Engineering
    102       Human resources
    103       Marketing           => Marketing has no employees
    
    when we do a right join, all departments are returned because Department 
    is the right table. If a department has no matching employees, the Name 
    will just be NULL.
*/

select e.Name, d.Dept_Name from Employees e
right outer join Department d on e.Dept_id = d.Dept_id;

/*
    the result of the above query
    Name      Dept_Name
    Alice     Engineering
    Charlie   Engineering
    Bob       Human resources
    NULL      Marketing
*/


-- ==========================================
--               FULL OUTER JOIN
-- ==========================================

-- Full Outer Join returns all records when there is a match in 
-- either the left or right table.

/*
    In a full outer join, the order of tables does not matter logically 
    because all records from BOTH tables are returned. 
    
    Usage:
    You use a FULL OUTER JOIN when you want to see absolutely everything—
    all matched pairs, all orphaned records from the left, and all 
    orphaned records from the right.
    
    Employees TABLE (Left Table)
    Emp_id    Name      Dept_id
    1         Alice     101
    2         Bob       102
    3         Charlie   101
    4         David     NULL        => david has no department
    
    Department TABLE (Right Table)
    Dept_id   Dept_Name
    101       Engineering
    102       Human resources
    103       Marketing           => Marketing has no employees
    
    When we do a full outer join, we get the exact matches (Alice, Bob, Charlie), 
    plus the unmatched employee (David), plus the unmatched department (Marketing).
*/

select e.Name, d.Dept_Name from Employees e
full outer join Department d on e.Dept_id = d.Dept_id;

/*
    the result of the above query (in databases that support it, like PostgreSQL or SQL Server):
    Name      Dept_Name
    Alice     Engineering
    Bob       Human resources
    Charlie   Engineering
    David     NULL
    NULL      Marketing
*/


-- ==========================================
--     FULL OUTER JOIN (MySQL WORKAROUND)
-- ==========================================

/*
    Because standard MySQL throws a syntax error if you try to use 
    "FULL OUTER JOIN", we must simulate it.
    
    We do this by taking a LEFT JOIN, taking a RIGHT JOIN, and stacking 
    them together using UNION. The UNION operator automatically removes 
    the duplicate matched rows.
*/

select e.Name, d.Dept_Name from Employees e
left join Department d on e.Dept_id = d.Dept_id
UNION
select e.Name, d.Dept_Name from Employees e
right join Department d on e.Dept_id = d.Dept_id;

/*
    the result of the above query:
    Name      Dept_Name
    Alice     Engineering
    Bob       Human resources
    Charlie   Engineering
    David     NULL                => from the Left Join
    NULL      Marketing           => from the Right Join
*/
