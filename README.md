# 1️⃣. What is postgreSQL?

<p>In the digital age, data is everything. If we are building a small web app or running a large enterprise system, we need a powerful, reliable database.

**PostgreSQL**  is a **powerful, open-source, object-relational database system**. It has a strong reputation for reliability, data integrity, and performance.It was first released in 1989 at the University of California, Berkeley, and has grown into one of the most trusted database systems in the world.

__PostgreSQL = "Postgres" + "Structured Query Language (SQL)"__ Many developers just call it `Postgres`.

PostgreSQL stores our data in **tables**. just like other relational databases  and  interact with it using `SQL` (Structured Query Language).

__We can do with postgreSQL:__
* Create and modify tables
* Insert, update, or delete records
* Query for data using powerful SELECT statements
* Perform JOINs to combine data from multiple tables
* Use stored procedures, functions, and triggers for complex logic

PostgreSQL runs as a **server**, which means it listens  requests from client applications and responds with data.
**It's Open Source and Free-** No license fees. we can use and modify PostgreSQL as we wish and **It’s Feature-Rich-** PostgreSQL supports advanced SQL features.PostgreSQL has a huge and active developer community. Updates and new features are released regularly.

PostgreSQL is ACID-compliant, which means transactions are **Atomic, Consistent, Isolated, and Durable**. It also supports **point-in-time recovery**, **replication**, and **automatic failover**.


PostgreSQL is used in a wide range of applications:
`Web Development`-
`Financial Systems`-
`Geographic Applications`-
`Analytics & Reporting`-
`Mobile & SaaS Products`

__Popular Companies Using PostgreSQL:__
`Apple`-
`Instagram`-
`Reddit`-
`Spotify`-
`Uber`-
`NASA`

</p>

# 2️⃣. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

<p> PostgresSQL store data table wise.A table create with Row and column.Basically every row store different data column wise.if we want to operate CRUD operation in a table we need to identify every row uniquely. postgresSQL makes differences between row/record with key.Key is the one of most important things in database which helps to store data correctly and connect each others tables.

**Primary Key:** The **primary key** constraint uniquely identifies each record in a table.Primary keys must contain UNIQUE values, and cannot contain NULL values.A table can have only ONE primary key and in the table, this primary key can consist of single or multiple columns.if we want to store any person data here person_Fid can be primary key.

table of person:

| person_id | name  | age | address  |
| --------- | ----- | --- | -------- |
| 1         | Rahim | 26  | Dhaka    |
| 2         | Karim | 29  | Barishal |
| 3         | Rahim | 29  | Dhaka    |

In this table has id,name, age and address. if we want to know any of row data we need to uniquely identify from others table otherwise we donn't get exact data. Name, Age, and Address may be repeated in columns in this table so they violate the rules of the primary key.only unique is person_id so id is the primary key for this table.

**Foreign Key:** A Foreign key is a key that is used as a primary key for another table.we can connect two table using foreign key.The table with the foreign key is called the child table, and the table with the primary key is called the referenced or parent table.

**order Table:**

| order_id | person_id | amount | date       |
| -------- | --------- | ------ | ---------- |
| 1        | 1         | 1500   | 2025-05-25 |
| 2        | 1         | 2000   | 2025-05-24 |
| 3        | 2         | 900    | 2025-05-25 |
| 4        | 3         | 3000   | 2025-05-22 |

Here order_id is the primary key and person_id is the foreign key for the order table. we can connect person table and order table using person_id.

</p>

# 4️⃣.What is the difference between the VARCHAR and CHAR data types?

<p> we can use both  VARCHAR and CHAR when input string but its has different use case.

 __VARCHAR(n):__ Variable-length character string  varchar(n), n= character length how many character can we store any single input. suppose we set varchar(10) that means we can input maximum 10 character including space.we can't store more than 10 character but can be less.if we input less than ten its Stores only the characters we enter.
