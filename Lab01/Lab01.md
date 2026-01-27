# DDL (Data Definition Languages)
Some important DDL commands include  
- `CREATE TABLE`: usage example, we also specify column details for each column in our database  
```sql
-- This command creates table with these columns with these conditions and datatypes
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    salary INT DEFAULT 0.0 -- a default value if we dont put in salary instead of NULL 
 );

-- To view the table with different names but dont want to change the database 
SELECT employee_id, name AS employee_name, salary AS employee_salary FROM employees;

```

- `CREATE INDEX`: Used to create an index on a table. Indexes are used to retrieve data from the database more quickly than otherwise. Users cannot see the indexes; they are just used to speed up searches/queries.  
Usage Example:  
```sql
CREATE INDEX idx_name ON employees (name);
-- This command creates a index `idx_name` on the table employees with respect to the column `name`
-- after doing this we write normal queries then our query search speeds up   

```


- `CREATE VIEW`: Create a view so that if we want to make the database public then we might not want to share some storage resources like `home_address`.  
Then we use create view to allow allow access to certain parts of the db table 
```sql
CREATE VIEW senior_staff AS 
SELECT * FROM employees WHERE salary > 50;
-- if we want to ignore some column then we write SELECT column1, column2 .. FROM employees; and exclude some 
-- This query creates a view of the table where only those employees are shown with salary greater than 50 and label them as senior_staff

-- now the senior staff will appear under show tables;

DROP VIEW senior_staff;
```

- `DESC`: This command is used to describe the table 
```sql
DESC employees;
-- This will describe all the stuff of the table including all the properties of each column 
```


- `ALTER TABLE`: We use this command to make changes to the existing table by adding a column, changing the datatype of the column, removing a column, changing the name of column, changing the name of the table and much more.
```sql
-- 1. ADDING A NEW COLUMN
-- Adds a new column 'phone_number' to the end of the table
ALTER TABLE employees 
ADD phone_number VARCHAR(15);

-- 2. CHANGING THE DATATYPE OF A COLUMN
-- Changes 'salary' from an INT to a DECIMAL for better precision
ALTER TABLE employees 
MODIFY COLUMN salary DECIMAL(10, 2);

-- 3. REMOVING (DROPPING) A COLUMN
-- Permanently deletes the 'temporary_notes' column and all its data
ALTER TABLE employees 
DROP COLUMN temporary_notes;

-- 4. CHANGING THE NAME OF A COLUMN
-- Renames 'emp_name' to 'full_name' (MySQL 8.0+)
ALTER TABLE employees 
RENAME COLUMN emp_name TO full_name;

-- 5. CHANGING THE NAME OF THE TABLE
-- Renames the entire table from 'employees' to 'staff'
ALTER TABLE employees 
RENAME TO staff;

-- 6. ADDING A COLUMN AT A SPECIFIC POSITION
-- You can use FIRST or AFTER to control where the column goes
ALTER TABLE staff 
ADD department_id INT AFTER full_name;

-- 7. ADDING A UNIQUE CONSTRAINT
-- Ensures no two employees have the same phone number
-- 'unique_phone' is the custom name we give to this rule
-- NULL does not count as a repeated value. so if we want to make the phone number nothing then:
-- INSERT INTO staff VALUES (..., NULL, ...) or INSERT INTO staff VALUES (..., '', ...) -->> write NULL or leave it blank 
ALTER TABLE staff 
ADD CONSTRAINT unique_phone UNIQUE (phone_number);

-- 8. ADDING A CHECK CONSTRAINT
-- Ensures salary never drops below 20000
ALTER TABLE staff 
ADD CONSTRAINT chk_salary_min CHECK (salary >= 20000);

-- 9. ADDING A PRIMARY KEY
-- (If the table didn't have one already)
ALTER TABLE staff 
ADD PRIMARY KEY (id);

-- 10. DROPPING A UNIQUE CONSTRAINT
-- In MySQL, unique constraints are often dropped by removing their index name
ALTER TABLE staff 
DROP INDEX unique_phone;

-- 11. DROPPING A CHECK CONSTRAINT (MySQL 8.0.16+)
-- Removes the salary minimum rule using the name we created earlier
ALTER TABLE staff 
DROP CONSTRAINT chk_salary_min;

-- 12. DROPPING A PRIMARY KEY
-- Since a table can only have one, you don't need to specify the column name
ALTER TABLE staff 
DROP PRIMARY KEY;
```

- `DROP DATABASE`: We use this to wipe out the database

- `TRUNCATE TABLE`: Used to remove all records from a table, but the table structure (the columns and constraints) remains intact. It is faster than DELETE because it doesn't log individual row deletions.
```sql
TRUNCATE TABLE employees;
-- doesnt work if we have foriegn key constrain related to the affecting table 
```

---  


