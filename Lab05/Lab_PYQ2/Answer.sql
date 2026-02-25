select s1.name as student1_name, s2.name as student2_name from students as 
s1 INNER JOIN students as s2 on 
s1.batch = s2.batch and s1.id <> s2.id;


select students.name as student_name, teachers.name as teacher_name from (
    students INNER JOIN assignments on students.id = assignments.student_id) 
INNER JOIN teachers on assignments.teacher_id = teachers.id;

select students.name as student_name, assignments.grade ,teachers.name as teacher_name 
from (students LEFT JOIN assignments on students.id = assignments.student_id) 
LEFT JOIN teachers on assignments.teacher_id = teachers.id order by assignments.grade DESC;

select students.id as student_id, students.name as student_name, AVG(grade) as avg_grade 
from assignments INNER JOIN students on assignments.student_id = students.id 
group by assignments.student_id having avg_grade > 85;


select t.id, t.name from (teachers as t LEFT JOIN teacher_projects as p on p.teacher_id = t.id) 
LEFT JOIN assignments as a on a.teacher_id = t.id 
where p.project_id is NULL && a.id is NULL;

select t.id, t.name, t.age from teachers as t INNER JOIN courses as c on t.course_id = c.id where c.name = "Mathematics" order by t.age limit 1;
select t.name from ((teachers as t INNER JOIN teacher_projects as tp on tp.teacher_id = t.id) INNER JOIN projects as p on p.id = tp.project_id) INNER JOIN courses as c on (c.id = t.course_id && p.course_id = c.id) where c.name = "Mathematics" order by p.budget desc limit 1;
select s.id, s.name from students as s INNER JOIN assignments as a on a.student_id = s.id where month(a.date_submitted) = 3 && a.grade <= all(select grade from assignments as a where month(a.date_submitted) = 3);