
-- SQL code for Many to one relationship
CREATE TABLE customer (
    cutomer_id INT,
    customer_name VARCHAR(50),
    customer_street VARCHAR(50),
    customer_city VARCHAR(10),
    CONSTRAINT pk_customer PRIMARY KEY(customer_id)
);

CREATE TABLE loan (
    loan_number INT PRIMARY KEY,
    amount DECIMAL(5, 2),
    customer_id INT,
    -- foreign key is added in this table as A customer can borrow many loans 
    CONSTRAINT fk_customer_id FOREIGN KEY(customer_id) 
        REFERENCES customer(customer_id) 
        ON DELETE CASCADE  
    -- on deleting customer we should technically delete the loan 
);


