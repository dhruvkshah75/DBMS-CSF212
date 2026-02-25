-- Q1: In alphabetically ascending order, display all the last names 
-- shared by more than one employee.
select lastName from employees 
group by lastName having count(*) > 1
order by lastName asc;


-- Q2: 2 - Assume that any employee to whom more than 5 people report is considered a ‘supervisor’. In
-- ascending order, display the ID of every such ‘supervisor’ and the number of employees reporting to
-- them.
select employeeNumber as supervisor, count(*) as no_employees
group by reportsTo having count(*) > 5 order by reportsTo asc;


-- Q3: 
select country, avg(creditLimit) as avg_credit from customers 
group by country having avg(creditLimit) < 80000 
order by avg_credit desc limit 1, 1;


-- Q4: 
select productLine, sum(quantityInStock * (MSRP - buyPrice)) 
as total_profit from products
group by productLine order by total_profit desc limit 2;


-- Q5:
-- customers have city and offices have city 
select city from offices where city in (select city from customers);

(select city from offices) 
intersect 
(select city from customers);

-- Q6:
select distinct(reportsTo) from employees
where reportsTo in (select salesRepEmployeeNumber from customers);
-- query 6 using set operations 
(select reportsTo from employees) 
intersect 
(select salesRepEmployeeNumber from customers);

-- Q7:
select jobTitle, count(*) as C from employees
group by jobTitle having jobTitle in ('Sales Rep', 'VP Sales') 
order by C desc;

-- Q8:
select year(orderDate) as year from orders 
group by year 
having shippedDate >= requiredDate 
order by count(*) desc limit 1;

-- Q9:
select count(distinct customerNumber) as Customers from orders 
where customerNumber not in (
    select customerNumber from orders 
    where orderDate < '2005-05-01'
);
-- the inner query gives the black list 
-- we do this as a single customer can have many orders one after the date and one below 


-- Q10: Find the number of customers who have never ordered product number S72_3212.
-- we create a blacklit and then count the no of people not in 
-- as BOB can have a order this and something other 
select count(distinct customerNumber) as Number from orders 
where customerNumber not in (
    select customerNumber from orders where orderNumber in (
        select orderNumber from orderdetails where productCode = 'S72_3212'
    )
);