exp: VARCHAR(5) stores 'BD' as 'BD' no extra space.
we can use varchar(n) where character length  varying likes name,email,address, descriptions, comments.

 __CHAR(n):__ 	Fixed-length character string CHAR(n)- n= character length how many character can we store any single input. suppose we set char(5) that means we can input maximum five character including space.we can't store more than five but can be less than five.if our character less than five its store remaining character with space.
exp: CHAR(5) stores 'BD' as 'BD   ' 3 extra space
so we can use CHAR(n) where we know out character are fixed like, country_code,product-code,phone number,nid etc.

</p>


# 4️⃣. What are the LIMIT and OFFSET clauses used for?
 <p> In SQL, Especially Postgres Data Base used  <span style="background-color: #333; color: white;">LIMIT </span>  and <span style="background-color: #333; color: white;"> OFFSET</span> for controlling how many rows we want to show from any table -its helps us for pagination and showing short portion of data,
 
__LIMIT__ - LIMIT Clause return us fixed number of rows. if any table has several rows and we fixed it LIMIT 5 then its return us only 5 rows according top our condition.

` SELECT * FROM person LIMIT 5 `

  _return first 5 rows._

__OFFSET__ - OFFSET clause skip rows before return us. if we set OFFSET 5, its skip first 5 rows and return everything after that.

`SELECT * FROM person OFFSET 5 `

_skip first 5 rows._

WE can use LIMIT + OFFSET for pagination.

`SELECT * FROM person LIMIT 5 LIMIT 5`

_skip first 5 then return 5_

if we want to pagination like 1,2,3..... and every page show only 5 then it can be

- Page 1 → LIMIT 5 OFFSET 0

- Page 2 → LIMIT 5 OFFSET 5

- Page 3 → LIMIT 5 OFFSET 10
  
page-1 show first 5,page-2 skip first 5 show 5 after that,page-3 skip first 10 show 5 after that.

 we can be use a simple formula for LIMIT & OFFSET for pagination.

 ` LIMIT = page_size OFFSET = page_size × (page_number - 1) `

</p>

# 5️⃣. What is the significance of the JOIN operation, and how does it work in PostgreSQL?
<p>
When we working with relational databases like PostgreSQL often we need to find  data spread across multiple tables.JOIN operation one of the most powerful tools in PostgeSQL.A JOIN allows  to retrieve data from two or more tables based on a related column between them. it's helps us to data retrieve from multiple tables.

Example :
We have two tables:

customers(customer_id, name)

orders(order_id, customer_id, amount)

If WE Want to know what each customer ordered.We need to JOIN these tables on customer_id here customer_id is the foreign key for orders table.In PostgreSQL, JOIN is used in the FROM clause to combine rows from two or more tables. PostgreSQL evaluates JOINs in order to build a result set that includes columns from each table based on a matching condition.

```sql

SELECT column_name
FROM table1
JOIN table2
ON table1.column = table2.column;

```

Types of JOINs in PostgreSQL

1️⃣. INNER JOIN

rows only when there is a match in both tables.

```sql

SELECT customers.name, orders.amount
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;

```

2️⃣. LEFT JOIN

Returns all rows from the left table, plus matched rows from the right table. If no match is found, NULLs are returned.

```sql

SELECT customers.name, orders.amount
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id;

```

3️⃣. RIGHT JOIN 

Returns all rows from the right table, and matched rows from the left.

```sql

SELECT customers.name, orders.amount
FROM customers
RIGHT JOIN orders
ON customers.customer_id = orders.customer_id;

```


4️⃣. FULL JOIN OIN

Returns rows when there’s a match in either table. Missing data will be filled with NULLs.

```sql

SELECT customers.name, orders.amount
FROM customers
FULL JOIN orders
ON customers.customer_id = orders.customer_id;

```

5️⃣. CROSS JOIN

Every row from the first table joined with every row from the second.

```sql

SELECT customers.name, orders.amount
FROM customers
CROSS JOIN orders;

```
we can also use alias in table name

```sql

SELECT c.name, o.amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

```



</p>

