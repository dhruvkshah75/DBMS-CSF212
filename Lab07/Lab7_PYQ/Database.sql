CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    salary INT
);

INSERT INTO salesman (salesman_id, name, city, salary)
VALUES
(101,'Nick Fury','New York', 5000),
(102,'Peter Parker','Paris', 2000),
(103,'Dwayne Johnson','London',10000),
(104,'Arnold','Paris',4000),
(105,'Paul Walker','San Jose',3000),
(106,'Charles Leclerc','Rome',5000);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    c_name VARCHAR(50),
    city VARCHAR(50),
    level INT,
    salesman_id INT,
    FOREIGN KEY(salesman_id) REFERENCES salesman(salesman_id)
);

INSERT INTO customers (customer_id, c_name, city,level,salesman_id)
VALUES
(501,'John Abraham','New York',100,101),
(502,'Brad Pitt','New York',200,101),
(503,'Graham Bell','California',200,102),
(504,'Julian Green','London',300,102),
(505,'Fabian Johnson','Paris',300, 104),
(506,'James Cameron','Berlin',100, 106),
(507,'Cozy Altidor','Moscow',200,105),
(508,'Daniel','London',200,103);


CREATE TABLE orders (
    order_no INT PRIMARY KEY,
    amount DECIMAL(10,2),
    ord_date DATE,
    salesman_id INT,
    customer_id INT,
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders (order_no, amount, ord_date, customer_id, salesman_id)
VALUES 
(70001, 150.5, '2012-10-05', 503, 102),
(70009, 270.65, '2012-09-10', 508, 103),
(70002, 65.26, '2012-10-05', 501, 101),
(70004, 110.5, '2012-08-17', 506, 106),
(70007, 948.5, '2012-09-10', 503, 102),
(70005, 2400.6, '2012-07-27', 502, 101),
(70008, 5760, '2012-09-10', 501, 101),
(70010, 1983.43, '2012-10-10', 505, 104),
(70003, 2480.4, '2012-10-10', 506, 106),
(70012, 250.45, '2012-06-27', 504, 102),
(70011, 75.29, '2012-08-17', 507, 105),
(70013, 3045.6, '2012-04-25', 501, 101);

