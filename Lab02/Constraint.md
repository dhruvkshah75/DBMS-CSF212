# Constraints on DQL

## THEORY 
---

# Database Integrity Constraints: A Brief Overview

In the world of databases, **constraints** are the "rules of the road." They ensure that the data entering your tables is accurate, reliable, and consistent. Think of them as the gatekeepers that prevent "garbage in, garbage out."

---

## 1. Domain Integrity Constraints

These focus on the validity of data within a specific column. They ensure that every entry falls within a defined range or format.

* **NOT NULL Constraint**: By default, columns can be left empty (NULL). This rule forces a column to always contain a value—no "blanks" allowed.
* **CHECK Constraint**: Acts as a filter. It only allows values that meet a specific condition (e.g., ensuring an `age` column only accepts numbers greater than 18).

---

## 2. Entity Integrity Constraints

These ensure that every row (entity) in a table is unique and identifiable. This prevents "data clones" from messing up your records.

* **UNIQUE Constraint**: Ensures all values in a column are different. It’s perfect for things like email addresses or phone numbers.
* **PRIMARY KEY Constraint**: The "VIP" of constraints. Like a UNIQUE constraint, it prevents duplicates, but it also **strictly forbids NULL values**.
> **Note:** You cannot apply a Primary Key to a column using the `LONG` data type.



---

## 3. Referential Integrity Constraints

This is all about the "social life" of your database—how tables talk to each other. It ensures that relationships between tables remain intact.

* **FOREIGN KEY**: This designates a column as a link to another table's Primary or Unique key.
* **The Parent-Child Dynamic**:
* **Parent Table**: The table containing the original (referenced) key.
* **Child Table**: The table containing the Foreign Key that points back to the parent.

---

### Summary Table

| Constraint Type | Primary Goal | Key Examples |
| --- | --- | --- |
| **Domain** | Data accuracy within a column | `NOT NULL`, `CHECK` |
| **Entity** | Row uniqueness | `UNIQUE`, `PRIMARY KEY` |
| **Referential** | Consistency between tables | `FOREIGN KEY` |

---




















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






