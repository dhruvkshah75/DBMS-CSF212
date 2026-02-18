select lastName from employees 
group by lastName having count(*) > 1 order by lastName;


select reportsTo as supervisor, count(*) as no_employees from employees 
group by reportsTo having count(*) > 5 order by reportsTo;

select country, AVG(creditLimit) as avg_credit from customers 
group by country having avg_credit < 80000 order by avg_credit desc LIMIT 1, 1;

select productLine, SUM(quantityInStock * (MSRP - buyPrice)) as total_profit from products 
group by productLine order by total_profit desc LIMIT 2;

select city from offices where city in (select city from customers);


select distinct(reportsTo) from employees 
where reportsTo in (select salesRepEmployeeNumber from customers);


select jobTitle, count(*) as C from employees 
group by jobTitle having jobTitle = 'Sales Rep' or jobTitle = 'VP Sales' 
order by C desc;

select year(orderDate) as year from orders 
where shippedDate >= requiredDate group by year 
order by count(*) desc LIMIT 1;

select count(distinct(customerNumber)) as Customers from orders 
where orderDate >= '2005-05-01'; --not correct

select count(customerNumber) as Number from customers 
where customerNumber NOT IN 
(select customerNumber from orders where orderNumber IN 
(select orderNumber from orderdetails where productCode = 'S72_3212'));