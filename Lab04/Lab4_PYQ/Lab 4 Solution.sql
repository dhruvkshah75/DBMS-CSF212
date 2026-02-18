select distinct(city) from offices where city in (
    select city from customers
) order by city;

select distinct(productName) from products where productCode not in (
    select productCode from orderdetails
) order by productName;

select customerName from customers where customerNumber in (
    select customerNumber from payments 
    where amount >= all (select amount from payments)
);


select distinct(city) from offices where country in (
    select country from customers where customerNumber in (
        select customerNumber from payments where checkNumber = 'CITI3434344'
)) order by city;


select productName from products where productCode in (
    select productCode from orderdetails where orderNumber in (
        select orderNumber from orders where year(orderDate) = 2005 
        and customerNumber in (
            select customerNumber from customers where city = 'Kobenhavn'
))) order by productName;






select distinct(o.city) from offices o INNER JOIN customers c ON o.city = c.city order by o.city;
select distinct(p.productName) from products p LEFT JOIN orderdetails o ON p.productCode = o.productCode where o.productCode is null order by p.productName;
select c.customerName from customers c INNER JOIN payments p ON c.customerNumber = p.customerNumber order by p.amount desc LIMIT 1;
select distinct(o.city) from (offices o INNER JOIN customers c ON o.country = c.country) INNER JOIN payments p ON c.customerNumber = p.customerNumber where p.checkNumber = 'CITI3434344' order by o.city;
select p.productName from ((products p INNER JOIN orderdetails od ON p.productCode = od.productCode) INNER JOIN orders o ON od.orderNumber = o.orderNumber) INNER JOIN customers c ON c.customerNumber = o.customerNumber where c.city = 'Kobenhavn' and year(o.orderDate) = 2005 order by p.productName;