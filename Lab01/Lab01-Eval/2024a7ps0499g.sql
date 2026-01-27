-- CSF212 Lab-1 DDL DML
-- Make sure to FIRST rename the file solution.sql to student_id.sql ( e.g. 2024A7PS2020G.sql, 2023B3A70001G.sql)

-- Create Tables
CREATE TABLE `TRAIN` (
  `train_id` int NOT NULL,
  `train_name` varchar(60) DEFAULT NULL,
  `source` varchar(30) DEFAULT NULL,
  `destination` varchar(30) DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `status` enum('on time','delayed') DEFAULT 'on time',
  PRIMARY KEY (`train_id`)
);

CREATE TABLE `PASSENGER` (
  `passenger_id` int NOT NULL,
  `passenger_name` varchar(50) NOT NULL,
  `age` int DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`passenger_id`),
  UNIQUE KEY `mobile_number` (`contact_number`)
);

-- Insert Records
INSERT INTO TRAIN VALUES 
(101, 'Rajdhani Express', 'Mumbai', 'Delhi', '16:00:00', '08:00:00', 'on time');

INSERT INTO TRAIN VALUES
(102, 'Shatabdi Express', 'Delhi', 'Bhopal', '06:00:00', '14:00:00','on time');

INSERT INTO TRAIN VALUES
(103, 'Duronto Express', 'Mumbai', 'Kolkata', '17:30:00', '10:30:00', 'delayed');

INSERT INTO TRAIN VALUES
(104, 'Garib Rath', 'Chennai', 'Delhi', '20:00:00', '18:00:00', 'delayed');

INSERT INTO TRAIN VALUES
(105, 'Intercity Express', 'Pune', 'Mumbai', '07:00:00', '10:00:00','on time');

INSERT INTO PASSENGER VALUES 
(1, 'Amit Sharma', 45, 'M', '9876543210'),
(2, 'Neha Verma', 62, 'F', '9876543211'),
(3, 'Rahul Singh', 30, 'M', '9876543212'),
(4, 'Sunita Devi', 68, 'F', '9876543213'),
(5, 'Rohit Kumar', 4, 'M', '9876543214');

-- UPDATE Queries
UPDATE TRAIN 
SET arrival_time = '16:00:00' 
WHERE train_name = 'Shatabdi Express';

UPDATE PASSENGER 
SET contact_number = '9999999999' 
WHERE passenger_id = 1;


-- DELETE Queries
DELETE FROM PASSENGER 
WHERE age < 5;

DELETE FROM TRAIN
WHERE destination = 'Delhi';

-- Extras
