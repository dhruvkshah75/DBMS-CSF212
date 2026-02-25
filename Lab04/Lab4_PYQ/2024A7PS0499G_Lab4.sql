-- Student Solution
-- IMPORTANT: Rename this file to <your_student_id>_Lab4.sql
-- Example: 2021A7PS0001G_Lab4.sql
--
-- Write your SQL queries below
-- Each query should be separated by semicolons
-- If you don't know the answer to a question, just write a semicolon (;)

-- Q1: SELECT 
select deptId from instructors 
where salary > 60000
group by deptId having count(*) > 2;


-- Q2: SELECT 
select deptId, avg(salary) as avg_salary from instructors
group by deptId order by avg_salary desc limit 1,1;


-- Q3: SELECT 
select year from sections 
group by year order by count(*) desc limit 1;


-- Q4: SELECT 
select sectionId from lab_assistants 
group by sectionId having count(*) > 1;


-- Q5: SELECT  
((select studentId from students)
    except (select studentId from enrollments))
intersect
((select studentId from students)
    except (select studentId from lab_assistants));


-- Q6: SELECT 
(select deptId from lab_assistants)
except
(select deptId from courses 
    group by deptId having count(*) > 1);


-- Q7: SELECT 
(select instructorId from sections 
    group by instructorId having count(*) > 2)
union 
(select instructorId from instructors where deptId = 3);


-- Q8: SELECT  
(select deptId from instructors
    group by deptId having count(*) = 1)
union 
(select deptId from lab_assistants
    group by deptId having count(*) = 1);


-- Q9: SELECT 
(select majorDeptId as stable_departments from students
    group by stable_departments)
intersect 
((select deptId as stable_departments from instructors
        group by stable_departments)
    intersect 
    (select deptId as stable_departments from courses
        group by stable_departments));


-- Q10: SELECT 
(select deptId as atrisk_departments from instructors
    group by atrisk_departments having count(*) = 1)
intersect
(select deptId as atrisk_departments from courses
    group by atrisk_departments having count(*) > 1);

-- End of solution
