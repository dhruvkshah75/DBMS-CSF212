-- Make sure to rename this file as student_id_Lab3.sql (E.g.: 2024A7PS0001G_Lab3.sql, 2023B4A70800G_Lab3.sql)
-- Make sure the words in your query don't break into a new line.
-- Make sure your query ends with a semicolon.

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(255),   
    Mentorship INT,
    CONSTRAINT fk_mentorship FOREIGN KEY(Mentorship) 
        REFERENCES Authors(AuthorID) 
        ON UPDATE CASCADE ON DELETE SET NULL 
);

CREATE TABLE Email (
    AuthorID INT,
    Email VARCHAR(255) UNIQUE,
    PRIMARY KEY(AuthorID, Email),
    CONSTRAINT chk_email CHECK (Email NOT LIKE "% %" AND
        Email LIKE "%_@_%" AND Email LIKE "%_._%"),
    -- foreign key constraint on AuthorID
    CONSTRAINT fk_auth_id FOREIGN KEY(AuthorID) 
        REFERENCES Authors(AuthorID) 
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Publishers(
    PublisherID INT PRIMARY KEY,
    Firstname VARCHAR(255) NOT NULL,
    Surname VARCHAR(255) NOT NULL,
    Country VARCHAR(255),
    Collaborates INT UNIQUE,  -- unique to maintain 1:1 Relationship
    -- foreign key constraint 
    CONSTRAINT fk_author_id FOREIGN KEY(Collaborates) 
        REFERENCES Authors(AuthorID)
        ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Price DECIMAL(5,2),  -- can be null 
    Publishes INT NOT NULL,  -- not null due to total participation 
    -- constraints 
    CONSTRAINT chk_price CHECK(Price > 0),
    -- foreign key will have cascade due to total participation 
    CONSTRAINT fk_publisher_id FOREIGN KEY(Publishes)
        REFERENCES Publishers(PublisherID) 
        ON DELETE CASCADE ON UPDATE CASCADE
);