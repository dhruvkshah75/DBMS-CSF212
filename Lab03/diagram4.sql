
-- SQL code for one to one relationship
CREATE TABLE loan (
    loan_number INT PRIMARY KEY,
    amount DECIMAL(10, 2),
);

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    customer_street VARCHAR(50),
    customer_city VARCHAR(10),
    loan_number INT UNIQUE -- unique constraint to enforce 1 to 1 relationship
    -- foreign key 
    CONSTRAINT fk_loan_no FOREIGN KEY(loan_number) 
        REFERENCES loan(loan_number)
);

