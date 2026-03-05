USE Lab6;


DROP TABLE IF EXISTS lab_assistants;
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS sections;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS instructors;
DROP TABLE IF EXISTS departments;


CREATE TABLE departments (
  deptId INT PRIMARY KEY,
  deptName VARCHAR(50) NOT NULL,
  building VARCHAR(50)
);

CREATE TABLE instructors (
  instructorId INT PRIMARY KEY,
  firstName VARCHAR(30) NOT NULL,
  lastName VARCHAR(30) NOT NULL,
  deptId INT NOT NULL,
  salary DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (deptId) REFERENCES departments(deptId)
);

CREATE TABLE students (
  studentId INT PRIMARY KEY,
  studentName VARCHAR(50) NOT NULL,
  majorDeptId INT NOT NULL,
  yearOfStudy INT NOT NULL,
  FOREIGN KEY (majorDeptId) REFERENCES departments(deptId)
);

CREATE TABLE courses (
  courseId VARCHAR(10) PRIMARY KEY,
  courseName VARCHAR(50) NOT NULL,
  deptId INT NOT NULL,
  credits INT NOT NULL,
  FOREIGN KEY (deptId) REFERENCES departments(deptId)
);

CREATE TABLE sections (
  sectionId INT PRIMARY KEY,
  courseId VARCHAR(10) NOT NULL,
  instructorId INT NOT NULL,
  semester VARCHAR(10) NOT NULL,
  year INT NOT NULL,
  FOREIGN KEY (courseId) REFERENCES courses(courseId),
  FOREIGN KEY (instructorId) REFERENCES instructors(instructorId)
);

CREATE TABLE enrollments (
  studentId INT,
  sectionId INT,
  grade CHAR(2),
  PRIMARY KEY (studentId, sectionId),
  FOREIGN KEY (studentId) REFERENCES students(studentId),
  FOREIGN KEY (sectionId) REFERENCES sections(sectionId)
);

CREATE TABLE lab_assistants (
  labAssistantId INT PRIMARY KEY,
  studentId INT NOT NULL,
  sectionId INT NOT NULL,
  stipend DECIMAL(8,2) NOT NULL,
  hoursPerWeek INT NOT NULL,
  deptId INT NOT NULL,
  FOREIGN KEY (studentId) REFERENCES students(studentId),
  FOREIGN KEY (sectionId) REFERENCES sections(sectionId),
  FOREIGN KEY (deptId) REFERENCES departments(deptId)
);


INSERT INTO departments VALUES
(1,'Computer Science','A'),
(2,'Mechanical','B'),
(3,'Electrical','C'),
(4,'Civil','D'),
(5,'Mathematics','E'),
(6,'Bioinformatics','F');

INSERT INTO instructors VALUES
(101,'Alan','Smith',1,105000),
(102,'Brian','Smith',1,99000),
(103,'Clara','Jones',1,48000),
(104,'David','Miller',1,53000),
(105,'Eva','Brown',1,92000),
(106,'Frank','Taylor',2,75000),
(107,'Grace','Taylor',2,69000),
(108,'Henry','Moore',2,47000),
(109,'Irene','Moore',2,96000),
(110,'Jack','White',2,98000),
(111,'Kelly','Wilson',3,44000),
(112,'Liam','Wilson',3,56000),
(113,'Mona','Clark',3,72000),
(114,'Nate','Clark',3,66000),
(115,'Omar','Hall',3,52000),
(116,'Paul','Allen',4,39000),
(121,'Uma','Scott',5,49000);

INSERT INTO students VALUES
(201,'Aarav',1,1),(202,'Bhavya',1,2),(203,'Chetan',1,3),
(204,'Diya',1,4),(205,'Eshan',1,2),(206,'Farah',1,3),
(207,'Gaurav',2,1),(208,'Hina',2,2),(209,'Ishaan',2,3),
(210,'Juhi',2,4),(211,'Karan',2,2),(212,'Lata',2,3),
(213,'Manav',3,1),(214,'Nisha',3,2),(215,'Om',3,3),
(216,'Pooja',3,4),(217,'Qadir',3,2),(218,'Riya',3,3),
(219,'Sahil',4,1),(220,'Tina',4,2),(221,'Uday',4,3),
(222,'Vani',4,4),(223,'Wasim',4,2),(224,'Xena',4,3),
(225,'Yash',1,1),(226,'Zara',2,2),
(227,'Aditi',3,3),(228,'Bilal',4,4),
(229,'Chirag',1,2),(230,'Dev',2,3);

