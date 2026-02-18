-- Q1:
select distinct city from offices where city in (
    select city from customers 
) order by city asc;

-- Q2:
select productName from products where productCode not in (
    select productCode from orderdetails
) order by productName asc;

-- Q3: Find the customer whose payment is greater than or equal to every single payment ever made
select customerName from customers where customerNumber in (
    select customerNumber from payments 
    where amount >= all(select amount from payments)
);  -- >= makes sense it will find out the max payment made by that customer 


-- Q4: 
select distinct(city) from offices where country in (
    select country from customers where customerNumber in (
        select customerNumber from payments 
        where checkNumber = 'CITI3434344'
    )
) order by city asc;


-- Q5: 
select productName from products where productCode in (
    select productCode from orderdetails where orderNumber in (
        select orderNumber from orders where year(orderDate) = 2005 and 
        customerNumber in (
            select customerNumber from customers where city = 'Kobenhavn'
        )
    )
) order by productName asc;