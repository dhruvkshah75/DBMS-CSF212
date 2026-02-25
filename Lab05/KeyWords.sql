-- usage of any and all in nested queries 

/*

    Teachers TABLE 
    ID      Name      Age 
    1       Adam      28 
    2       Vijay     40 
    3       Noel      33 
    4       Ishan     30 
    5       Jamal     50 

    Students TABLE 
    ID      Name      Age 
    1       Ujwal     21 
    2       Ram       19 
    3       Aman      32 
    4       Quinn     20 
    5       Tim       18 

*/
-- query using nested query  
select * from Teachers 
where age < ANY ( 
    select Age from Students
);
-- this query returns the teachers with whose age is less than at least 1 student 

-- above query using joins => we must use inner join as we want to filter out teachers on the basis of their age 
-- t.* prints all the columns of t table 
select distinct t.* from Teachers t 
inner join Students s on t.Age < s.Age;

/*
    Why we need distinct ? 
    When we do this join, the database looks at every possible combination of teachers and students.

    If a teacher is younger than three different students, the INNER JOIN will successfully match them three times, 
    outputting that teacher's name on three separate rows!

    By adding the word DISTINCT right after SELECT, we tell the database: 
    "Once you find a valid match that proves the teacher is younger than at least one student, 
    just list the teacher's name once and ignore any other matches."
*/


select * from Teachers 
where age > ALL(
    select Age from students
);

-- this query returns all the teachers whose age is more than all the students 

-- this above query using joins 
-- Remember that an INNER JOIN just looks for at least one successful match

-- we must use left join 
select t.* from Teachers t
left join Students s on t.Age <= s.Age 
where s.ID is NULL;

/*
    Pair my teachers with any student who is OLDER or EQUAL to them. 
    Then, only give me the teachers who found ZERO matches 
    => this technically maintains the table containing all the teachers whose age is greater than all the students 
*/