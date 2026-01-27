# Constraints on DQL

## Retrieving information from the table 
`*` indicates all the columns, but if we list columns then we get certain columns 
```sql
SELECT what_to_select 
FROM which_table
WHERE conditions_to_satify;

-- what_to_select can be a list of columns or can be * meaning all the columns 

```

## Selecting distinct rows
we use the **`DISTINCT`** tag to remove duplicate names
```sql
SELECT DISTINCT <column_name> FROM <tablename>;

-- Example to display the names of all students ignoring duplicate names 
-- i want to print only the names but i dont want John to appear twice then we do 
SELECT DISTINCT student_name FROM students; 
-- This command will print John once rather than John, John, John ...
```
This even works on multiple columns  
**One Column:** 
- `SELECT DISTINCT City FROM Users;`: Returns every unique city name in the table.  

**Multiple Columns:** 
- `SELECT DISTINCT City, Country FROM Users;`:  Returns **unique pairs**. If you have "London, UK" twice, it shows up once.  
If you have "Paris, France" and "Paris, Texas," **both** will appear because the combination is unique.






