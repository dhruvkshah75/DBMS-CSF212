USE Lab7_test;

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    job_role VARCHAR(50),
    salary DECIMAL(10, 2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Insert Sample Data
INSERT INTO Departments VALUES 
(1, 'IT', 'San Francisco'),
(2, 'HR', 'New York'),
(3, 'Sales', 'Chicago');

INSERT INTO Departments VALUES
(4, 'Marketing', 'Los Angeles'),
(5, 'Finance', 'Boston'),
(6, 'Operations', 'Seattle'),
(7, 'Support', 'Austin'),
(8, 'Research', 'Denver');



INSERT INTO Employees VALUES 
(101, 'Alice Johnson', 'Developer', 75000, 1),
(102, 'Bob Smith', 'Manager', 95000, 1),
(103, 'Charlie Brown', 'Recruiter', 55000, 2),
(104, 'David White', 'Sales Executive', 21000, 3),
(105, 'Eve Black', 'Developer', 72000, 1),
(106, 'Frank Green', 'Marketing Specialist', 32000, 4),
(107, 'Grace Hall', 'Accountant', 70000, 5),
(108, 'Henry King', 'Software Engineer', 90000, 6),
(109, 'Ivy Lee', 'Manager', 32000, 7),
(110, 'Jack Scott', 'Manager', 85000, 8);



INSERT INTO Employees VALUES
(111, 'Kevin Scott', 'Developer', 82000, 1),
(112, 'Laura Adams', 'Manager', 105000, 4),
(113, 'Mike Turner', 'Recruiter', 52000, 7),
(114, 'Nina Clark', 'Support Engineer', 45000, 7),
(115, 'Oscar Wright', 'Finance Officer', 76000, 5),
(116, 'Paula Young', 'Operations Lead', 89000, 6),
(117, 'Quentin Harris', 'Developer', 91000, 8),
(118, 'Rachel Baker', 'Manager', 115000, 8),
(119, 'Sam Wilson', 'Recruiter', 61000, 4),
(120, 'Tina Lopez', 'Marketing Executive', 54000, 4),
(121, 'Uma Patel', 'Analyst', 65000, 6),
(122, 'Victor Gomez', 'Developer', 73000, 3),
(123, 'Wendy Nelson', 'Manager', 87000, 3),
(124, 'Xavier Carter', 'Recruiter', 70000, 5),
(125, 'Yara Collins', 'Support Specialist', 40000, 7),
(126, 'Zack Reed', 'Developer', 35000, 1),
(127, 'Amy Stone', 'Manager', 42000, 2),
(128, 'Brian Cox', 'Recruiter', 30000, 2),
(129, 'Cathy Diaz', 'Sales Executive', 28000, 3),
(130, 'Derek Shaw', 'Analyst', 32000, 5),
(131, 'Ella Ward', 'Developer', 36000, 1),
(132, 'Fred Long', 'Manager', 45000, 4),
(133, 'Gina Price', 'Recruiter', 27000, 7),
(134, 'Harry Bell', 'Support Engineer', 25000, 7),
(135, 'Ivy Cooper', 'Finance Officer', 38000, 5),
(136, 'Jack Foster', 'Operations Staff', 29000, 6),
(137, 'Kara Simmons', 'Developer', 34000, 8),
(138, 'Leo Brooks', 'Manager', 47000, 8),
(139, 'Mona Kelly', 'Recruiter', 31000, 4),
(140, 'Nate Sanders', 'Marketing Executive', 33000, 4);