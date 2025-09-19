Library Management System - Database Design
===========================================

Overview
--------

This project involves designing and implementing a relational database for a **Library Management System** using MySQL. The goal is to model and manage the data associated with a library, including books, library members, and transaction details, such as borrowing and returning books.

The system also accounts for the relationship between books and authors, enabling many-to-many associations. This allows for flexibility in cataloging books with multiple authors and managing library resources efficiently.

## Features

* **Books**: Tracks book information, such as title, author, ISBN, genre, published year, and copies available.

* **Members**: Manages library member details including personal information and membership date.

* **Transactions**: Tracks book borrowings, return dates, due dates, and member details related to each transaction.

* **Authors**: Stores author information, enabling a relationship between books and their authors.

* **Many-to-Many Relationships**: Allows books to be associated with multiple authors through a linking table.

Database Schema
---------------

The following tables are included in the database schema:

1. **Books**: Contains details about each book in the library.

2. **Members**: Stores information about library members.

3. **Transactions**: Manages borrowing and returning transactions between books and members.

4. **Authors**: Provides details about authors, who may have written multiple books.

5. **BookAuthors**: A junction table to handle the many-to-many relationship between books and authors.

Database Design and Structure
-----------------------------

### 1. **Books Table**

* Stores book details such as the title, author, ISBN, genre, and the number of available copies.

* **Primary Key**: `BookID`

* **Unique Key**: `ISBN`

### 2. **Members Table**

* Stores member details including their name, contact information, and membership date.

* **Primary Key**: `MemberID`

* **Unique Key**: `Email`

### 3. **Transactions Table**

* Stores the transaction details of book issues, including member information, issue dates, return dates, and due dates.

* **Foreign Keys**:
  
  * `MemberID` (references `Members` table)
  
  * `BookID` (references `Books` table)

### 4. **Authors Table**

* Stores author details, including their name and biography.

* **Primary Key**: `AuthorID`

### 5. **BookAuthors Table**

* A junction table to manage the many-to-many relationship between books and authors.

* **Foreign Keys**:
  
  * `BookID` (references `Books` table)
  
  * `AuthorID` (references `Authors` table)

* **Primary Key**: Composite of `BookID` and `AuthorID`

Relationship Diagram
--------------------

The relationships between the tables are as follows:

* **Books** and **Transactions**: One-to-many (One book can be borrowed by many members).

* **Members** and **Transactions**: One-to-many (One member can borrow multiple books).

* **Books** and **Authors**: Many-to-many (One book can have multiple authors, and one author can write multiple books).

SQL Script
----------

The provided SQL script is a single `.sql` file containing the following:

1. **CREATE DATABASE** statement: Creates a new database named `LibraryManagement`.

2. **CREATE TABLE** statements: Defines the structure of all the tables in the database (`Books`, `Members`, `Transactions`, `Authors`, and `BookAuthors`).

3. **Relationship Constraints**: Defines the primary keys, foreign keys, and unique constraints to ensure referential integrity and prevent duplicate entries.

### Example SQL Script:

```sql
-- Create the Library Management database
CREATE DATABASE LibraryManagement;
USE LibraryManagement;

-- Create the Books table
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    ISBN VARCHAR(13) UNIQUE NOT NULL,
    Genre VARCHAR(100),
    PublishedYear INT,
    CopiesAvailable INT DEFAULT 0
);

-- Additional table definitions go here...
```

How to Use
----------

1. **Set Up MySQL Database**:
   
   * Install MySQL and set up a new database instance.
   
   * Log into MySQL using the command line or a GUI like phpMyAdmin.

2. **Run the SQL Script**:
   
   * Copy the provided SQL script into your MySQL command line or a MySQL GUI interface.
   
   * Execute the script to create the database and tables.

3. **Populate the Database**:
   
   * Insert sample data for books, members, transactions, authors, and book-author relationships.

4. **Query the Database**:
   
   * After setting up the database, you can run various SQL queries to retrieve information, such as:
     
     * Checking available books: `SELECT * FROM Books WHERE CopiesAvailable > 0;`
     
     * Viewing the books borrowed by a particular member: `SELECT * FROM Transactions WHERE MemberID = 1;`
     
     * Finding books by a specific author using `JOIN` on the `BookAuthors` table.

License
-------

This project is licensed under the MIT License - see the [LICENSE](https://opensource.org/license/MIT) file for details.
