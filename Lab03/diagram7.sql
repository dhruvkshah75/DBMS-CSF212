
-- SQL Code for Weak Entity Sets 
CREATE TABLE loan (
    loan_number INT PRIMARY KEY,
    amount DECIMAL(5, 2)
);

CREATE TABLE payment (
    payment_number INT,
    payment_date DATE,
    payment_amount DECIMAL(5, 2),
    loan_number INT NOT NULL,  
    -- Not null for total partication i.e. every payment must be associated to a loan
    -- The primary key of a weak entity set is the discriminator and the primary key of foregin key table 
    PRIMARY KEY (loan_number, payment_number),
    -- foreign key constraint 
    CONSTRAINT fk_loan FOREIGN KEY(loan_number) 
        REFERENCES loan(loan_number)
        ON DELETE CASCADE
);
-- It is a 1(Loan) to M(payment) relationship (One to Many)

