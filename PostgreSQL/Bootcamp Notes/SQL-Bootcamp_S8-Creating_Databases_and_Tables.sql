/*########## SQL Bootcamp ####################################################*/
/*############## Section 8: Creating Databases and Tables ####################*/
/*############################################################################*/

/*############################################################################*/
/* Data Types

Notes:
  - PostrgreSQL supports the following data types:
    - Boolean
      - Boolean holds 'true' or 'false'
        - True represented by: 1, yes, y, t, true
        - False represented by: 0, no, n, f, false
        - PSQL will display as 't' for true, 'f' for false, or ' ' (space char)
          for NULL when selecting data from bool column
      - In the case the value is unknown, the 'NULL' value is used
      - Can use the keyword 'boolean' or 'bool' when delcaring this data type

    - Character
      - Three types:
        - Single Character: 'char'

        - Fixed Length Character Strings: 'char(n)'
          - Inserting a string shorter than length of column, PSQL will pad the
            spaces
          - Inserting a string longer than length of column will cause PSQL to
            throw an error
          - NOTE: would be useful in situations where we would want to make sure *********
              that users would not be able to input a string of chars that don't
              belong there.

        - Variable Length Character Strings: 'varchar(n)'
          - Can store up to 'n' characters with variable length character
            strings
          - PSQL will NOT pad the spaces if stored string is shorter than length
            of the column

    - Number
      - Two types:
        - Integers: have three types
          - Small Integer: 'smallint'
            - 2-byte signed int w/range of (-32768, 32767)
          - Integer: 'int'
            - 4-byte int w/range of (-214783648, 214783647)
          - Serial: 'serial'
            - Same as integer, expcet PSQL will populate values into the column
              automatically
            - NOTE: similar to AUTO_INCREMENT attribute in other DB management   *********
                systems

        - Floating Point: have three types
          - Single Precision: 'float(n)'
            - floating point num w/precision n up to max of 8 bytes
          - Double Precision: 'real' or 'float8'
            - 8 byte floating point number
          - Real Number: 'numeric' or 'numeric(p, s)'
            - Real number w/'p' digits & 's' number after decimal point
            - The 'numeric(p,)' is the exact number

    - Temporal (ie: date and time related data types)
      - 'date': stores date data
      - 'time': stores time data
      - 'timestamp': stores date and time
      - 'interval': stores the difference in timestamps
      - 'timestamptz': stores both timestamp and timezone data

    - Special Types

    - Array


/*############################################################################*/
/* Primary Keys and Foreign Keys

Notes:

  Primary Key:
  - A "primary key" is a column, or group of columns that are used to identify a
    row uniquely in a table
  - A table can have ONLY one primary key
  - We add a primary key to a table, when we define the table's stucture using   *********
    a CREATE TABLE statement

        CREATE TABLE table_name (
            column_name data_type PRIMARY KEY,
            column_name data_type, ...)

  Foreign Key:
  - A "foreign key" is a field or group of fields in a table that uniquely
    identifies a row in another table
  - The table that contains teh foeign key is called 'referencing table' or
    'child table'. And the table to which the foreign key references is called
    the 'referenced table' or 'parent table'
  - A table can have multiple foreign keys depending on its relationship with
    other tables
  - In PSQL, a foreign key is defined through foreign key constaints
    - A "foreign key constraint" indicates that values in the column or group of
      columns in the child table match with the values in a column or group of
      columns of the parent table
    - We say that a foreign key constraint maintains 'referential integrity'
      between parent/child tables


/*############################################################################*/
/* Create Table: create a new table

Notes:
  - To create a new table in PSQL, we will use the CREATE TABLE statement like:

        CREATE TABLE table_name (
            column_name TYPE column_constraint,
            table_constraint)
        INHERITS existing_table_name

        - Code Breakdown of Above:
          - First line: Specifying the name of the new table we are creating
              after the 'CREATE TABLE' statement
          - Second Line: List the column name, its data type, and the column
              constraint. Can have multiple columns in a table, and wach column
              is separated by a comma.
            - Column constraint defines the rules for the column (ie: NOT NULL)
          - Third Line: We define the the table level constraint that defines
              the rules for the data in the table
          - Fourth Line: Specify an existing table from which the new table
              inherits. Meaning the new table will contain all columns of the
              existing table in addition to the columns defined in the
              'CREATE TABLE' statement (OPTIONAL)

  - PostrgreSQL Column Constraints
    - NOT NULL: the value of the column cannot be NULL
    - UNIQUE: the value of the column must be unique across the whole table
      - However, the column can have many NULL values becuase PSQL treats each
        NULL value to be unique
    - PRIMARY KEY: this constraint is the combination of NOT NULL and UNIQUE
      - NOTE: We can define one column as the primary key using column level
        constraints, but if we have a primary key consisting of multiple columns
        we must use a table level constraint
    - CHECK: enables to check a condition wehn you insert or update data
      - ie: the values in the price column of the product table must be positive
    - REFERENCES: constrains the value of the column that exists in a column in
        another table

EXAMPLE:

  [1] Creating tables example:

    Info about tables we are creating:
      Table 1: role
        role_id (int4)                                               PRIMARY KEY
        role_name(varchar(255))}

      Table 2: account_role
        user_id (int4)                                               PRIMARY KEY
        role_id (int4)                                               PRIMARY KEY
        grant_date (timestamp)

      Table 3: account
        user_id (int4)                                               PRIMARY KEY
        username (varchar(50))
        password (varchar(50))
        email (varchar(355))
        created_on (timestamp)
        last_login (timestamp)

    Creating Tables: */

      CREATE TABLE account(
         user_id serial PRIMARY KEY,
         username VARCHAR(50) UNIQUE NOT NULL,
         password VARCHAR(50) NOT NULL,
         email VARCHAR(355) UNIQUE NOT NULL,
         created_on TIMESTAMP NOT NULL,
         last_login TIMESTAMP)

      CREATE TABLE role(
         role_id serial PRIMARY KEY,
         role_name VARCHAR(255) UNIQUE NOT NULL)

      CREATE TABLE account_role(
         user_id integer NOT NULL
         role_id integer NOT NULL
         grant_date timestamp without time zone,
         PRIMARY KEY (user_id, role_id),

         CONSTRAINT account_role_role_id_fkey FOREIGN KEY (role_id)
          REFERENCES role (role_id) MATCH SIMPLE
         	ON UPDATE NO ACTION ON DELETE NO ACTION,

         -- Creating a foreign key in the query segments above and below
         CONSTRAINT account_role_user_id_fkey FOREIGN KEY (user_id)
         	REFERENCES account (user_id) MATCH SIMPLE
         	ON UPDATE NO ACTION ON DELETE NO ACTION
        )

      -- The CONSTRAINTs above are not clear yet, but will be clarified later


