
USE Lab6_test;


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
(1,'Data Science','North Wing'),
(2,'Aerospace','West Wing'),
(3,'Electronics','South Wing'),
(4,'Architecture','East Wing'),
(5,'Statistics','Annex'),
(6,'Bioinformatics','Tower A'),
(7,'Materials','Tower B'),
(8,'Quantum Computing','Tower C'),
(9,'Environmental','Tower D'),
(10,'Finance Analytics','Tower E'),
(11,'Cybersecurity','Tower F');

INSERT INTO instructors VALUES
(201,'Noah','Bennett',1,103000),
(202,'Olivia','Bennett',1,110000),
(203,'Luca','Hayes',1,52000),
(204,'Mila','Hayes',1,61000),
(205,'Ethan','Cole',1,47000),
(206,'Aria','Cole',2,78000),
(207,'Zane','Foster',2,96000),
(208,'Ivy','Foster',2,98000),
(209,'Leo','Ward',2,55000),
(210,'Maya','Ward',2,49000),
(211,'Kai','Reed',3,72000),
(212,'Nina','Reed',3,68000),
(213,'Owen','Grant',3,53000),
(214,'Riya','Grant',3,46000),
(215,'Yuri','Stone',3,81000),
(216,'Pavel','Stone',4,64000),
(217,'Anya','Cross',4,59000),
(218,'Jon','Cross',4,75000),
(219,'Sara','Lane',4,82000),
(220,'Tariq','Lane',4,43000),
(221,'Hugo','Voss',5,56000),
(222,'Elena','Voss',5,60000),
(223,'Mateo','Ibarra',5,71000),
(224,'Lina','Ibarra',5,48000),
(225,'Rafael','Mendez',6,77000),
(226,'Sara','Mendez',6,82000),
(227,'Tomas','Aguilar',6,64000),
(228,'Isla','Aguilar',6,59000),
(229,'Kenji','Tanaka',7,91000),
(230,'Mira','Tanaka',7,72000),
(231,'Jonas','Becker',7,68000),
(232,'Greta','Becker',7,47000),
(233,'Wei','Zhang',8,99000),
(234,'Li','Zhang',8,101000),
(235,'Chen','Wu',8,61000),
(236,'Mei','Wu',8,54000),
(237,'Lucas','Rossi',9,75000),
(238,'Giulia','Rossi',9,69000),
(239,'Marco','Ricci',9,52000),
(240,'Anna','Ricci',9,48000),
(241,'David','Klein',10,86000),
(242,'Leah','Klein',10,80000),
(243,'Omar','Hassan',10,62000),
(244,'Nadia','Hassan',10,57000);

INSERT INTO students VALUES
(301,'Kabir',1,1),(302,'Myra',1,2),
(303,'Devansh',2,3),(304,'Tanvi',2,4),
(305,'Rohan',3,2),(306,'Ira',3,3),
(307,'Parth',4,1),(308,'Sneha',4,2),
(309,'Arnav',5,3),(310,'Kriti',5,4),
(311,'Harsh',5,2),(312,'Simran',5,3),
(313,'Ayaan',6,1),(314,'Pallavi',6,2),
(315,'Ritika',6,3),(316,'Nakul',6,4),
(317,'Mehul',7,2),(318,'Diya',7,3),
(319,'Tejas',8,1),(320,'Anushka',8,2),
(321,'Ritesh',7,3),(322,'Shreya',8,4),
(323,'Farhan',7,2),(324,'Karina',8,3),
(325,'Gagan',5,1),(326,'Mitali',6,2),
(351,'Arpit',9,1),(352,'Megha',10,2),
(353,'Ritesh',9,3),(354,'Saloni',10,2);

