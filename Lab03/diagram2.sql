
-- SQL code for Relationship 
CREATE TABLE Registers (
    student_id INT,
    course_id INT,
    instructor_id INT,
    sem VARCHAR(10),
    year INT,
    -- primary key is student_id, course_id, not instructor_id 
    -- as we want students, course combination to have one instructor only 
    PRIMARY KEY(student_id, course_id),
    -- now the 3 foreign keys 
    CONSTRAINT fk_student_id FOREIGN KEY(student_id)
        REFERENCES students(student_id) ON DELETE CASCADE,
    CONSTRAINT fk_course_id FOREIGN KEY(course_id)
        REFERENCES courses(course_id) ON DELETE CASCADE,
    CONSTRAINT fk_instructor_id FOREIGN KEY(instructor_id)
        REFERENCES instructors(instructor_id) ON DELETE CASCADE   
);