/*############################################################################*/
/* Insert: insert values into a table

Notes:
  - The "INSERT" statement allows us to insert one or mkore rows into a table at
    a time
  - To use an INSERT statement:
    - 1: specify the name of the table we want to insert a new row into after
      the 'INSERT INTO' clause, followed by a comma seperated column list
    - 2: List a comma seperated value list after the VALUES clause. The value
      list must be in the same order as the columns list specified after the
      table name

    - Basic Syntax Example:

          INSERT INTO table(column1, column2, ...)
          VALUES(value1, value2, ...)

    - Syntax Example: Insert Multiple Rows at Once

          INSERT INTO table(column1, column2, ...)
          VALUES(value1, value2, ...),
          VALUES(value1, value2, ...)...

    - Syntax Example: Insert Data from Another Table

          INSERT INTO table
          SELECT column1, column2, ...
          FROM another_table
          WHERE condition


EXAMPLE: */

-- Created a table to perform example
CREATE TABLE link(
	ID serial PRIMARY KEY,
	url varchar(255) NOT NULL,
	name varchar(255) NOT NULL,
	description varchar(255),
	rel varchar(50))

-- Inserting single value set                                                [1]
INSERT INTO link(url, name)
VALUES ('www.google.com', 'Google')

-- Check results
SELECT *
FROM link

-- Inserting multiple value sets                                             [2]
INSERT INTO link (url, name)
VALUES ('www.bing.com', 'Bing'),
	('www.amazon.com', 'Amazon')

