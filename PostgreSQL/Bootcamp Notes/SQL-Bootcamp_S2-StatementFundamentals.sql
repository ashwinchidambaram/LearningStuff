/*############################################################################*/
/* SELECT Statements

Usage: Used to select columns from a table

Basic syntax of a SELECT Statement:

  SELECT column1, column2, ...
  FROM  tableName

Notes:
  - Can also use "*" to select all columns from table

EXAMPLE: */

  SELECT first_name, last_name
  FROM actor


/*############################################################################*/
/* SELECT DISTINCT Statements

Usage: Used to select distinct values from a table

Basic syntax of a SELECT DISTINCT Statement:

  SELECT DISTINCT column1, column2, ...
  FROM  tableName

EXAMPLE: */

  SELECT DISTINCT release_year
  FROM film


/*############################################################################*/
/* WHERE Clause

Usage: Used when we want to query just particular rows from a table or under
  some condition/logic

Basic syntax of a WHERE Clause:

  SELECT column1, column2, ...
  FROM tableName
  WHERE condition

Notes:
  - Following are operators that can be used with WHERE clause:

      =       Equal
      >       Greater Than
      <       Less Than
      >=      Greater Than or Equal
      <=      Less Than or Equal
      <>      Not Equal
      !=      Not Equal
      AND     Logical Operator AND
      OR      Logical Operator OR

EXAMPLE: */

  SELECT customer_id, amount, payment_date
  FROM payment
  WHERE amount <= 1 OR amount >= 8


/*############################################################################*/
/* 

Usage:

Basic syntax of :



Notes:
  -

EXAMPLE: */













/*

Usage:

Basic syntax of :



Notes:
  -

EXAMPLE: */
