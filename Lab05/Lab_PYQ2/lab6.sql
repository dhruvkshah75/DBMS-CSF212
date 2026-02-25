DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS teachers;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS assignments;
DROP TABLE IF EXISTS teacher_projects;





CREATE TABLE courses (
  id INT PRIMARY KEY,
  name VARCHAR(50)
);

CREATE TABLE students (
  id VARCHAR(13) PRIMARY KEY,
  name VARCHAR(50),
  batch int
);

CREATE TABLE teachers (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  age INT,
  course_id INT,
  FOREIGN KEY (course_id) REFERENCES courses(id)
);

CREATE TABLE projects (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  budget DECIMAL(10,2),
  course_id INT,
  FOREIGN KEY (course_id) REFERENCES courses(id)
);

CREATE TABLE teacher_projects (
  teacher_id INT,
  project_id INT,
  PRIMARY KEY (teacher_id, project_id),
  FOREIGN KEY (teacher_id) REFERENCES teachers(id),
  FOREIGN KEY (project_id) REFERENCES projects(id)
);

CREATE TABLE assignments (
  id INT PRIMARY KEY,
  student_id varchar(13),
  grade DECIMAL(5,2),
  date_submitted DATE,
  teacher_id INT,
  FOREIGN KEY (teacher_id) REFERENCES teachers(id),
  FOREIGN KEY (student_id ) REFERENCES students (id)
);

INSERT INTO courses (id, name)
VALUES
  (1, 'Mathematics'),
  (2, 'Literature'),
  (3, 'Science');

INSERT INTO students (id, name, batch)
VALUES
  ('S2345', 'Prateek Chitre',2021),
  ('S1892', 'Gautam Jhabak',2022),
  ('S3456', 'Aryan Nambiar',2021),
  ('S2777', 'Ujjwal Kumar',2020),
  ('S4123', 'Himanshu Singh',2021),
  ('S1456', 'Shashank Rana',2022),
  ('S3789', 'Ayush Ghatalia',2023),
  ('S2101', 'Sakshi Singh',2019),
  ('S4321', 'Nandish Choksi',2021),
  ('S3987', 'Rhythm Chauhan',2019);

INSERT INTO teachers (id, name, age, course_id)
VALUES
  (1, 'Alakh Pandey', 35, 1),
  (2, 'Aman Dhattarwal', 40, 2),
  (3, 'Shraddha Didi', 32, 3),
  (4, 'Namo Kaul', 28, 1),
  (5, 'Gate Smashers', 45, 2),
  (6, 'Neso Academy', 38, 3),
  (7, 'Love Babbar', 33, 1),
  (8, 'Code with Harry', 42, 2),
  (9, 'Aditya Verma', 36, 3),
  (10, 'Sandeep Jain', 36, 1);

INSERT INTO projects (id, name, budget, course_id)
VALUES
  (1, 'Computational Geometry', 5000.00, 1),
  (2, 'Literacy Critic', 7000.00, 2),
  (3, 'Solid State Effects', 6000.00, 3),
  (4, 'Calculus', 4000.00, 1),
  (5, 'Genre Comparison', 8000.00, 2),
  (6, 'Rigid Body Dynamics', 5500.00, 3),
  (7, 'Linear Algebra', 4500.00, 1),
  (8, 'Poetry Analysis', 7500.00, 2),
  (9, 'Protozoa diversity study', 6500.00, 3),
  (10, 'Vector Space Analysis', 5500.00, 1);

INSERT INTO teacher_projects (teacher_id, project_id)
VALUES
  (1, 1),
  (4, 7),
  (2, 8),
  (1, 9),
  (3, 3),
  (5, 4),
  (3, 2),
  (2, 6),
  (4, 5),
  (5, 10)
  ;

INSERT INTO assignments (id, student_id, grade, date_submitted, teacher_id)
VALUES
  (1, 'S2345', 85.50, '2024-02-15', 1),
  (2, 'S3456', 92.75, '2024-02-17', 6),
  (3, 'S3456', 78.30, '2024-02-20', 3),
  (4, 'S1456', 87.00, '2024-02-22', 7),
  (5, 'S2345', 95.25, '2024-02-25', 5),
  (6, 'S2777', 80.90, '2024-02-27', 8),
  (7, 'S3789', 88.75, '2024-03-01', 8),
  (8, 'S2777', 82.40, '2024-03-04', 3),
  (9, 'S2101', 90.00, '2024-03-06', 9),
  (10, 'S4123', 86.50, '2024-03-09', 5);