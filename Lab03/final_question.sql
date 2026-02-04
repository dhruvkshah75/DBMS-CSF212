
-- PYQ Lab2 Question
CREATE TABLE EMPLOYEE (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(10),
    Supervision INT,  
    CONSTRAINT chk1 CHECK Supervision != employee_id, -- Condition: Employee cannot be his own Supervisor
    CONSTRAINT fk_supervisor FOREIGN KEY(Supervision) 
        REFERENCES EMPLOYEE(employee_id) ON DELETE SET NULL
        -- we will set null if the supervisor is deleted 
);

CREATE TABLE DEPARTMENT (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(20),
    Manages INT NOT NULL UNIQUE,  -- 1:1 Total Participation so we add NOT NULL and UNIQUE 
    Start_date DATE NOT NULL,  -- not null acc to the question
    CONSTRAINT fk_employee_id FOREIGN KEY(Manages) 
        REFERENCES EMPLOYEE(employee_id) ON DELETE CASCADE 
    -- on delete cascade makes sense beacuse of total participation of department with employee
);

-- create a new table for multivalued attribute of the DEPARTMENT table 
CREATE TABLE Loc (
    department_id INT,
    Loc VARCHAR(20),
    -- we have the primary key as composite key of department_id and Loc itself as its members are unknown
    PRIMARY KEY(department_id, Loc),
    CONSTRAINT fk_department_id FOREIGN KEY(department_id) REFERENCES DEPARTMENT(department_id) 
        ON DELETE CASCADE  -- in this cascade is needed as this is a part of the department table
);

CREATE TABLE PROJECT (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(10),
    ploc VARCHAR(10),
    Controls INT NOT NULL,  -- not null due to the total participation of project 
    CONSTRAINT fk_department_id FOREIGN KEY(Controls) REFERENCES DEPARTMENT(department_id)
        ON DELETE CASCADE  
    -- cascade makes sense as project has total participation in the relationship with department 
);

CREATE TABLE Works_On (
    employee_id INT, 
    project_id INT,
    Hours DECIMAL(5, 2) NOT NULL, -- as we are applying a check on it 
    -- check if hours is between 10 and 40 inclusive 
    CONSTRAINT chk2 CHECK (Hours >= 10 AND Hours <= 40),
    -- employee id and project id are the composite primary key as it is Many To Many Relationship
    PRIMARY KEY(employee_id, project_id),
    -- forign keys 
    CONSTRAINT fk_emp_id FOREIGN KEY(employee_id) 
        REFERENCES EMPLOYEE(employee_id) ON DELETE CASCADE,
    CONSTRAINT fk_proj_id FOREIGN KEY(project_id) 
        REFERENCES PROJECT(project_id) ON DELETE CASCADE
    -- on delete cascade makes sense as the entry in this extra table should be removed 
    -- if the employee or the project is removed 
)

