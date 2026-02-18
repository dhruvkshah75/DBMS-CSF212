-- when we apply nested queries and we do 
-- where .. = () works only for one to one 
SELECT * FROM Employees
WHERE ID = (SELECT Manager_ID FROM Departments WHERE Name = 'Sales');
-- we know that the inner query returns only one value 

-- where .. in () works for 1 to may relationship
SELECT * FROM Employees
WHERE ID IN (SELECT Employee_ID FROM Project_Assignments WHERE Project_Status = 'Active');
-- the inner query results in a list of possible values 

-- Display the names of all students whose at least one course is taught completely/partially by "Ted Mosby".
-- the inner modt query would be 
select teaches from instructor where instr_name = 'Ted Mosby';

-- find how the tables are connected 


-- Q: SLIDE 2 NESTED QUERY
select stud_name from students where id in (
    select stud_id in takes where course_num in (
        select teaches from instructor where instr_name = 'Ted Mosby'
));


-- Q2: Nested Queries SLIDE 2

-- we have to populate tot_credits in students 
-- inner query think that we want to make the total credits for one student 
select sum(c.cred) from takes t, courses c


update stduents s 
set tot_credits = (
    select sum(c.cred) from takes t, courses c 
    where t.course_num = c.course_num
    and t.stud_id = s.id
);



--- IMPORTANT QUESTION 
-- Select records with average salary per department > 20000 and order it by age in descending order

