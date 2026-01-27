-- MySQL

-- Solution to the questions 

-- Q1. Display all the details of students from the CSE department
SELECT * FROM students WHERE department = 'CSE';

-- Q2. Display the name and cgpa of the students with CGPA greater than 8.5
SELECT s.name, s.cgpa FROM students s WHERE cgpa > 8.5;

-- Q3. Display student name, course name, semester and grade of all students without using join
SELECT s.name, c.course_name, e.semester, e.grade 
FROM students s, courses c, enrollments e 
WHERE 
    e.student_id = s.student_id AND
    e.course_id = c.course_id;

-- Q4. Display student's name enrolled in Database Systems course
-- The course_id for the course database systems is 1
SELECT 
    s.name 
FROM 
    students s,
    enrollments e,
    courses c
WHERE 
    s.student_id = e.student_id AND
    c.course_id = e.course_id AND
    c.course_id = 1;

-- Q5. Display Average CGPA of each department 
SELECT department, AVG(cgpa) AS average_cgpa
FROM students
GROUP BY department;

-- Here we want to display a new column as average_cgpa so we write AVG(cgpa) AS average_cgpa
-- We want department specific avg cgpa so we use GROUP BY department statement 

SELECT productName AS products FROM products WHERE productName LIKE "200%" ORDER BY MSRP-buyPrice DESC LIMIT 3;

SELECT COUNT(phoneNumber) AS TotalCustomers FROM customers WHERE phoneNumber LIKE "+65%";