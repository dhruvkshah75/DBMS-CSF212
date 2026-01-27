-- MySQL

-- we add data to the tables in the database 

USE test_db_01;

-- INSERT INTO <tableName> (column names for order) VALUES ( )
-- for VARCHAR while inserting values we use single quotes and for decimal, int we dont 
INSERT INTO
    students (name, department, cgpa)
VALUES
    ('Michael Johnson', 'CSE', 8.42),
    ('Emily Carter', 'CSE', 9.10),
    ('Daniel Smith', 'ECE', 7.85),
    ('Sophia Brown', 'ME', 8.00),
    ('James Wilson', 'CSE', 8.75),
    ('Olivia Martinez', 'EEE', 9.20),
    ('Matthew Anderson', 'ECE', 7.40),
    ('Emma Thompson', 'ME', 8.60),
    ('Ethan Taylor', 'EEE', 8.90),
    ('Ava Miller', 'CSE', 9.00),
    ('Ryan Davis', 'ME', 7.95),
    ('Isabella Moore', 'ECE', 8.30);

INSERT INTO
    courses (course_name, credits)
VALUES
    ('Database Systems', 4),
    ('Operating Systems', 4),
    ('Computer Networks', 3),
    ('Data Structures', 4),
    ('Machine Learning', 3),
    ('Digital Electronics', 3),
    ('Thermodynamics', 4),
    ('Control Systems', 3),
    ('Power Systems', 4),
    ('Manufacturing Process', 3);

INSERT INTO
    enrollments (student_id, course_id, semester, grade)
VALUES
    (1, 1, 'Sem-5', 'A'),
    (1, 4, 'Sem-4', 'A'),
    (2, 5, 'Sem-5', 'A+'),
    (3, 6, 'Sem-4', 'B+'),
    (4, 7, 'Sem-3', 'B'),
    (5, 2, 'Sem-5', 'A'),
    (6, 9, 'Sem-6', 'A+'),
    (7, 3, 'Sem-4', 'B'),
    (8, 10, 'Sem-3', 'A'),
    (9, 8, 'Sem-5', 'A'),
    (10, 1, 'Sem-5', 'A+'),
    (11, 7, 'Sem-4', 'B+');