-- Check results
SELECT *
FROM link

-- Copying a schema of another table                                         [3]
CREATE TABLE link_copy (LIKE link)                                              ||1||
  -- This is a shortcut that can be used when we want to copy a table structure
  -- It will copy the schema of the other table, but not the data

-- Copy data from one table into another                                     [4]
INSERT INTO link_copy
SELECT *
FROM link
WHERE name = 'Bing'


/*############################################################################*/
/* Update: update existing data in a table

Notes:
  - To change the values of columns in a table, we use the "UPDATE" statement

        UPDATE table
        SET column1 = value1,
          column2 = value2, ...
        WHERE condition

EXAMPLE: */

-- This examples updates the currently NULL description column
UPDATE link
SET description = 'Empty Description'

-- Updating description column where 'name' starts with an 'A'
UPDATE link
SET description = 'Name starts with an A'
WHERE name LIKE 'A%'

-- Update data of a column with data from another column
UPDATE link
SET description = name
  -- NOTE: the data types of the columns MUST match

-- To get back results of the updated entries from an updated column
UPDATE link
SET description = 'New Description'
WHERE id = 1
RETURNING id, url, name, description                                            ||2||
  -- "RETURNING" is the keyword used to return any columns we want to see


/*############################################################################*/
/* Delete: delete rows from a table

Notes:
  - To delete rows from a table, use the "DELETE" statement as follows

      DELETE FROM table
      WHERE condition

      -- 1: Specify the table we are deleting from
      -- 2: Specify which rows to delete from using the WHERE clause

      -- NOTE: If we omit the 'WHERE' clause, all the rows will be deleted       *********

EXAMPLE: */

-- Delete anywhere where name column starts with 'B'
DELETE FROM link
WHERE name LIKE 'B%'

-- To return the row which was deleted
DELETE FROM link
WHERE name = 'A'
RETURNING *                                                                     ||3||

/*############################################################################*/
/* Alter Table: to change existing table structure

Notes:
  - Used when we want to change the structure of a table that already exists
  - Syntax as follows:

      ALTER TABLE table_name action

      - Types of actions:
        - Add, remove, or rename a column
        - Set default value for the column
        - Add CHECK constraint to a column
        - Rename a table

      - Keywords for actions:
        - ADD COLUMN
        - DROP COLUMN
        - RENAME COLUMN
        - ADD CONSTRAINT
        - RENAME TO

EXAMPLE: */

-- Adding a column to 'link' table
ALTER TABLE link ADD COLUMN active boolean

-- Drop a column from 'link' table
ALTER TABLE link DROP COLUMN active

-- Rename a column in the 'link' table
ALTER TABLE link RENAME column title TO new_title_name

-- Rename table name
ALTER TABLE link RENAME TO url_table
/*############################################################################*/
/* Drop Table: to remove/drop tables

Notes:
  - Syntax:

      DROP TABLE[IF EXISTS] table_name

        - The 'IF EXISTS' is an optional term that can be used to avoid errors
          that may occur if the table does not exist

  - At the end of a DROP TABLE statement, SQL will automatically function with a *********
    statement 'RESTRICT'. RESTRICT ensures that there are no tables depending on
    the table that we are attempting to deop. If there is such a table that,
    then it would bar the table from being dropped. To override this, we can use
    the 'CASCADE' statement. But more related to this, look to Section 10: Views

EXAMPLE: */

-- Dropping table
DROP TABLE test2

-- Dropping table that doesn't exist returns following output message
ERROR:  table "test2" does not exist
SQL state: 42P01
  -- This would terminate a script and throw error. To avoid that, look below

-- Dropping table w/"IF EXISTS"
DROP TABLE IF EXISTS test2

-- Dropping table with 'IF EXISTS' clause returns
NOTICE:  table "test2" does not exist, skipping
DROP TABLE

Query returned successfully in 38 msec.
  -- Which would allow a query to run without premature termination


