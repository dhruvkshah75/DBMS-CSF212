-- set operations 
-- union operator 

-- Q1: ex: Find courses that ran in fall 2017 or in spring 2018
(select course_id from section where sem = 'Fall' and year = 2017)
union 
(select course_id from section where sem = 'Spring' and year = 2018);

-- when or is written then we use union 

-- Q2: Find courses that ran in fall 2017 and in spring 2018
-- and indicates the usage of `intersect`
(select course_id from section where sem = 'Fall' and year = 2017)
intersect 
(select course_id from section where sem = 'Spring' and year = 2018);

-- Q3: Find courses that ran in fall 2017 but not in spring 2018
-- A but not B =>   A-B
(select course_id from section where sem = 'Fall' and year = 2017)
except 
(select course_id from section where sem = 'Spring' and year = 2018);


-- VERY IMPORTANT
-- if course = 'Operating system' was offered in both the fall of 2017 and spring of 2018 then using only union 
-- it will appear only once, but if we use union all then the entry course = 'Operating system' will appear twice


