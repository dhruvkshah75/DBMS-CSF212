/*
    Q1A. Create a view named "Salesman_Sales_Total" that 
    displays the total sales made by each salesman.
*/
create view Salesman_Sales_Total as 
select
    s.salesman_id, 
    s.name as salesman_name,
    sum(o.amount) as total_sales
from orders o inner join salesman s on o.salesman_id = s.salesman_id
group by salesman_id;  


/*
    Q1B. Create a user-defined function that takes sales_id as 
    the input and returns the total sales of the salesperson.
*/
DELIMITER $$  -- MySQL use $$ as the end of line 

create function sales_total(s_id int) returns decimal(10, 2)
DETERMINISTIC             -- means that the same input will always gives the same output 
begin 
    declare tot_sales decimal(10, 2);
    -- directly search from the view 
    select total_sales into tot_sales from Salesman_Sales_Total
    where salesman_id = s_id; 
    return tot_sales;
end $$      -- ← MySQL sees $$ and says "NOW execute the whole function"

DELIMITER ;  -- MySQL now start using ; as the end back to normal 

select sales_total(101);

/*
    Q1C. Find the sales total sales done by the salesman with id no. 106.
*/
select salesman_id, name, sales_total(salesman_id) as total_sales from salesman 
where salesman_id = 106;


-- ===========================================================================

/*
    Q2A Create a view with only customer id, customer name and level from customers table
*/

create view level_view as 
select customer_id, c_name, level from customers;

/*
    Q2B.Write a user-defined function that takes the customer id as the input and
        returns the letter grade based on their level using the above view. If the level is
        100, the grade is ‘C’, if the level is 200, the grade is ‘B’ and if the level is 300, the
        grade is ‘A’.
*/

DELIMITER $$

create function levelGrade(c_id int) returns char  
DETERMINISTIC
begin 
    declare customer_level int;
    declare grade char;           -- we will return this value 

    select level into customer_level from level_view
        where customer_id = c_id;

    if customer_level = 100 then 
        set grade = 'C';
    elseif customer_level = 200 then 
        set grade = 'B';
    elseif customer_level = 300 then  
        set grade = 'A';
    end if;

    return grade;
end $$

DELIMITER ;


-- Q2C Display the grade of the customer with id 504

select levelGrade(504) as customer_grade;