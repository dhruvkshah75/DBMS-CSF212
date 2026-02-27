-- create database and use it first before running this script
USE Lab5;

-- drop tables if they exist already, order matters due to foreign key constraints
DROP TABLE IF EXISTS characters_webseries;
DROP TABLE IF EXISTS characters_movies;
DROP TABLE IF EXISTS seasons;
DROP TABLE IF EXISTS webseries;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS directors;

-- create table queries
CREATE TABLE directors (
    directorID INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    nationality VARCHAR(50) NOT NULL,
    date_of_birth DATE
);

CREATE TABLE movies (
    movieID INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    directorID INT NOT NULL,
    date_of_release DATE,
    box_office_crores DECIMAL(10,2),
    rating DECIMAL(3,1), -- scale of 10
    genre ENUM(
        'Comedy','Crime','Drama','Thriller'
    ) NOT NULL,
    FOREIGN KEY (directorID) REFERENCES directors(directorID)
);

CREATE TABLE webseries (
    webseriesID INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    directorID INT NOT NULL,
    platform ENUM(
        'Netflix','Amazon Prime Video','Disney+ Hotstar','SonyLIV'
    ) NOT NULL,
    genre ENUM(
        'Comedy','Crime','Drama','Thriller'
    ) NOT NULL,
    FOREIGN KEY (directorID) REFERENCES directors(directorID)
);

CREATE TABLE seasons (
    season_number INT NOT NULL,
    webseriesID INT NOT NULL,
    PRIMARY KEY (webseriesID, season_number),
    no_of_episodes INT,
    rating DECIMAL(3,1), -- scale of 10
    FOREIGN KEY (webseriesID) REFERENCES webseries(webseriesID)
);

CREATE TABLE actors (
    actorID INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    nationality VARCHAR(50) NOT NULL,
    date_of_birth DATE
);

CREATE TABLE characters_movies (
    name VARCHAR(100) NOT NULL,
    movieID INT NOT NULL,
    actorID INT NOT NULL,
    PRIMARY KEY (actorID, movieID),
    FOREIGN KEY (movieID) REFERENCES movies(movieID),
    FOREIGN KEY (actorID) REFERENCES actors(actorID)
);

CREATE TABLE characters_webseries (
    name VARCHAR(100) NOT NULL,
    webseriesID INT NOT NULL,
    actorID INT NOT NULL,
    PRIMARY KEY (actorID, webseriesID),
    FOREIGN KEY (webseriesID) REFERENCES webseries(webseriesID),
    FOREIGN KEY (actorID) REFERENCES actors(actorID)
);

-- insert queries
INSERT INTO directors (directorID, name, nationality, date_of_birth) VALUES
(1, 'Christopher Nolan', 'British-American', '1970-07-30'),
(2, 'Anurag Kashyap', 'Indian', '1972-09-10'),
(3, 'Rajkumar Hirani', 'Indian', '1962-11-20'),
(4, 'David Fincher', 'American', '1962-08-28'),
(5, 'Bong Joon-ho', 'South Korean', '1969-09-14'),
(6, 'Greta Gerwig', 'American', '1983-08-04'),
(7, 'Priyadarshan', 'Indian', '1957-01-30'),
(8, 'Todd Phillips', 'American', '1970-12-20'),
(9, 'Guy Ritchie', 'British', '1968-09-10'),
(10, 'S.S. Rajamouli', 'Indian', '1973-10-10'),
(11, 'Karan Anshuman', 'Indian', '1980-01-01'),
(13, 'Hansal Mehta', 'Indian', '1968-04-29'),
(18, 'James Burrows', 'American', '1940-12-30'),
(19, 'Chuck Lorre', 'American', '1952-10-18'),
(20, 'Greg Daniels', 'American', '1963-06-13'),
(21, 'Michael Schur', 'American', '1975-10-29'),
(24, 'Vince Gilligan', 'American', '1967-02-10'),
(25, 'Matt Duffer', 'American', '1984-02-15'),
(26, 'Anees Bazmee', 'Indian', '1962-11-01'),
(27, 'Vishal Bhardwaj', 'Indian', '1965-08-04'),
(28, 'Seth Gordon', 'American', '1976-07-15');

