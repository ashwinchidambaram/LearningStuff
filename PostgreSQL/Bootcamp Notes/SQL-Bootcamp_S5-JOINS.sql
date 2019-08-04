/*########## SQL Bootcamp ####################################################*/
/*############## Section 5: JOINS ############################################*/
/*############################################################################*/

/*############################################################################*/
/* AS Statement

Usage: The AS statement can be used to rename columns or table selections with
    an alias

Basic syntax of AS Statement:

  SELECT SUM(amount) AS TotalAmt

Notes:
  - The AS staement makes it easier to understand a query, but we don't have to
    use it within a query. We can substitute it with a space and achieve the
    same result.

        SELECT first_name, last_name, SUM(amount) Total, customer_id

EXAMPLE: */

  SELECT payment_id AS my_payments_column
  FROM payment
__________

  SELECT customer_id, SUM(amount) AS total_spent
  FROM payment
  GROUP BY customer_id

/*############################################################################*/
/* Some General Information / Background about Joins

Suppose we wanted to get data from two tables named A and B.

Table B has a fka (foreign key 'a') field that relates to to the pka (primary   ||1||
key 'a') field in table A. Then to connect the two tables, we would have to
match the foreign key in a table we want to join to the primary key of the table
we are joining. So in the case above, if we wanted to join tables A and B, we
would need to perform a join using pka from A and fka from B.

/*############################################################################*/
/* INNER JOIN

Usage: To get data from two tables we are trying to join. An INNER JOIN performs
  an interesection of A and B, returning what is common between them only.

  Reference Image: shorturl.at/nBCLR

Basic syntax of INNER JOIN:

  SELECT A.pka, A.c1, A.c2, B.pkb, B.c2, B.c3
  FROM A
  INNER JOIN B on A.pka = B.fka

Notes:
  - The difference in syntax from a normal query and a query using a JOIN
      statement, is the usage of primary and foreign keys that are specified
      within the SELECT statement

  - Steps to using Joins

      1) Specify the column in both tables from which we want to select data in
        the SELECT statement

      2) Specify the main table (ie: A) in the FROM clause

      3) Specifiy the table that the main table joins to (ie: B) in the INNER
        JOIN clause.

      4) Add the ON condition after the INNER JOIN clause like:

          INNER JOIN __ ON __.pka = __.fka

  - What the JOIN statement is doing: For each row within the A table, PSQL
      scans table B to see if there is any row that matches the condition
      (ie: A.pka = B.fka). If there is a match found, it combines the columns
      of both rows into one row and adds the freshly combined rows to the
      returned result set.

  - Sometimes tables A and B have the same column name, so we have to refer to
      the columns as table_name.column_name to avoid ambiguity. In case of long
      table names, we can use a table alias to rename the table and shorten ref.

  - In most SQL editors, using just JOIN will be treated as doing an INNER JOIN

EXAMPLE: */

  SELECT customer.customer_id, first_name, last_name, email, amount, payment_date
  FROM customer
  INNER JOIN payment ON customer.customer_id = payment.customer_id

/* Here, we don't specify the table name for all columns we SELECT since the
  columns that we are selecting are unique with the exception of customer_id. */
__________

  SELECT customer.customer_id, first_name, last_name, email, SUM(amount)
  FROM customer
  INNER JOIN payment ON customer.customer_id = payment.customer_id
  GROUP BY customer.customer_id

/* Here, we are using the GROUP BY clause, which must be called after the INNER
  JOIN is used. And since we are grouping by customer_id, we must specify the
  table name from which it comes. */
__________

  SELECT customer.customer_id, first_name, last_name, email, amount, payment_date
  FROM customer
  INNER JOIN payment ON customer.customer_id = payment.customer_id
  ORDER BY customer.customer_id
__________

  SELECT customer.customer_id, first_name, last_name, email, amount
  FROM customer
  INNER JOIN payment ON customer.customer_id = payment.customer_id
  WHERE customer.customer_id = 2

/*############################################################################*/
/* MORE EXAMPLES OF INNER JOIN

1) Getting the paymentID, amount, and first/last name of staffer who performed
  transaction

    SELECT payment_id, payment.staff_id, first_name, last_name, amount
    FROM payment
    INNER JOIN staff ON payment.staff_id = staff.staff_id                       ||2||

2) Findining out the number of copies of movies at store 1

    SELECT title, COUNT(title) AS Copies_at_Store1
    FROM inventory
    JOIN film ON inventory.film_id = film.film_id
    WHERE store_id = 1
    GROUP BY title
    ORDER BY title

3) Get what language movies are in

    SELECT title, language.name
    FROM film
    JOIN language ON film.language_id = language.language_id
__________

    SELECT title, name
    FROM film
    JOIN language AS lan ON film.language_id = lan.language_id                  ||3||

*/
/*############################################################################*/
/* SQL JOIN Overview (shorturl.at/vFJL2) */

/* INNER JOIN: Produces set of records that match in BOTH table A and B. */

    SELECT *
    FROM tableA
    INNER JOIN tableB ON tableA.name = tableB.name

/* ------------------------------------------
    id      name        id      name

    1       Pirate      2       Pirate
    3       Ninja       4       Ninja
*/ ------------------------------------------


/* FULL OUTER JOIN: produces set of all records in table A, B with matching
    records from both sides where available. If there is no match, the missing
    side will contain null. */

    SELECT *
    FROM tableA
    FULL OUTER JOIN tableB ON tableA.name = tableB.name

/* ------------------------------------------
    id      name        id      name

    1       Pirate      2       Pirate
    2       Monkey      null    null
    3       Ninja       4       Ninja
    4       Spaghetti   null    null
    null    null        1       Rutabega
    null    null        3       Darth Vader
*/ ------------------------------------------


