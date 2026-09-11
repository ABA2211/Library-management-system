# Library Management System

## 📚 Project Overview

A Library Management System database developed using **SQL Server** and **SQL Server Management Studio (SSMS)**.

The project is designed to manage library data including authors, books, categories, members, and borrowing records. It also demonstrates different SQL operations used to store, update, retrieve, and analyze data.

## 🛠️ Technologies Used

* SQL Server
* SQL Server Management Studio (SSMS)
* SQL

## 🗂️ Database Tables

The database contains five main tables:

* **Authors** — Stores author information such as name and nationality.
* **Categories** — Stores book categories and shelf numbers.
* **Books** — Stores book details including title, publication year, price, category, and author.
* **Members** — Stores library member information.
* **Borrow Records** — Stores book borrowing and return information.

## 🔗 Database Relationships

The project uses **Primary Keys** and **Foreign Keys** to establish relationships between tables.

Main relationships include:

* Authors → Books
* Categories → Books
* Members → Borrow Records
* Books → Borrow Records

## 🔍 SQL Operations

The project demonstrates:

* Creating databases and tables
* Primary Keys and Foreign Keys
* Inserting data
* Updating data
* Deleting data
* Filtering using `WHERE`
* Searching using `LIKE`
* Sorting using `ORDER BY`
* Aggregation using `COUNT`
* Grouping using `GROUP BY`
* Joining multiple tables using `INNER JOIN`
* Handling `NULL` values
* Combining `JOIN`, `COUNT`, `GROUP BY`, and `ORDER BY`

## 📊 Example Queries

### Find Books Above a Specific Price

```sql
SELECT *
FROM books
WHERE price > 130;
```

### Search for Books by Title

```sql
SELECT *
FROM books
WHERE title LIKE '%Harry%';
```

### Count Books by Category

```sql
SELECT cat_id, COUNT(book_id) AS number_books
FROM books
GROUP BY cat_id;
```

### Display Books with Their Authors

```sql
SELECT books.title, authors.author_name
FROM books
INNER JOIN authors
    ON books.author_id = authors.author_id;
```

### Display Borrowing Information

```sql
SELECT 
    members.member_name,
    books.title,
    borrow_records.borrow_date,
    borrow_records.return_date
FROM borrow_records
JOIN members
    ON borrow_records.member_id = members.member_id
JOIN books
    ON borrow_records.book_id = books.book_id;
```

## 🎯 Project Purpose

The purpose of this project is to demonstrate practical database design and SQL skills through a simple library management system.

It focuses on organizing relational data and using SQL queries to efficiently manage and retrieve information.

## 📁 Project Files

* `Library.sql` — Complete database creation, data insertion, and SQL queries.
* `Screenshots/` — Screenshots showing the database and query results.

## 👨‍💻 Author

**Abdelmonem Yasser**