INSERT INTO courses VALUES
('CS101','DBMS',1,4),('CS102','AI',1,4),
('CS103','Networks',1,3),('CS104','OS',1,4),
('ME101','Thermo',2,3),('ME102','Design',2,4),
('ME103','Dynamics',2,3),('ME104','Robotics',2,4),
('EE101','Circuits',3,3),('EE102','Signals',3,4),
('EE103','Power',3,3),('EE104','Control',3,4),
('CE101','Structures',4,3),('CE102','GeoTech',4,4),
('CE103','Transport',4,3),('CE104','Hydrology',4,4),
('MA101','Algebra',5,4),('MA102','Calculus',5,4),
('MA103','Stats',5,3),('MA104','Numerical',5,4),
('BI301','Genomics',6,4);

INSERT INTO sections VALUES
(301,'CS101',101,'Fall',2023),
(302,'CS101',102,'Spring',2024),
(303,'CS102',103,'Fall',2024),
(304,'CS103',104,'Spring',2023),
(305,'CS104',105,'Fall',2024),
(306,'ME101',106,'Fall',2023),
(307,'ME102',107,'Spring',2024),
(308,'ME103',108,'Fall',2024),
(309,'ME104',109,'Spring',2023),
(310,'EE101',111,'Fall',2023),
(311,'EE102',112,'Spring',2024),
(312,'EE103',113,'Fall',2024),
(313,'EE104',114,'Spring',2023),
(314,'CE101',116,'Fall',2023),
(315,'CE102',116,'Spring',2024),
(316,'CE103',116,'Fall',2024),
(317,'CE104',116,'Spring',2023),
(318,'MA101',121,'Fall',2023),
(319,'MA102',121,'Spring',2024),
(320,'MA103',121,'Fall',2024),
(321,'MA104',121,'Spring',2023),
(322,'CS101',101,'Fall',2024),
(323,'EE101',115,'Spring',2024),
(324,'CE101',116,'Fall',2024),
(325,'MA101',121,'Spring',2023),
(326,'BI301',101,'Fall',2024);

INSERT INTO enrollments VALUES
(201,301,'A'),(202,301,'B'),(203,302,'A'),
(204,303,'C'),(205,304,'B'),(206,305,'A'),
(207,306,'B'),(208,306,'A'),(209,307,'B'),
(210,308,'C'),(211,309,'A'),(212,307,'B'),
(213,310,'A'),(214,311,'B'),(215,312,'C'),
(216,313,'A'),(217,311,'B'),(218,312,'A'),
(219,314,'A'),(220,315,'B'),(221,316,'C'),
(222,317,'A'),(223,315,'B'),(224,316,'A'),
(225,318,'A'),(226,319,'B'),(201,305,'A'),
(201,322,'B'),(202,303,'A'),(203,304,'B'),
(204,305,'A'),(205,301,'B'),(206,303,'A'),
(207,307,'A'),(207,308,'B'),(208,309,'A'),
(209,306,'B'),(210,307,'A'),(211,308,'B'),
(212,309,'A'),(213,311,'A'),(213,312,'B'),
(214,310,'A'),(215,313,'B'),(216,312,'A'),
(217,310,'B'),(218,311,'A'),(219,315,'A'),
(220,316,'B'),(221,317,'A'),(222,314,'B'),
(223,316,'A'),(224,317,'B'),(225,319,'A'),
(226,318,'B');

INSERT INTO lab_assistants VALUES
(401,202,301,12000,10,1),
(402,203,301,11000,9,2),
(403,205,304,9000,6,3),
(404,208,306,10000,8,4),
(405,209,306,9500,7,5),
(406,214,311,13000,12,6),
(407,215,311,12500,10,6),
(408,217,312,11500,9,5),
(409,218,312,11800,10,4),
(410,220,315,10500,8,3),
(411,221,316,9900,7,2),
(412,223,315,9800,6,1),
(413,224,316,10200,8,2),
(414,226,319,11000,9,3),
(415,225,318,9500,7,4),
(416,204,303,9000,5,5),
(417,210,308,9200,6,6),
(418,216,313,9400,7,5),
(419,202,322,10000,8,4),
(420,208,306,9700,7,3),
(421,201,326,10000,8,2),
(422,202,326,9500,7,1);