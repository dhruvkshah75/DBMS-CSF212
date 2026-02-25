--Q1
select s1.name as student1_name, s2.name as student2_name from students s1 
inner join students s2 on s1.batch = s2.batch
where s1.id != s2.id;

-- Q2 
select s.name as student_name, t.name as teachers_name 
from (assignments a inner join students s on a.student_id = s.id)
inner join teachers t on a.teacher_id = t.id;

--Q3
select s.name as student_name, a.grade as grade, t.name as teacher_name 
from students s left join (assignments a left join teachers t on a.teacher_id = t.id) 
on s.id = a.student_id 
order by a.grade desc; 

-- Q4
select s.id as student_id, s.name as student_name, avg(a.grade) as avg_grade 
from students s inner join assignments a on s.id = a.student_id 
group by a.student_id having avg_grade > 85;

-- group by for a particular student to get average grade 

-- for not use left join and those whose column is null 

-- Q5
select t.id, t.name from (teachers t left join assignments a on t.id = a.teacher_id) 
left join teacher_projects p on t.id = p.teacher_id 
where p.project_id is NULL and a.id is NULL;

