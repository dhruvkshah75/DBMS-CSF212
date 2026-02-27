-- Student Solution
-- IMPORTANT: Rename this file to <your_student_id>_Lab5.sql
-- Example: 2021A7PS0001G_Lab5.sql
--
-- Write your SQL queries below
-- Each query should be separated by semicolons
-- If you don't know the answer to a question, just write a semicolon (;)
-- DO NOT COPY '->' character from mysql in solution file !
-- IMPORTANT: Make sure strings and words don't break into new lines, i.e., a complete word should remain in single line.
-- Example of wrong query:(table name breaking into new line)
--      SELECT * FROM PASSE
--      NGERS; 
-- Example of wrong query: (keyword breaking into new line)
--      (SELECT passenger_id FROM PASSENGERS) UNI
--      ON (SELECT passenger_id FROM TICKETS); 

-- Example of wrong query: (string breaking into new line)
--      (SELECT passenger_id FROM PASSENGERS) WHERE name = "John
--      Wick" 

-- Q1: SELECT (without join, must use nested select)
select name, date_of_birth from directors where nationality = 'Indian' and 
directorID in (
    select directorID from movies where genre = 'Crime'
) order by date_of_birth asc;

-- Q2: SELECT (without join, must use nested select)
select name from actors where actorID in (
    select actorID from characters_webseries where actorID not in (
        select actorID from characters_movies
    )
) and nationality != 'Indian' 
order by name asc;

-- Q3: SELECT (without join, must use nested select)
-- the movie must belong between 2010 and 2020 and 
-- must be highest grossing in that period 
select directorID, name from directors where directorID in (
    select directorID from movies where year(date_of_release) >= 2010 
    and year(date_of_release) <= 2020 and box_office_crores >= all (
        select box_office_crores from movies where 
        year(date_of_release) >= 2010 and 
        year(date_of_release) <= 2020
    )
);

-- Q4: SELECT (without join, must use nested select)
select webseriesID, count(season_number) as no_of_seasons, sum(no_of_episodes) as total_no_of_episodes
from seasons where webseriesID in (
    select webseriesID from characters_webseries where name in (
        'Ross Geller', 'Sheldon Cooper', 'Penny Hofstadter'
    ) or actorID in (
        select actorID from actors where name in (
            'Bryan Cranston', 'Millie Bobby Brown'
        )
    )
) group by webseriesID order by total_no_of_episodes desc;

-- Q5: SELECT (without join, must use nested select)
select name from webseries where platform in ('Netflix', 'Amazon Prime Video') 
and genre = 'Comedy' and webseriesID in (
    select webseriesID from seasons group by webseriesID having avg(rating) >= all(
        select avg(rating) from movies where genre = 'Comedy' and movieID in (
            select movieID from characters_movies where actorID in (
                select actorID from actors where name = 'Akshay Kumar'
            )
        )
    )
) order by webseries.name asc;

-- Q6: SELECT (must use join, without nested select)
select distinct d.name, d.date_of_birth from directors d 
inner join movies m on d.directorID = m.directorID 
where d.nationality = 'Indian' and m.genre = 'Crime' 
order by d.date_of_birth asc;

-- Q7: SELECT (must use join, without nested select)
select distinct a.name from (
    actors a left join characters_webseries w on a.actorID = w.actorID)
left join characters_movies m on a.actorID = m.actorID 
where a.nationality != 'Indian' and w.webseriesID is not null and 
m.movieID is NULL order by name asc;


-- Q8: SELECT (must use join, without nested select)
select d.directorID, d.name from directors d 
inner join movies m on d.directorID = m.directorID where 
year(m.date_of_release) >= 2010 and year(m.date_of_release) <= 2020 
order by box_office_crores desc limit 1;


-- Q9: SELECT (must use join, without nested select)
select s.webseriesID, count(s.season_number) as no_of_seasons, sum(s.no_of_episodes) as total_no_of_episodes
from seasons s inner join (characters_webseries c inner join actors a on c.actorID = a.actorID)
on s.webseriesID = c.webseriesID where c.name in 
('Ross Geller', 'Sheldon Cooper', 'Penny Hofstadter') 
or a.name in ('Bryan Cranston', 'Millie Bobby Brown') 
group by s.webseriesID order by total_no_of_episodes desc;


-- Q10: SELECT (must use join, without nested select)
select c.name as characterName, m.name as movieName, a.name as playedBy from 
((characters_movies c inner join (movies m inner join directors d on m.directorID = d.directorID) 
    on c.movieID = m.movieID) inner join actors a on c.actorID = a.actorID
) where d.name = 'Christopher Nolan' and a.date_of_birth > d.date_of_birth 
and a.nationality != 'American' order by characterName;

-- End of solution
