-- Delete the data from all the tables without dropping the tables 

-- First we need to set the foreign key checks to 0 as we cant drop or truncate a table if it has foreign key reference in it 

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE students;
TRUNCATE courses;
TRUNCATE enrollments;

SET FOREIGN_KEY_CHECKS = 1;

-- truncating the table resets the auto increment counter back to one 
