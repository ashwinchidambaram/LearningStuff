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
/* Create Table

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
/* Insert

Notes:
  -


/*############################################################################*/
/* Update

Notes:
  -


/*############################################################################*/
/* Delete

Notes:
  -


/*############################################################################*/
/* Alter Table

Notes:
  -


/*############################################################################*/
/* Drop Table

Notes:
  -


/*############################################################################*/
/* CHECK Constraint

Notes:
  -


/*############################################################################*/
/* NOT NULL Constraint

Notes:
  -


/*############################################################################*/
/* UNIQUE Constraint

Usage:

Basic syntax of :



Notes:
  -

EXAMPLE: */



/*############################################################################*/
/*

Usage:

Basic syntax of :



Notes:
  -

EXAMPLE: */



/*############################################################################*/






/*############################################################################*/
/*######################## EXTRA NOTES #######################################*/
/*############################################################################*/
/*
||1|| - This is a simple subquery
||2|| - How to use a pattern (%)

    You can construct a pattern by combining a string with wildcard characters
    and use the LIKE or NOT LIKE operators to find the matches

      - Use the percent (%) for matching any sequence of characters
      - Use the underscore (_) for matching any single character
