
-- SQL code for total participation of loan 
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
    customer_id INT NOT NULL, 
    -- The not null constraint ensures that the each loan is associated to a customer 
    CONSTRAINT fk_customer_id FOREIGN KEY(customer_id)
        REFERENCES customer(customer_id) 
        ON DELETE CASCADE
);