INSERT INTO courses VALUES
('BI301','Genomics',6,4),('BI302','Proteomics',6,4),
('BI303','BioStats',6,3),('BI304','Molecular Sim',6,4),
('MT301','Composites',7,3),('MT302','Nanomaterials',7,4),
('MT303','Metallurgy',7,3),('MT304','Polymers',7,4),
('QC301','Quantum Algo',8,4),('QC302','Q Cryptography',8,4),
('QC303','Quantum HW',8,3),('QC304','QC Simulation',8,4),
('EV301','Climate Model',9,3),('EV302','Water Mgmt',9,4),
('EV303','Air Quality',9,3),('EV304','Ecology',9,4),
('FA301','Risk Analytics',10,4),('FA302','Fin ML',10,4),
('FA303','Derivatives',10,3),('FA304','Portfolio Opt',10,4),
('CS301','Network Security',11,4);

INSERT INTO sections VALUES
(426,'BI301',225,'Fall',2025),
(427,'BI302',226,'Spring',2025),
(428,'BI303',227,'Fall',2025),
(429,'BI304',228,'Spring',2025),
(430,'MT301',229,'Fall',2025),
(431,'MT302',230,'Spring',2025),
(432,'MT303',231,'Fall',2025),
(433,'MT304',232,'Spring',2025),
(434,'QC301',233,'Fall',2025),
(435,'QC302',234,'Spring',2025),
(436,'QC303',235,'Fall',2025),
(437,'QC304',236,'Spring',2024),
(438,'EV301',237,'Fall',2024),
(439,'EV302',238,'Spring',2025),
(440,'EV303',239,'Fall',2025),
(441,'EV304',240,'Spring',2024),
(442,'FA301',241,'Fall',2024),
(443,'FA302',242,'Spring',2025),
(444,'FA303',243,'Fall',2025),
(445,'FA304',244,'Spring',2024),
(446,'QC301',201,'Fall',2025),
(447,'FA301',221,'Spring',2025),
(448,'BI301',229,'Fall',2025),
(449,'CS301',233,'Fall',2025);

INSERT INTO enrollments VALUES
(301,426,'A'),(302,426,'B'),(303,427,'A'),
(301,427,'B'),(301,435,'A'),(302,428,'A'),
(303,429,'B'),(304,426,'A'),(304,428,'C'),
(305,429,'B'),(305,430,'A'),(306,430,'A'),
(306,431,'B'),(307,431,'B'),(307,432,'A'),
(308,431,'A'),(308,433,'B'),(309,432,'B'),
(309,434,'A'),(310,433,'C'),(310,435,'B'),
(311,434,'A'),(311,436,'A'),(312,432,'B'),
(312,437,'B'),(313,435,'A'),(313,426,'B'),
(314,436,'B'),(314,428,'A'),(315,437,'C'),
(315,429,'B'),(316,438,'A'),(316,430,'A'),
(317,436,'B'),(317,432,'A'),(318,437,'A'),
(318,433,'B'),(319,439,'A'),(319,436,'A'),
(320,440,'B'),(320,437,'B'),(321,441,'C'),
(321,434,'A'),(322,442,'A'),(322,438,'A'),
(323,440,'B'),(323,435,'B'),(324,441,'A'),
(324,439,'B'),(325,426,'A'),(325,438,'A'),
(326,427,'B'),(326,431,'B'),(351,440,'A'),
(352,441,'B'),(353,442,'A'),(354,443,'B');

INSERT INTO lab_assistants VALUES
(521,302,426,10500,8,1),
(522,303,426,10200,7,2),
(523,305,431,9500,6,3),
(524,307,432,9800,7,4),
(525,308,435,11000,9,5),
(526,309,436,10800,8,6),
(527,310,439,9900,7,7),
(528,311,440,9600,6,8),
(529,312,443,12000,10,9),
(530,313,444,11800,9,10),
(531,314,427,9000,5,9),
(532,315,430,9100,6,8),
(533,316,433,9200,6,7),
(534,317,437,9700,7,6),
(535,318,438,10100,8,5),
(536,319,442,10400,8,4),
(537,320,429,8900,5,3),
(538,321,434,11200,9,2),
(539,322,441,9300,6,1),
(540,323,445,11500,9,1),
(541,351,426,8000,4,2),
(542,352,427,8000,4,3),
(543,353,428,8000,4,4),
(544,354,429,8000,4,5);