INSERT INTO movies (movieID, name, directorID, date_of_release, box_office_crores, rating, genre) VALUES
(101, 'The Dark Knight', 1, '2008-07-18', 8300.00, 9.0, 'Thriller'),
(102, 'Oppenheimer', 1, '2023-07-21', 8100.00, 8.4, 'Drama'),
(103, 'Gangs of Wasseypur', 2, '2012-06-22', 50.00, 8.2, 'Crime'),
(104, 'Ugly', 2, '2013-12-24', 6.00, 8.0, 'Thriller'),
(105, '3 Idiots', 3, '2009-12-25', 460.00, 8.4, 'Comedy'),
(106, 'Dunki', 3, '2023-12-21', 470.00, 6.7, 'Drama'),
(107, 'Se7en', 4, '1995-09-22', 2700.00, 8.6, 'Crime'),
(108, 'Gone Girl', 4, '2014-10-03', 3000.00, 8.1, 'Thriller'),
(109, 'Parasite', 5, '2019-05-30', 2100.00, 8.5, 'Thriller'),
(110, 'Lady Bird', 6, '2017-11-03', 650.00, 7.4, 'Comedy'),
(111, 'Barbie', 6, '2023-07-21', 12000.00, 6.9, 'Comedy'),
(112, 'Hera Pheri', 7, '2000-03-31', 18.00, 8.1, 'Comedy'),
(113, 'Bhool Bhulaiyaa', 7, '2007-10-12', 82.00, 7.4, 'Comedy'),
(114, 'The Hangover', 8, '2009-06-05', 3800.00, 7.7, 'Comedy'),
(115, 'Joker', 8, '2019-10-04', 8900.00, 8.4, 'Crime'),
(116, 'Snatch', 9, '2000-08-23', 680.00, 8.2, 'Crime'),
(117, 'RRR', 10, '2022-03-25', 1300.00, 7.8, 'Drama'),
(118, 'Baahubali: The Beginning', 10, '2015-07-10', 650.00, 8.0, 'Drama'),
(121, 'Welcome', 26, '2007-12-21', 120.00, 7.0, 'Comedy'),
(122, 'Garam Masala', 7, '2005-11-02', 55.00, 6.7, 'Comedy'),
(124, 'Maqbool', 27, '2004-01-30', 3.00, 8.2, 'Crime');

INSERT INTO webseries (webseriesID, name, directorID, platform, genre) VALUES
(602, 'Mirzapur', 11, 'Amazon Prime Video', 'Crime'),
(604, 'Scam 1992', 13, 'SonyLIV', 'Crime'),
(609, 'Friends', 18, 'Netflix', 'Comedy'),
(610, 'The Big Bang Theory', 19, 'Netflix', 'Comedy'),
(611, 'The Office', 20, 'Amazon Prime Video', 'Comedy'),
(612, 'Brooklyn Nine-Nine', 21, 'Netflix', 'Comedy'),
(615, 'Breaking Bad', 24, 'Netflix', 'Crime'),
(616, 'Stranger Things', 25, 'Netflix', 'Thriller'),
(617, 'Sneaky Pete', 28, 'Amazon Prime Video', 'Crime');

INSERT INTO seasons (season_number, webseriesID, no_of_episodes, rating) VALUES
(1, 602, 9, 8.5),
(2, 602, 10, 8.4),
(3, 602, 10, 7.6);

INSERT INTO seasons (season_number, webseriesID, no_of_episodes, rating) VALUES
(1, 604, 10, 9.3);

