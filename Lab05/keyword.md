# How inner join query work ? 

This is a great query to break down because it perfectly illustrates why non-equi joins (using `>`, `<`, etc.) behave so differently than standard ID-matching joins.

Let's look under the hood. When you run `SELECT DISTINCT t.* FROM Teachers t INNER JOIN Students s ON t.Age > s.Age;`, the database engine processes it in three main steps.

Here is exactly what happens using the data from your slide.

### Step 1: The Join Phase (Evaluating the Condition)

The database looks at the first teacher, **Adam (Age 28)**, and scans the entire Students table to find anyone younger than him (`t.Age > s.Age`).

It finds that Adam is older than Ujwal (21), Ram (19), Quinn (20), and Tim (18). Because this is an `INNER JOIN`, it creates a temporary row for *every single successful match*.

If we could pause the database and look at its temporary working memory, Adam alone just generated 4 rows:

| t.ID | t.Name | t.Age | s.ID | s.Name | s.Age |
| --- | --- | --- | --- | --- | --- |
| 1 | Adam | 28 | 1 | Ujwal | 21 |
| 1 | Adam | 28 | 2 | Ram | 19 |
| 1 | Adam | 28 | 4 | Quinn | 20 |
| 1 | Adam | 28 | 5 | Tim | 18 |

The database then repeats this for every other teacher:

* **Vijay (40)** is older than all 5 students, so he generates 5 rows.
* **Noel (33)** is older than all 5 students, generating 5 rows.
* **Ishan (30)** is older than 4 students, generating 4 rows.
* **Jamal (50)** is older than all 5 students, generating 5 rows.

At the end of Step 1, the database has a massive, invisible temporary table containing **23 rows**.

---

### Step 2: The Select Phase (`SELECT t.*`)

Next, the database looks at what data you actually asked to see. Because you only typed `t.*` (which means "give me all columns from the Teachers table"), it chops off all the student columns from that giant 23-row temporary table.

Now, the working memory looks like this:

| t.ID | t.Name | t.Age |
| --- | --- | --- |
| 1 | Adam | 28 |
| 1 | Adam | 28 |
| *(...Adam repeats 2 more times...)* |  |  |
| 2 | Vijay | 40 |
| *(...Vijay repeats 4 more times...)* |  |  |
| *(...and so on for Noel, Ishan, and Jamal...)* |  |  |

---

### Step 3: The `DISTINCT` Phase

Finally, the database applies the `DISTINCT` keyword. It scans down those 23 rows and says, *"I only want to keep one unique copy of each teacher."*

It collapses the 4 "Adam" rows into 1. It collapses the 5 "Vijay" rows into 1, and so on.

### The Final Result

Because the youngest student is Tim at age 18, and *every single teacher* is older than 18, every teacher had at least one successful match.

Therefore, your final result will be the entire Teachers table:

| ID | Name | Age |
| --- | --- | --- |
| 1 | Adam | 28 |
| 2 | Vijay | 40 |
| 3 | Noel | 33 |
| 4 | Ishan | 30 |
| 5 | Jamal | 50 |