/*############################################################################*/
/* CHECK Constraint

Notes:
  - A CHECK constraint is a type of constraint that allows us to specify if a
    value in a column must meet a specific requirement
    - Functions a boolean expression to evaluate the values in a column

  - We can also name a CONSTRAINT to make it easier to read error messages

      CREATE TABLE table_name(
        column type CONSTRAINT constraint_name CHECK(some_condition))

EXAMPLE: */

-- [1]

  -- Creating a table using CHECK to constrain birthday, join date, and salary
    CREATE TABLE new_users(
    	id serial PRIMARY KEY,
    	first_name varchar(50),
    	birth_date DATE CHECK(birth_date > '1900-01-01'),
    	join_date DATE CHECK(join_date > birth_date),
    	salary integer CHECK(salary > 0))

    -- the birth date check ensures reasonable age; ie: not over 100 yrs old
    -- join date has to have been after the person was born
    -- salary can't be 0 or lower

  -- Now if we try to insert an invalid data entry
    INSERT INTO new_users(first_name, birth_date, join_date, salary)
    VALUES('Joe', '1980-02-02', '1990-04-04', -10)

  -- Our returned error message is:
    ERROR:  new row for relation "new_users" violates check constraint "new_users_salary_check"
    DETAIL:  Failing row contains (1, Joe, 1980-02-02, 1990-04-04, -10).
    SQL state: 23514
      -- The error message also details what check the data failed, and the data itself

-- [2]

  -- Creating a table while naming a CONSTRAINT
    CREATE TABLE checktest(
      sales integer CONSTRAINT positive_sales CHECK(sales>0))

  -- Testing one valid value
    INSERT INTO checktest(sales)
    VALUES(10)

  -- Testing an invalid value
    INSERT INTO checktest(sales)
    VALUES(-10)

  -- Our returned error message for the invalid value is:
    ERROR:  new row for relation "checktest" violates check constraint "positive_sales"
    DETAIL:  Failing row contains (-10).
    SQL state: 23514
      -- Now we can make it easier to know what the violated constraint was


/*############################################################################*/
/* NOT NULL Constraint

Notes:
  - NOT NULL is a constraint simply used to enforce the rule that a column must
    not accept NULL values. Meaning, you must specify a value that isn't NULL
    when inserting/updating data

EXAMPLE: */

-- Create a test table
CREATE TABLE learnnull(
	firstname varchar(50),
	sales integer NOT NULL)
    -- Using NOT NULL to add constraint

-- Try inserting just one column value
INSERT INTO learnnull(firstname)
VALUES('John')
  /* In this, we know that we are inserting just one column value, which would
      generally fill the unspecified columns with NULL values. However, since we
      used the NOT NULL constraint when creating the table, this should throw an
      error this would violate the condition. */

-- Error message
ERROR:  null value in column "sales" violates not-null constraint
DETAIL:  Failing row contains (John, null).
  -- Here we can see that SQL filled in the row with (John, null) which fails


/*############################################################################*/
/* UNIQUE Constraint

Notes:
  - Used to ensure that the value in a column or group of columns is unique in
    a table.
  - With a UNIQUE constraint, every time we insert a new row, PSQL will check
    whether the value is already in a table.
  - If the value already exists, it will throw an error message.

EXAMPLE: */

-- Create a table to test on
CREATE TABLE people(
	id serial PRIMARY KEY,
	firstN varchar(50),
	email varchar(100) UNIQUE)

-- Populate with one data set
INSERT INTO people(id, firstN, email)
VALUES(1, 'Joe', 'joe@joe.com')

-- Insert a non-unique data set
INSERT INTO people(id, firstN, email)
VALUES(2, 'Joseph', 'joe@joe.com')

-- Resultant error message
ERROR:  duplicate key value violates unique constraint "people_email_key"
DETAIL:  Key (email)=(joe@joe.com) already exists.
  -- In the error message, it specifies what condition was violated

/*############################################################################*/
/*######################## EXTRA NOTES #######################################*/
/*############################################################################*/
/*
||1|| - This is a shortcut of how to create/copy a table's schema
||2|| - The syntax for returning columns that we have updated

        RETURNING column1, column2, ...

        -- Which will be at the end of the query

||3|| - The syntax for returning columns that we have deleted

        RETURNING *

        -- This returns all the columns that have been deleted