INSERT INTO seasons (season_number, webseriesID, no_of_episodes, rating) VALUES
(1, 609, 24, 8.9), (2, 609, 24, 8.7), (3, 609, 25, 9.1), (4, 609, 24, 9.2), (5, 609, 24, 9.0),
(6, 609, 25, 8.8), (7, 609, 24, 8.6), (8, 609, 24, 9.3), (9, 609, 24, 8.5), (10, 609, 18, 9.4);

INSERT INTO seasons (season_number, webseriesID, no_of_episodes, rating) VALUES
(1, 610, 17, 8.2), (2, 610, 23, 8.3), (3, 610, 23, 8.5), (4, 610, 24, 8.4), (5, 610, 24, 8.2),
(6, 610, 24, 8.1), (7, 610, 24, 8.0), (8, 610, 24, 7.8), (9, 610, 24, 7.7), (10, 610, 24, 7.6),
(11, 610, 24, 7.5), (12, 610, 24, 8.2);

INSERT INTO seasons (season_number, webseriesID, no_of_episodes, rating) VALUES
(1, 611, 6, 7.9), (2, 611, 22, 8.9), (3, 611, 25, 9.0), (4 ,611 ,19 ,8.8) , (5 ,611 ,28 ,8.9),
(6, 611, 26, 8.6), (7, 611, 26, 8.7), (8, 611, 24, 7.6), (9, 611, 25, 8.1);

INSERT INTO seasons (season_number, webseriesID, no_of_episodes, rating) VALUES
(1, 612, 22, 8.5), (2, 612, 23, 8.6), (3, 612, 23, 8.6), (4, 612, 22, 8.7), (5, 612, 22, 8.8),
(6, 612, 18, 8.3), (7, 612, 13, 8.2), (8, 612, 10, 8.4);

INSERT INTO seasons (season_number, webseriesID, no_of_episodes, rating) VALUES
(1, 615, 7, 9.0),
(2, 615, 13, 9.3),
(3, 615, 13, 9.1),
(4, 615, 13, 9.5),
(5, 615, 16, 9.7);

INSERT INTO seasons (season_number, webseriesID, no_of_episodes, rating) VALUES
(1, 616, 8, 8.8),
(2, 616, 9, 8.7),
(3, 616, 8, 8.5),
(4, 616, 9, 8.9),
(5, 616, 8, 9.0);

INSERT INTO seasons (season_number, webseriesID, no_of_episodes, rating) VALUES
(1, 617, 10, 8.5),
(2, 617, 10, 8.3),
(3, 617, 10, 8.0);

