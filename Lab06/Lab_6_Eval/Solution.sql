-- Student Solution
-- IMPORTANT: Rename this file to <your_student_id>_Lab6.sql
-- Example: 2021A7PS0001G_Lab6.sql
--
-- Write your SQL queries below
-- Each query should be separated by semicolons
-- If you don't know the answer to a question, just write a semicolon (;)
-- DO NOT COPY '->' character from MySQL in the solution file!
-- IMPORTANT: Multiline query is acceptable, BUT make sure words don't break into new lines, i.e., a complete word/string should remain in a single line.
-- Example of wrong query:(table name breaking into new line)
--           SELECT * FROM PASSE
--           NGERS; 
-- Example of wrong query: (keyword breaking into new line)
--           SELECT passenger_id FROM PASSENGERS UNI
--           ON SELECT passenger_id FROM TICKETS;
-- Example of wrong query: (string breaking into new line)
--          SELECT passenger_id FROM PASSENGERS WHERE name = "John
--          Wick"

-- Q1: SELECT (must use cross join or comma, without other joins, without set operations, without nested select)
select 
    s.studentName,
    d.deptName
from 
    students s, departments d
where 
    s.majorDeptId = d.deptId
order by s.studentName asc;

-- Q2: SELECT (must use cross join or comma, without other joins, without set operations, without nested select)
select 
    c.courseName, 
    s.semester,
    s.year,
    count(distinct e.studentId) as total_students
from 
    courses c, sections s, enrollments e 
where 
    c.courseId = s.courseId and s.sectionId = e.sectionId
group by 
    e.sectionId;

-- Q3: SELECT (must use cross join or comma, without other joins, without set operations, without nested select)
select 
    distinct i.instructorId, 
    i.firstName,
    i.lastName
from 
    instructors i, sections s, courses c
where 
    i.instructorId = s.instructorId and s.courseId = c.courseId and i.deptId != c.deptId;

-- Q4: SELECT (must use cross join or comma, without other joins, without set operations, without nested select)
select 
    s1.studentName,
    s2.studentName
from 
    students s1, students s2 
where 
    s1.majorDeptId = s2.majorDeptId and s1.yearOfStudy != s2.yearOfStudy 
    and (s1.studentName like 'A%' or s2.studentName like 'A%') and s1.studentId < s2.studentId;


-- Q5: SELECT (must use cross join or comma, without other joins, without set operations, without nested select)
select 
    d.deptName,
    count(distinct e.studentId) as total_students
from 
    departments d, courses c, sections s, enrollments e 
where 
    d.deptId = c.deptId and c.courseId = s.courseId and s.sectionId = e.sectionId 
group by c.deptId 
having total_students > 0;


-- Q6: SELECT (must use join, without cross join or comma, without set operations, without nested select)
select
    s.studentId,
    s.studentName,
    count(distinct e.sectionId) as total_sections
from 
    students s left join enrollments e on s.studentId = e.studentId 
group by 
    s.studentId 
order by 
    s.studentId asc;

-- Q7: SELECT (must use join, without cross join or comma, without set operations, without nested select)
select 
    s.sectionId, 
    st.studentName
from 
    (sections s left join enrollments e on s.sectionId = e.sectionId)
    left join students st on e.studentId = st.studentId
where 
    s.semester = 'Spring'
order by s.sectionId desc;


-- Q8: SELECT (must use join, without cross join or comma, without set operations, without nested select)
-- not teaching any section => use left join 
select 
    i.instructorId,
    i.firstName, 
    i.lastName
from 
    instructors i left join sections s on i.instructorId = s.instructorId
where 
    s.sectionId is NULL;

-- Q9: SELECT (must use join, without cross join or comma, without set operations, without nested select)
-- since we want departments where no students have enrolled any course so just group by deptId and count studentid 
-- inner join is used so department has offered 
select 
    d.deptId, 
    d.deptName
from 
    departments d inner join courses c on d.deptId = c.deptId 
    inner join sections s on c.courseId = s.courseId 
    left join enrollments e on s.sectionId = e.sectionId
group by 
    d.deptId
having 
    count(distinct e.studentId) = 0;

-- Q10: SELECT (must use join, without cross join or comma, without set operations, without nested select)
select 
    i.instructorId,
    i.firstName, 
    i.lastName,
    sum(la.stipend) as total_stipend
from 
    instructors i left join sections s on i.instructorId = s.instructorId 
    left join lab_assistants la on s.sectionId = la.sectionId
group by 
    i.instructorId;

-- End of solution
