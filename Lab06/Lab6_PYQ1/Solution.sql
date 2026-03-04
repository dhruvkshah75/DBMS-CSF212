-- Solution of the py lab on joins and cross joins 

-- Q1 
select p.productLine,  count(distinct p.productCode) as OrderedProducts 
from products p inner join orderdetails od on p.productCode = od.productCode
group by p.productLine 
order by OrderedProducts desc;

-- we must count only the distinct product codes as the same product line can appear in multiple cases 

-- Q5 ==> solve Q1 using cross join 
-- it will form all the possible combinations 
select p.productLine, count(distinct p.productCode) as OrderedProducts
from products p cross join orderdetails od 
where od.productCode = p.productCode  -- this includes all the one that we actually want 
group by p.productLine
order by OrderedProducts desc;


-- Q2 
-- for the same order number we have multiple productCodes => we must do self join 
select 
    p1.productLine as productLine1, 
    p2.productLine as productLine2, 
    count(distinct od1.orderNumber) as ordersTogethor
from 
    orderdetails od1 
    inner join orderdetails od2 on od1.orderNumber = od2.orderNumber 
    inner join products p1 on od1.productCode = p1.productCode
    inner join products p2 on od2.productCode = p2.productCode
where 
    p1.productLine < p2.productLine  -- to prevent 'classic car' doesnt go with itself 
group by 
    p1.productLine, p2.productLine
order by 
    ordersTogethor
desc limit 3;


-- Q6 using cross products 
-- since we wants to get two productLines from the same order number => we must do self join 

select 
    p1.productLine as productLine1,
    p2.productLine as productLine2,
    count(distinct od1.orderNumber) as ordersTogethor
from orderdetails od1 
cross join orderdetails od2 cross join products p1 cross join products p2
where 
    od1.orderNumber = od2.orderNumber and od1.productCode = p1.productCode 
    and od2.productCode = p2.productCode and p1.productLine < p2.productLine 
group by 
    p1.productLine, p2.productLine
order by 
    ordersTogethor 
desc limit 3;


-- Q3
-- Find customers who have never placed an order => use left join and search for null 
select 
    c.customerName as Customer, 
    e.firstName as SalesRep, 
    o.city as OfficeCity
from 
    (customers c inner join (employees e inner join offices o on e.officeCode = o.officeCode)
    on c.salesRepEmployeeNumber = e.employeeNumber)
    left join orders od on c.customerNumber = od.customerNumber 
where 
    od.orderNumber is NULL 
order by Customer asc;



-- Q7  ==> Q3 using cross joins 
select 
    c.customerName as Customer, 
    e.firstName as SalesRep,
    o.city as OfficeCity 
from 
    -- this is alternate syntax fro cross join 
    customers c, employees e, offices o
where 
    c.salesRepEmployeeNumber = e.employeeNumber and e.officeCode = o.officeCode  
    and c.customerNumber not in (select customerNumber from orders)
order by Customer asc;

-- for left join we check the primary key to be null but cant do that in cross join 
-- so we dont join the one that we dont want we just do customerNumber not in 



-- Q4 
select 
    e.firstName as SalesRep, 
    count(distinct c.customerNumber) as TotalCustomers, 
    sum(od.priceEach * od.quantityOrdered) as TotalOrderValue
from 
    employees e inner join customers c on e.employeeNumber = c.salesRepEmployeeNumber
    inner join orders o on c.customerNumber = o.customerNumber
    inner join orderdetails od on od.orderNumber = o.orderNumber
group by 
    e.employeeNumber
having 
    TotalOrderValue > 800000
order by TotalOrderValue desc;



-- Q8 => the above query using cross join 
select 
    e.firstName as SalesRep,
    count(distinct c.customerNumber) as TotalCustomers, 
    sum(od.priceEach * od.quantityOrdered) as TotalOrderValue
from 
    employees e, customers c, orders o, orderdetails od
where
    e.employeeNumber = c.salesRepEmployeeNumber and c.customerNumber = o.customerNumber
    and o.orderNumber = od.orderNumber
group by 
    e.employeeNumber
having 
    TotalOrderValue > 800000
order by TotalOrderValue desc;