# DML (Data Manipulation Language) 
Important commands include:
- `INSERT`: The INSERT command is used to add new rows of data into a table.  
Inserting into all columns: You don't need to specify column names if you provide values for every single column in the exact order they were created.  
Inserting multiple rows: You can add many rows in a single command by separating value sets with commas.
```sql
-- Inserting a single complete record i.e. fill all the columns of the table 
INSERT INTO employees 
VALUES (101, 'Sarah Miller', 'Marketing', 55000);

-- Inserting multiple records at once (more efficient) filling only some columns like here we skip the id column
INSERT INTO employees (name, department, salary)
VALUES 
    ('James Bond', 'Security', 95000),
    ('Jane Doe', 'Finance', 62000);
```

- `UPDATE`: The UPDATE command modifies existing records in a table. It is almost always used with a WHERE clause to specify which record(s) should be changed.  
WARNING: If you omit the WHERE clause, every single row in the table will be updated with the new value!
```sql
-- Giving a specific employee a raise
UPDATE employees
SET salary = 60000
WHERE id = 101;

-- Updating multiple fields for everyone in a department
UPDATE employees
SET department = 'Global Marketing', salary = salary * 1.05
WHERE department = 'Marketing';
```

- `DELETE`: The DELETE command removes one or more rows from a table. Like UPDATE, it relies heavily on the WHERE clause.  
Difference from TRUNCATE: While TRUNCATE (DDL) wipes the entire table instantly, DELETE (DML) can remove specific rows one by one.
```sql
-- Deleting a specific record
DELETE FROM employees 
WHERE id = 101;

-- Deleting all employees from a specific department
DELETE FROM employees 
WHERE department = 'Security';
```

---  



# DQL(Data Query Language)
This includes making queries using `SELECT`.


---


## CONSTRAINTS
```sql
CREATE TABLE employees (
    -- Column Definitions
    id INT AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    hire_date DATE DEFAULT (CURRENT_DATE),
    salary DECIMAL(10, 2),
    job_status VARCHAR(20) DEFAULT 'Active',

    -- Constraints on separate lines
    PRIMARY KEY (id),
    CONSTRAINT unique_email UNIQUE (email),  -- this custom name for constraint help in debugging when error is thrown
    CONSTRAINT chk_minimum_salary CHECK (salary > 0)  -- this check makes sure that the user does not put in negative salary 
);
```

### `Composite primary key`
A Composite Primary Key is a primary key that consists of two or more columns combined to uniquely identify a row in a table.  
While a standard primary key uses just one column (like id), a composite key is used when a single column isn't enough to guarantee uniqueness, but the combination of those columns is.  
`How to create a composite primary key?`
```sql
CREATE TABLE temp (
    id CHAR(10),
    temp_name VARCHAR(30) UNIQUE,
    hostel INT,
    score_percentage DECIMAL(5, 2) DEFAULT 0.0,
    phone VARCHAR(11),
    bdate DATE,
    gender ENUM('F', 'M'),
    
    -- Composite Primary Key defined at the bottom
    PRIMARY KEY (id, temp_name)
);
```

---

## Database Migration: Export & Import
### 1. Exporting a Database (Backup)
Use the `mysqldump` utility to create a `.sql` file containing your database structure and data.
* **Command:** `mysqldump -u [username] -p [database_name] > [filename].sql`
* **The Logic:**
* **`-u`**: Your MySQL username.
* **`-p`**: Prompts you for your password.
* **`>`**: The **"Output"** operator. It "pours" the database data into a file.

**Example:**
```bash
# Exporting 'employees_db' to a file named 'backup.sql'
mysqldump -u root -p employees_db > backup.sql

# Non root user 
mysqldump -u username -p database_name > /home/username/backup.sql

```
---
### 2. Importing a Database (Restore)
To bring data back in, you must first have a "container" (a blank database) ready to receive it.

* **Step A: Prepare the Database (Inside MySQL Shell)**
```sql
CREATE DATABASE new_db;
EXIT;
```
* **Step B: Run the Import (In Terminal)**
* **Command:** `mysql -u [username] -p [new_db_name] < [filename].sql`
* **The Logic:**
* **`<`**: The **"Input"** operator. It takes the code inside the file and runs it inside the database.

**Example:**

```bash
# Importing 'backup.sql' into 'new_db'
mysql -u root -p new_db < backup.sql

# non root user
mysql -u username -p destination_db < /home/username/backup.sql
```

---

### Summary Comparison Table

| Action | Utility | Operator | Flow |
| --- | --- | --- | --- |
| **Export** | `mysqldump` | **`>`** | Database → File |
| **Import** | `mysql` | **`<`** | File → Database |



# IN-Built Functions 
- `COUNT()`: The COUNT() function returns the number of rows that match a specific criterion.  
COUNT(*): Counts every row in the table.  
COUNT(column_name): Counts rows where that specific column is not NULL.
```sql
-- How many total employees are there?
SELECT COUNT(*) FROM employees;

-- How many employees have a phone number listed? 
-- (This ignores NULL entries)
SELECT COUNT(phone) FROM employees;
```

- `SUM()`: The SUM() function returns the total sum of a numeric column. It ignores NULL values.
```sql
-- What is the total monthly cost of all salaries?
SELECT SUM(salary) FROM employees;

-- What is the total salary spent specifically in the 'Sales' department?
SELECT SUM(salary) 
FROM employees 
WHERE department = 'Sales';
```

- `LIKE`: 


