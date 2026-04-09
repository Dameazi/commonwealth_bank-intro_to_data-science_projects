### Overview

This project involves the design and implementation of a relational database using PostgreSQL to simulate a simple social media platform. The system manages users and their tweets, demonstrating how structured data can be stored, linked, and queried efficiently.

### Objective

The goal of this project is to practice database design, table relationships, and SQL querying by building a system that connects users to their posts (tweets).

### Database Structure

The database consists of two main tables:

* **Users Table**
  Stores user information such as:

  * User ID (Primary Key)
  * Display Name
  * Username
  * Verification Status
  * Followers Count
  * Account Creation Date

* **Tweets Table**
  Stores tweet-related data such as:

  * Tweet ID (Primary Key)
  * User ID (Foreign Key)
  * Tweet Content
  * Timestamp

### Relationships

A **one-to-many relationship** exists between Users and Tweets:

* One user can have multiple tweets
* Each tweet belongs to a single user

This relationship is implemented using a foreign key (`user_id`) in the Tweets table.

### Key SQL Operations Performed

* **Table Creation** using `CREATE TABLE` with constraints (PRIMARY KEY, UNIQUE, NOT NULL)
* **Data Insertion** into both tables
* **JOIN Queries** to combine user data with their tweets

Example concept used:

* INNER JOIN to retrieve tweet owners and their corresponding tweets

### Sample Insight

Using a JOIN query, the database successfully links each tweet to its owner, allowing queries such as:

* Displaying tweet content alongside the user’s display name
* Analyzing user activity
* Tracking engagement patterns

### Testing
<img width="557" height="308" alt="Screenshot 2026-04-09 094502" src="https://github.com/user-attachments/assets/84056f76-90db-44f7-9d07-fd2ffd9c6af6" />


The database was tested by:

* Inserting sample user and tweet data
* Running JOIN queries to confirm relationships
* Verifying data integrity and constraints
* Also tested by check users that (mentioned commbank) {condition} and their type of tweets
<img width="554" height="290" alt="image" src="https://github.com/user-attachments/assets/670489c0-4b88-4cc8-9316-c01b2eb7cfdb" />


### What I Learned

* How to design relational databases
* How to implement primary and foreign keys
* Writing efficient SQL JOIN queries
* Structuring data for real-world applications

### Tools Used

* PostgreSQL
* SQL (DDL & DML)

### Future Improvements

* Add likes, comments, and followers tables
* Implement indexing for performance optimization
* Build a frontend interface to interact with the database

