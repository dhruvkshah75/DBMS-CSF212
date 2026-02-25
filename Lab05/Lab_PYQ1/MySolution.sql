-- using nested queries 

-- ========================================
-- Q1
select city from offices 
where city in (select city from customers) 
order by city asc;

/*
The Simplification: You don't actually need to check customerNumber inside the subquery. 
if a city appears in the customers table even once, 
it means at least one customer lives there
*/

-- Q6 => Q1 using join
select distinct o.city from offices o
inner join customers c on o.city = c.city
order by o.city asc;

-- =========================================
-- Q2
select productName from products 
where productCode not in (
    select productCode from orderdetails
) 
order by productName asc;


-- Q7 => Q2 solved using joins 
select distinct p.productName from products p
left join orderdetails o on p.productCode = o.productCode
where o.productCode is NULL
order by p.productName asc;



-- =======================================
-- Q3
select customerName from customers 
where customerNumber in (
    -- get the customer number who makes the largest payment 
    select customerNumber from payments
    where amount >= all(
        select amount from payments
    )
);

-- Q8 => solved this using joins 
-- using this since the tables join we can just order them descending 
select c.customerName from customers c
inner join payments p on c.customerNumber = p.customerNumber
order by p.amount desc limit 1;



-- ========================================== 
-- Q4

select city from offices where country in (
    select country from customers where customerNumber in (
        select customerNumber from payments 
        where checkNumber = 'CITI3434344'
    )
) order by city;


-- Q9 => using joins 
-- we connect 3 tables => first connect 2 and then the third to it to make a big table 
select distinct o.city from (offices o inner join customers c on o.country = c.country) 
inner join payments p on c.customerNumber = p.customerNumber
where checkNumber = 'CITI3434344'
order by o.city asc;



-- ==============================================
-- Q5
select productName from products 
where productCode in (
    select productCode from orderdetails 
    where orderNumber in (
        select orderNumber from orders 
        where year(orderDate) = 2005 and customerNumber in (
            select customerNumber from customers 
            where city = 'Kobenhavn'
        )
    )
) order by productName;


-- Q10 using joins 
-- we connect 4 tables 
select p.productName from (
    (products p inner join orderdetails o on p.productCode = o.productCode) 
    inner join orders on o.orderNumber = orders.orderNumber
) inner join customers c on orders.customerNumber = c.customerNumber
where year(orders.orderDate) = 2005 and 
c.city = 'Kobenhavn' order by p.productName asc;