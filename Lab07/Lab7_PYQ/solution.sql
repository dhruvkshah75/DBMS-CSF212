
-- ============================== Q1 ===========================================
-- Q1:
DELIMITER $$

create function commission_earned(s_id int) returns decimal(10, 2)
DETERMINISTIC 
READS SQL DATA 
begin 
    declare commission decimal(10, 2);
    -- sum(amount) is the total sales made by the customer 
    select 0.1 * sum(amount) into commission from orders 
        where salesman_id = s_id;

    return commission;
end $$ 

DELIMITER ;

-- Q1 B 
select 
    salesman_id, name, city, salary, commission_earned(salesman_id) as commission    
from salesman 
where commission_earned(salesman_id) < 1000;

-- ============================== Q2 ===========================================
-- Q2 A
create view nameorders as 
select 
    o.order_no, o.amount, o.salesman_id, s.name, c.c_name, c.level 
from orders o inner join customers c on o.customer_id = c.customer_id 
    inner join salesman s on o.salesman_id = s.salesman_id;

-- Q2 B
select * from nameorders;

-- Q2C 
/*
    ANSWER: 
    Inserting into nameorders fails because it is a multi-table JOIN view, 
    which MySQL considers non-updatable. MySQL cannot determine which base table 
    (orders, salesman, or customers) should receive the new row, 
    so the operation is rejected with an error
*/

-- ============================ Q3 =============================================
-- Q3 A
DELIMITER $$

create function total_purchase_amount(customer_name varchar(50)) returns decimal(10, 2)
DETERMINISTIC
begin 
    declare total_amount decimal(10, 2);

    select sum(o.amount) into total_amount 
    from orders o inner join customers c on o.customer_id = c.customer_id
    where c.c_name = customer_name;

    return total_amount;
end $$ 

DELIMITER ;

-- Q3 B 
select c_name, total_purchase_amount(c_name) as totalPurchaseAmount from customers
where c_name = 'Brad Pitt';



-- ============================ Q4 ===============================================
-- Q4 A 
create view ny_salespeople as 
select * from salesman where city = 'New York'; 

-- Q4 B 
select * from ny_salespeople; 

-- Q4 C 
insert into ny_salespeople (salesman_id, name, city, salary)
values (107, 'The Rock', 'New York', 3000);
/*
    Yes! The insert works and directly affects the salesman table because 
    ny_salespeople is an updatable view — it is based on a single table with no JOINs, 
    no aggregations, and no DISTINCT
*/