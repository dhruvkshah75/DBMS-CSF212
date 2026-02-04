
-- SQL code for ER diagram 1
CREATE TABLE customer (
    customer_ID INT,
    customer_name VARCHAR(10),
    customer_street VARCHAR(50),
    customer_city VARCHAR(50),
    CONSTRAINT pk_customer_id PRIMARY KEY(customer_ID)
);

CREATE TABLE account (
    account_number INT,
    balance INT,
    CONSTRAINT pk_acc_no PRIMARY KEY(account_number)
);

CREATE TABLE depositor (
    customer_id INT,
    account_number INT,
    access_date DATE,   -- the descriptive attribute 
    -- composite primary key for this table 
    PRIMARY KEY (customer_id, account_number),
    CONSTRAINT fk_acc_no FOREIGN KEY(account_number) 
        REFERENCES account(account_number) 
        ON DELETE CASCADE,
    CONSTRAINT fk_customer_id FOREIGN KEY(customer_id)
        REFERENCES customer(customer_ID)
        ON DELETE CASCADE
);



















