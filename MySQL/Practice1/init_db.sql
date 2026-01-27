-- MYSQL 

-- We use IF NOT EXISTS

-- This creates the database only if test_db_01 doesnt exist
CREATE DATABASE IF NOT EXISTS test_db_01;

USE test_db_01;

-- This command puts the database only in read only mode so no user can write into it 
-- ALTER DATABASE test_db_01 READ ONLY = 1; -- to remove from read only status `READ ONLY = 0` 

-- Create tables in the database 
CREATE TABLE IF NOT EXISTS students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL,
    cgpa DECIMAL(3, 2)    -- eg. 9.11, 10.0, 8.54  
);

-- To rename the table we use this command 
-- RENAME TABLE students to Students;

CREATE TABLE IF NOT EXISTS courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL
);

CREATE TABLE IF NOT EXISTS enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    semester VARCHAR(10),
    grade CHAR(2),
    -- after mentioning all the columns we give the foreign key reference 
    FOREIGN KEY (student_id) REFERENCES students (student_id),
    FOREIGN KEY (course_id) REFERENCES courses (course_id)
    -- FOREIGN KEY (<columnNameOfCurrentTable>) RFERENCES <otherTableName> (<ColumnNameOfOtherTable>)
);

-- NOTES ON TABLE COLUMNS 
    -- We use the tag of PRIMARY KEY (not PRIMARY_KEY) 
    -- for integers it is INT and for strings we use VARCHAR(100) and mention its size
    -- for decimals we use DECIMAL(5, 2), 5 denotes maximum no of digits and 2 denotes the max digits after the decimal 
    -- we can also write NOT NULL when we dont want the column to be not empty 


-- ADD COLUMN 
-- if we want to add column to existing table then we use ALTER TABLE <table_name> and then write all the things that we want to change  
-- ADD middle_name VARCHAR(50) AFTER first_name -->> if we want to add the column after some specific column 
ALTER TABLE students 
ADD COLUMN college VARCHAR(100),
ADD COLUMN hostel VARCHAR(4);

-- DESCRIBE: To see the structure of the TABLE
-- DESCRIBE students, courses, enrollments; -->> not allowed write the statements individually 
DESCRIBE students;

-- REMOVE THE COLUMNS
-- Important Rules & Warnings
-- Data Loss: Dropping a column permanently deletes all the data stored in that column. There is no "Undo" in the terminal.
-- Foreign Keys: You cannot drop a column that is currently being used as a Foreign Key or is part of a Primary Key without first removing those constraints.
-- Table Requirement: A table must have at least one column. You cannot drop every single column—if you want to delete the whole table, use DROP TABLE table_name; 
ALTER TABLE students
DROP COLUMN college,
DROP COLUMN hostel;

-- MODIFY COLUMN 
-- To change the datatype of the column we can use modify 
-- changing the column name from varchar(100) to varchar(70);
ALTER TABLE students
MODIFY COLUMN name VARCHAR(70);


DESCRIBE students;
DESCRIBE courses;
DESCRIBE enrollments;


-- TRUNCATE TABLE <tablename>
-- Remove the content of the table if there are no foreign keys 
-- TRUNCATE TABLE students;

-- DROP THE TABLES 
-- DROP TABLE students, courses;


-- this command is used to drop the database 
-- DROP DATABASE test_db_01; 


-- NOTE: VERY IMPORTANT
-- No, the order of conditions after WHERE does not matter for the final result.
-- In SQL, the AND operator is commutative. This means that Condition A AND Condition B is logically identical to Condition B AND Condition A. 
-- The database engine will return the exact same rows in both cases.