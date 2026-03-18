-- WHEN INSERTIONS INTO VIEW ARE NOT ALLOWED 

-- 1. Multiple table joins 
-- ❌ Cannot insert
CREATE VIEW nameorders AS
SELECT o.order_no, s.name, c.c_name
FROM orders o
INNER JOIN salesman s ON o.salesman_id = s.salesman_id
INNER JOIN customers c ON o.customer_id = c.customer_id;

-- 2. Aggregate functions (SUM, COUNT, AVG, MAX, MIN)
-- ❌ Cannot insert
CREATE VIEW sales_total AS
SELECT salesman_id, SUM(amount) AS total
FROM orders
GROUP BY salesman_id;

-- 3. GROUP BY or HAVING 
-- ❌ Cannot insert
CREATE VIEW grouped_view AS
SELECT city, COUNT(*) AS total
FROM salesman
GROUP BY city;

-- 4. DISTINCT
-- ❌ Cannot insert
CREATE VIEW distinct_cities AS
SELECT DISTINCT city FROM salesman;

-- 5. Subqueries in SELECT
-- ❌ Cannot insert
CREATE VIEW sub_view AS
SELECT salesman_id, 
      (SELECT SUM(amount) FROM orders o 
       WHERE o.salesman_id = s.salesman_id) AS total
FROM salesman s;

-- 6. UNION or UNION ALL
-- ❌ Cannot insert
CREATE VIEW union_view AS
SELECT name FROM salesman
UNION
SELECT c_name FROM customers;

/*
    If the view is a simple SELECT from a single table with no special clauses — INSERT works. 
    Anything more complex — INSERT fails. 
*/

CREATE VIEW names AS
SELECT c_name FROM customers;

-- Try inserting
-- ❌ Cannot insert
INSERT INTO names VALUES ('Tom Cruise');

-- ERROR 1423 (HY000): Field of view 'names' 
-- underlying table doesn't have a default value

-- since the primary key cannot be null so we cannot insert into this table using the above view 
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,    -- ❌ NOT NULL, no default
    c_name      VARCHAR(50),        -- ✅ only this is in the view
    city        VARCHAR(50),        -- ❌ not in view
    level       INT,                -- ❌ not in view
    salesman_id INT                 -- ❌ not in view
);

-- ✅ This will work as primary key is auto increment and the other column has a defualt value and it allows null values 
CREATE TABLE test (
    id    INT PRIMARY KEY AUTO_INCREMENT,  -- ✅ auto fills itself
    name  VARCHAR(50),                     -- ✅ in the view
    city  VARCHAR(50) DEFAULT 'Unknown'    -- ✅ has default
);

CREATE VIEW test_names AS SELECT name FROM test;

INSERT INTO test_names VALUES ('Tom Cruise');  -- ✅ Works!