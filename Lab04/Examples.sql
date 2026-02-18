-- create tables 
CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    salary INT NOT NULL,
    role VARCHAR(100) NOT NULL
);

CREATE TABLE awards(
    id INT PRIMARY KEY,
    employee_id INT NOT NULL,
    award_date DATE NOT NULL
);

-- Q1: Select all employees who won an award.
select * from employee 
where id IN (select employee_id from awards); 
-- the inner query returns all the employee ids in the awards table then the outer query runs through the 
-- entire employees table and then check for employee ids in that list made by the inner query 

-- Q2: Select all the employees who did not won any award 
select * from employee 
where id not in (select employee_id from awards);

-- Q3: Select all Developers who earn more than all the Managers
select * from employee 
where role = 'Developer' 
and salary > all(select salary from employee where role = 'Manager');
-- the inner query gives the list of all the salaries earned by manager 
-- => the outer query checks if there is devloper with salary more than all the given list 

-- Q4: Select all Developers who earn more than any Manager
select * from employee
where role = 'Devloper'
and salary > any(select salary from employee where role = 'Manager');


-- CORELATED QUERIES 

-- Q1: Select all employees whose salary is above the average salary of employees in their role.
select * from employee emp1 
where salary > (
    select avg(salary) from employees emp2 where emp1.role = emp2.role
);


-- Q2: Find courses offered in Fall 2017 and in Spring 2018
select distinct course_id from section 
where semester = 'Fall' and year = 2017 
and course_id in (select course_id from section 
                    where semester = 'Spring' and year = 2018);


-- Q3: Find courses offered in Fall 2017 but not in Spring 2018
select distinct course_id from section
where semester = 'Fall' and year= 2017 and course_id not in (
    select course_id from section where semester = 'Spring' and year = 2018
);

-- Q4: Name all instructors whose name is neither “Mozart” nor “Einstein”.
select distinct name from instructors 
where name not in ('Mozart', 'Einstein');

-- Q5: Find the total no of(distinct)students who have taken course sections taught by the instructor with ID 10101
select count(distinct ID) from takes 
where (course_id, sec_id, semester, year) 
in (select course_id, sec_id, semester, year from teaches where teaches.ID = 10101);



-- "GROUP BY" 

-- VERY IMPORTANT NOTE: 
-- If a particular column has the same values in different rows, then it will arrange these rows in a group


-- Q1: Find the number of customers in each country
select COUNT(customerID) as CustomerCount, Country from customers group by country;

-- for group by multiple columns => it groups by "unique combination"
select country, state, min(age) as min_age 
from persons group by country, state;



-- "HAVING Clause"
-- WHERE SUM(Salary) > 10000, the database gets confused because it hasn't finished summing anything yet

select City, AVG(Salary) from Employees
where Role = 'Developer'       -- Step 1: Throw out everyone who isn't a Developer
group by City                  -- Step 2: Group the remaining Developers by City
having AVG(Salary) > 80000;    -- Step 3: Only show cities with a high average


-- VERY IMPORTANT 
-- Q: List the number of customers in each country, 
-- sorted high to low (Only include countries with more than 5 customers)
select count(customerID), country from customers 
group by country having count(customerID) > 5 
order by count(customerID) desc;