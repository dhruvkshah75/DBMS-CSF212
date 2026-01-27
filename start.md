# MySQL
How to login into sql and get sql-shell
```bash
sudo mysql -u root -p
``` 
**`-u root`** specifies the user u want to login in as  
**`-p`** tells the mySQL to prompt u for the mySQL password  
Note: The password is set to as `password123`  

---

## Basic Terminal Commands

Once you see the `mysql>` prompt, you are inside the database environment. Here are the most common commands to get started:

| Command | Action |
| --- | --- |
| `SHOW DATABASES;` | Lists all databases on the server. |
| `CREATE DATABASE my_test_db;` | Creates a new database. |
| `USE my_test_db;` | Switches to that database. |
| `SHOW TABLES;` | Shows tables within the selected database. |
| `EXIT;` | Exits the MySQL shell and returns to Linux terminal. |

---

### Run the File

Type `source` followed by the **path** to your file. 
```sql
source /home/dhruv/Desktop/my_script.sql

```
> **Pro Tip:** If you aren't sure of the exact path, you can open another terminal tab and type `readlink -f filename.sql` to get the full absolute path to copy-paste.

---
  

# PostgreSQL
To access the PostgreSQL terminal (known as **psql**) on a Linux machine, you generally use the default `postgres` system user. 

If you have `sudo` privileges, you can switch to the `postgres` user and launch the shell in one command:
```bash
sudo -u postgres psql

```
* **`-u postgres`**: Runs the command as the system user "postgres."
* **`psql`**: Opens the interactive PostgreSQL terminal.

---


### Essential Postgres Terminal Commands

The `psql` interface uses "meta-commands" which start with a backslash (**`\`**). These are different from standard SQL commands.

| Action | Command |
| --- | --- |
| **List all databases** | `\l` |
| **Connect/Switch to a database** | `\c database_name` |
| **List all tables** | `\dt` |
| **Describe a table (columns/types)** | `\d table_name` |
| **List all users/roles** | `\du` |
| **Get Help** | `\?` |
| **Quit/Exit psql** | `\q` |