/* LEFT OUTER JOIN: produces a complete set of records from table A, with
    matching records (where available) in table B. If there is no match, the
    right side will contain null. */

    SELECT *
    FROM tableA
    LEFT OUTER JOIN tableB ON tableA.name = tableB.name

/* ------------------------------------------
    id      name        id      name

    1       Pirate      2       Pirate
    2       Monkey      null    null
    3       Ninja       4       Ninja
    4       Spaghetti   null    null
*/ ------------------------------------------


/* LEFT OUTER JOIN: produces a complete set of records from table A, with
    matching records (where available) in table B. If there is no match, the
    right side will contain null. */

    SELECT *
    FROM tableA
    LEFT OUTER JOIN tableB ON tableA.name = tableB.name

/* ------------------------------------------
    id      name        id      name

    1       Pirate      2       Pirate
    2       Monkey      null    null
    3       Ninja       4       Ninja
    4       Spaghetti   null    null
*/ ------------------------------------------


/* LEFT OUTER JOIN w/WHERE Clause: produces a set of records only in table A,
    but not in table B. We perform the same LEFT OUTER JOIN, but exclude the
    records we don't want from the right side using a WHERE clause. */

    SELECT *
    FROM tableA
    LEFT OUTER JOIN tableB ON tableA.name = tableB.name
    WHERE tableB.id IS null

/* ------------------------------------------
    id      name        id      name

    2       Monkey      null    null
    4       Spaghetti   null    null
*/ ------------------------------------------


/* FULL OUTER JOIN w/WHERE Clause: produces a set of records unique to tables
    A, B. We're performing the same FULL OUTER JOIN but exclude the records we
    don't want from both sides using a WHERE clause. */

    SELECT *
    FROM tableA
    FULL OUTER JOIN tableB ON tableA.name = tableB.name
    WHERE tableA.id IS null OR tableB.id IS null

/* ------------------------------------------
    id      name        id      name

    2       Monkey      null    null
    4       Spaghetti   null    null
    null    null        1       Rutabega
    null    null        3       Darth Vader
*/ ------------------------------------------

/*############################################################################*/
/* MORE EXAMPLES OF OUTER JOIN                                                  ||4||

1) LEFT OUTER JOIN example

    SELECT film.film_id, film.title, inventory_id
    FROM film
    LEFT JOIN inventory ON inventory.film_id = film.film_id

2) Suppose same as above, but we want to find out what films are not in
  inventory

    SELECT film.film_id, film.title, inventory_id
    FROM film
    LEFT JOIN inventory ON inventory.film_id = film.film_id
    WHERE inventory.film_id IS null                                             ||5||

*/
/*############################################################################*/
/* UNION Statement

Usage: The UNION operator combines result sets of two or more SELECT statements
    into a single result set.

Basic syntax of UNION Statement:

  SELECT column_1, column_2
  FROM tableA
  UNION
  SELECT column_1, column_2
  FROM tableB

Notes:
  - Both queries must return the same number of columns
  - The corresponding columns in the queries must have compatible data types
  - The UNION operator removes all duplicate rows UNLESS the UNION ALL is used
  - The UNION operator may place the rows in the first query before, after, or
    in between the rows in the result set of the second query
  - To sort the rows in the combined result set by a specified column, you use
    the ORDER BY clause

EXAMPLE: */

  SELECT * FROM sales2007q1
  UNION
  SELECT * FROM sales2007q2

/* ---------------------- Before
  name        amount

  Mike        150000.25
  Jon         132000.75
  Mary        100000
*/ ---------------------- sales2007q1

/* ---------------------- Before
  name        amount

  Mike        120000.25
  Jon         142000.75
  Mary        100000
*/ ---------------------- sales2007q2

/* ---------------------- After
  name        amount

  Jon         132000.75
  Jon         120000.75
  Mary        100000                                                            ||6||
  Mike        120000.25
  Mike        150000.25
*/ ---------------------- After

__________

SELECT * FROM sales2007q1
UNION ALL
SELECT * FROM sales2007q2

/* ---------------------- Before
name        amount

Mike        150000.25
Jon         132000.75
Mary        100000
*/ ---------------------- sales2007q1

/* ---------------------- Before
name        amount

Mike        120000.25
Jon         142000.75
Mary        100000
*/ ---------------------- sales2007q2

/* ---------------------- After
name        amount

Mike        150000.25
Jon         132000.75
Mary        100000
Mike        120000.25
Jon         120000.75
Mary        100000
*/ ---------------------- After


/*############################################################################*/
/*######################## EXTRA NOTES #######################################*/
/*############################################################################*/
/*
||1|| - A key is essentially the same as a column
||2|| - If we were to have written JOIN instead of INNER JOIN, it still would
        behave in the same way.
||3|| - Example of we can use an alias to shorten a table name
||4|| - For any OUTER JOIN, we could just omit the OUTER similar to how we can
        omit INNER in INNER JOINs. (ie: LEFT JOIN, RIGHT JOIN)
||5|| - Here I made a mistake the first try by doing
||6|| - Here, we see that Mary is only stated once as opposed to Mike and Jon.
        The reason for this being, a UNION operator removes duplicates which
        is why Mary who had an amount of 100000 in both q1, q2 shoes only once

          "WHERE inventory.film_id = NULL"

        However, to return null, we identify using 'IS' so instead, it would be

          "WHERE inventory.film_id IS null"

/* Additional JOIN Information

  Visual Representation of SQL Joins:
          https://blog.codinghorror.com/a-visual-explanation-of-sql-joins/

  SQL Joins Explained:
          http://www.sql-join.com/
*/
