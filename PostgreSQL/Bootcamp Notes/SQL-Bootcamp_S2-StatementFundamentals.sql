/*########## SQL Bootcamp ####################################################*/
/*############## Section 2: SQL Statement Fundamentals #######################*/
/*############################################################################*/

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
/* COUNT Function

Usage: To return the number of input rows that match a specific condition set
  by the query

Basic syntax of COUNT Function:

  SELECT COUNT(columnName)
  FROM tableName

Notes:
  - The COUNT function does not consider null values within column
  - We can also use COUNT with DISTINCT

      SELECT COUNT(DISTINCT columnName)
      FROM table

EXAMPLE: */

  SELECT COUNT(*)
  FROM payment
__________

  SELECT COUNT(DISTINCT (amount))
  FROM payment


/*############################################################################*/
/* LIMIT Statement

Usage: Allows you to limit the number of rows you get back from a query

Basic syntax of LIMIT Statement:

  SELECT (*)
  FROM tableName
  LIMIT 5

EXAMPLE: */

  SELECT *
  FROM customer
  LIMIT 5


/*############################################################################*/
/* ORDER BY Statements

Usage: Allows us to sort rows returned from SELECT statement in ascending or
  descending order

Basic syntax of ORDER BY Statements:

  SELECT column1, column2
  FROM tableName
  ORDER BY column1 ASC/DESC

Notes:
  - If left blank, the ORDER BY statement will choose ascending by default

EXAMPLE: */

  SELECT first_name, last_name
  FROM customer
  ORDER BY first_name ASC

/*############################################################################*/
/* BETWEEN Operator

Usage: Allows us to match a value against a range of values

Basic syntax of BETWEEN Operator:

  someValue BETWEEN lowEnd AND highEnd

Notes:
  - Between operator also includes the boundries

  - Can also be rewritten as:

      someValue >= lowEnd AND someValue <= highEnd

  - Can also use NOT with BETWEEN

      someValue NOT BETWEEN lowEnd AND highEnd

EXAMPLE: */

  SELECT amount, payment_date
  FROM payment
  WHERE payment_date BETWEEN '2007-02-07' AND '2007-02-15'
__________

  SELECT customer_id, amount
  FROM payment
  WHERE amount NOT BETWEEN 8 AND 9

/*############################################################################*/
/* IN Statement

Usage: Must be used with the WHERE clause to check if a value matches any value
  in a list of values. The expression returns true of the value matches and
  value in the list (i.e. value1, value2)

Basic syntax of IN Statement:

  someValue IN (value1, value2, ...)

Notes:
  - The list of values is not limited to a list of numbers or a string, but also
    a result set of a SELECT statement. (Shown below)                           ||1||

        someValue IN (SELECT someValue
                      FROM tableName)

  - Can also use a NOT statement to adjust an IN statement (NOT IN)

EXAMPLE: */

  SELECT customer_id, rental_id, return_date
  FROM rental
  WHERE customer_id IN (1,2)
  ORDER BY return_date DESC

/*############################################################################*/
/* LIKE Statement

Usage:

Basic syntax of LIKE Statement:

  SELECT column1, column2
  FROM tableName
  WHERE aColumn LIKE 'someString%'

Notes:
  - The '%' is a special symbol that is reffered to as a pattern. Essentially,
    it will fill in the blank assuming some basis                               ||2||

EXAMPLE: */

  SELECT first_name, last_name
  FROM customer
  WHERE first_name LIKE 'Jen%'
__________

  SELECT first_name, last_name
  FROM customer
  WHERE first_name LIKE '%er%'
__________

  SELECT first_name, last_name
  FROM customer
  WHERE first_name LIKE '_her%'


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