INSERT INTO actors (actorID, name, nationality, date_of_birth) VALUES
(1001, 'David Schwimmer', 'American', '1966-11-02'),
(1002, 'Jim Parsons', 'American', '1973-03-24'),
(1003, 'Kaley Cuoco', 'American', '1985-11-30'),
(1004, 'Bryan Cranston', 'American', '1956-03-07'),
(1005, 'Millie Bobby Brown', 'British', '2004-02-19'),
(1006, 'Christian Bale', 'British', '1974-01-30'),
(1007, 'Heath Ledger', 'Australian', '1979-04-04'),
(1008, 'Cillian Murphy', 'Irish', '1976-05-25'),
(1009, 'Robert Downey Jr.', 'American', '1965-04-04'),
(1010, 'Manoj Bajpayee', 'Indian', '1969-04-23'),
(1011, 'Nawazuddin Siddiqui', 'Indian', '1974-05-19'),
(1012, 'Aamir Khan', 'Indian', '1965-03-14'),
(1013, 'Brad Pitt', 'American', '1963-12-18'),
(1014, 'Morgan Freeman', 'American', '1937-06-01'),
(1015, 'Song Kang-ho', 'South Korean', '1967-01-17'),
(1016, 'Saoirse Ronan', 'Irish', '1994-04-12'),
(1017, 'Akshay Kumar', 'Indian', '1967-09-09'),
(1018, 'Paresh Rawal', 'Indian', '1955-05-30'),
(1019, 'Joaquin Phoenix', 'American', '1974-10-28'),
(1020, 'N. T. Rama Rao Jr.', 'Indian', '1983-05-20'),
(1021, 'Ram Charan', 'Indian', '1985-03-27'),
(1022, 'Prabhas', 'Indian', '1979-10-23'),
(1023, 'Saif Ali Khan', 'Indian', '1970-08-16'),
(1024, 'Pankaj Tripathi', 'Indian', '1976-09-28'),
(1025, 'Jitendra Kumar', 'Indian', '1990-09-01'),
(1026, 'Jennifer Aniston', 'American', '1969-02-11'),
(1027, 'Steve Carell', 'American', '1962-08-16'),
(1028, 'Andy Samberg', 'American', '1978-08-18'),
(1031, 'Pratik Gandhi', 'Indian', '1980-04-28'),
(1032, 'Jameel Khan', 'Indian', '1974-09-16'),
(1033, 'Aditya Roy Kapur', 'Indian', '1985-11-16'),
(1034, 'Kay Kay Menon', 'Indian', '1966-10-02'),
(1036, 'Rahul Bhat', 'Indian', '1977-12-07'),
(1037, 'Shah Rukh Khan', 'Indian', '1965-11-02'),
(1038, 'Ben Affleck', 'American', '1972-08-15'),
(1039, 'Margot Robbie', 'Australian', '1990-07-02'),
(1040, 'Bradley Cooper', 'American', '1975-01-05'),
(1041, 'Vidya Balan', 'Indian', '1979-01-01'),
(1045, 'Emily Blunt', 'British', '1983-02-23'),
(1046, 'Katrina Kaif', 'British', '1983-07-16'),
(1047, 'Nana Patekar', 'Indian', '1951-01-01'),
(1048, 'J.D. Chakravarthy', 'Indian', '1970-04-16'),
(1049, 'Irrfan Khan', 'Indian', '1967-01-07'),
(1050, 'Pankaj Kapur', 'Indian', '1954-05-29');

INSERT INTO characters_webseries (name, webseriesID, actorID) VALUES
('Ross Geller', 609, 1001),
('Sheldon Cooper', 610, 1002),
('Penny Hofstadter', 610, 1003),
('Walter White', 615, 1004),
('Eleven', 616, 1005),
('Kaleen Bhaiya', 602, 1024),
('Rachel Green', 609, 1026),
('Michael Scott', 611, 1027),
('Jake Peralta', 612, 1028),
('Harshad Mehta', 604, 1031),
('Vince Lonigan', 617, 1004);

INSERT INTO characters_movies (name, movieID, actorID) VALUES
('Bruce Wayne', 101, 1006),
('The Joker', 101, 1007),
('J. Robert Oppenheimer', 102, 1008),
('Lewis Strauss', 102, 1009),
('Sardar Khan', 103, 1010),
('Faizal Khan', 103, 1011),
('Rancho', 105, 1012),
('David Mills', 107, 1013),
('William Somerset', 107, 1014),
('Raju', 112, 1017),
('Baburao Ganpatrao Apte', 112, 1018),
('Komaram Bheem', 117, 1020),
('Alluri Sitarama Raju', 117, 1021),
('Rahul Kapoor', 104, 1036),
('Hardyal Singh Dhillon', 106, 1037),
('Nick Dunne', 108, 1038),
('Kim Ki-taek', 109, 1015),
('Lady Bird McPherson', 110, 1016),
('Stereotypical Barbie', 111, 1039),
('Avni Chaturvedi', 113, 1041),
('Dr. Aditya Shrivastav', 113, 1017),
('Phil Wenneck', 114, 1040),
('Arthur Fleck', 115, 1019),
('Mickey O Neil', 116, 1013),
('Amarendra Baahubali', 118, 1022),
('Katherine Oppenheimer', 102, 1045),
('Rajiv Saini', 121, 1017),
('Sanjana', 121, 1046),
('Uday Shetty', 121, 1047),
('Shyam "Sam"', 122, 1017),
('Mian Maqbool', 124, 1049),
('Abba Ji', 124, 1050);