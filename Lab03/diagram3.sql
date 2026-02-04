
-- SQL code for unary relationship
CREATE TABLE employee (
    employee_id INT,
    employee_name VARCHAR(50),
    telephone_number VARCHAR(15),
    works_for INT 
    PRIMARY KEY(employee_id),
    -- foreign key within the same table as we demonstrate many to one relationship
    CONSTRAINT fk_emp_id FOREIGN KEY(works_for) 
        REFERENCES employee(employee_id) 
        ON DELETE SET NULL
    -- If a manager leaves, the worker just has no manager.
);