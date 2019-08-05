/*########## SQL Bootcamp ####################################################*/
/*############## Section 6: Advanced SQL Commands ############################*/
/*############################################################################*/

/*############################################################################*/
/* Timestamps
  - Refer: http://www.postgresql.org/docs/9.1/static/functions-datetime.html

Usage: Used to retain time based information

Basic syntax of Extract functions:

  Extract(unit from date)

Notes:
  - Types of information that can be extracted:
      - day: day of the month (1 - 31)
      - dow: day of the week (0 = Sunday, 1 = Monday, 2 = Tuesday, ...)
      - doy: day of the year (1 - 365/366 [366 if its a leap year])
      - epoch: number of seconds since '1970-01-01 00:00:00 UTC' if date value
      - hour: hour (0 - 23)
      - microseconds: seconds (and fractional seconds) multiplied by 1,000,000
      - millennium: millennium value
      - milliseconds: seconds (and fractional seconds) multiplied by 1,000
      - minute: minute (0 - 59)
      - month: number of the month (1 - 12), if date value. number of months
              (0 - 11) if interval value
      - quarter: quarter (1 - 4)
      - second: seconds (and  fractional seconds)
      - week: number of the week of the year based on ISO 8601 (where the year
              begins on the Monday of the week that contains January 4th)
      - year: year as 4 digits

EXAMPLE: */

  SELECT extract(day from payment_date)
  FROM payment

/* Here we don't capitalize 'extract' and the 'from' within the query simply to
  allow for easier readability of the query. */
__________

  SELECT SUM(amount), extract(month from payment_date) AS month
  FROM payment
  GROUP BY month
  ORDER BY SUM(amount) DESC
  LIMIT 1

/* This could be thought of as a use case where we would wnat to pull info on
  what our highest grossing month would be. */

/*############################################################################*/
/* Mathematical Functions
  - Refer: http://www.postgresql.org/docs/9.5/static/functions-math.html

Usage: to perform any number of mathematical operations, the full list of
    operations are in the link above

EXAMPLE: */

  SELECT customer_id + rental_id AS new_id
  FROM payment

/* Example of basic mathematical operator */
__________

  SELECT round(AVG(amount), 2)
  FROM payment

/* Example of basic mathematical function */

/*############################################################################*/
/* String Functions and Operators
  - Refer: http://www.postgresql.org/docs/9.5/static/functions-string.html

Usage: Used to perform string manipulations, refer to documentation above

EXAMPLE: */

  SELECT first_name || last_name
  FROM customer

/* Concatenation: performed with '||'. Looking below, we can see how to add a
  space with single quotes between when performing a concatenation */

  SELECT first_name || ' ' || last_name
  FROM customer
__________

  SELECT first_name, char_length(first_name)
  FROM customer

/* String Length: performed using 'char_length()' */
__________

  SELECT upper(first_name)
  FROM customer

/* Upper/Lower: Used to transform string into uppercase or lowercase */

/*############################################################################*/
/* Subqueries

Usage: Allows us to use multiple SELECT statements, where we basically have a
  query within a query

EXAMPLE: */

/* [1]: Suppose we want to find the films whose rental rate is higher than the
  average retal rate. We could do this in two steps: (1) Find the avg rental
  rate by using the SELECT statement and AVG function. (2) Use the result of the
  first query in the second SELECT statement to find the films that we want. */

  /* If we did the two step process:                                          */

    SELECT ROUND(AVG(rental_rate), 2)
    FROM film

    /* RETURNS: 2.98 */

    SELECT title, rental_rate
    FROM film
    WHERE rental_rate > 2.98

    /* Instead, if we were to use a subquery, we could do it simpler below */

    SELECT film_id, title, rental_rate
    FROM film
    WHERE rental_rate > (SELECT AVG(rental_rate)
					               FROM film)
__________

/* [2]: To see what films were in stock/returned between 05/29 and 05/30 */

  SELECT film_id, title
  FROM film
  WHERE film_id IN (SELECT inventory.film_id
				            FROM rental
				            INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
				            WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30')
  ORDER BY film_id ASC

/*############################################################################*/
/* SELF JOIN

Usage: A special case in which we want to join a table to itself, where we want
  to combine rows with other rows in the same table.

Notes:
  - To perfrom a self join operation, we must use a table alias to help SQL
    distinguish the left table from the right table of the same table.
  - There is also a significant performance benefit by using a self join for any
    queries that refer to the same table

THEORY EXAMPLE: Suppose we want to find out which employees are from the same
  location as the employee named Joe.

      ------------------------------------------------
      |employee_name        |       employee_location|
      ------------------------------------------------
      |Joe                  |                New York|
      |Sunil                |                   India|
      |Alex                 |                  Russia|
      |Albert               |                  Canada|
      |Jack                 |                New York|
      ------------------------------------------------

  This could be easily done with a query like:

    SELECT employee_name
    FROM employee
    WHERE employee_location = "New York"

  Or a subquery like:

    SELECT emplyee_name
    FROM employee
    WHERE employee_location IN (SELECT employee_location
                                FROM employee
                                WHERE employee_name = "Joe")

  However, for this particular case, if we used a 'Self Join':

    SELECT e1.employee_name
    FROM employee AS e1, employee AS e2
    WHERE e1.employee_location = e2.employee_location
    AND e2.employee_name = "Joe"

  NOTE: And note that we don't use any JOIN statements within this query since
        it is a self join, and we circumvent the need by using aliasing in L189.

==========================================================
== So what does the self join above look like visually? ==
==========================================================

                            ## Original Table ##
------------------------------------------------
|employee_name        |       employee_location|
------------------------------------------------
|Joe                  |                New York|
|Sunil                |                   India|
|Alex                 |                  Russia|
|Albert               |                  Canada|
|Jack                 |                New York|
------------------------------------------------

===> Perform aliasing

                                        ## e1 ##
------------------------------------------------
|employee_name        |       employee_location|
------------------------------------------------
|Joe                  |                New York|
|Sunil                |                   India|
|Alex                 |                  Russia|
|Albert               |                  Canada|
|Jack                 |                New York|
------------------------------------------------

                                        ## e2 ##
------------------------------------------------
|employee_name        |       employee_location|
------------------------------------------------
|Joe                  |                New York|
|Sunil                |                   India|
|Alex                 |                  Russia|
|Albert               |                  Canada|
|Jack                 |                New York|
------------------------------------------------

===> Result of 'self join' query

--------------------------------------------------------------------------------
|e1.employee_name|e1.employee_location || e2.employee_name|e2.employee_location|
--------------------------------------------------------------------------------
|Joe             |            New York || Joe             |            New York|
|Jack            |            New York || Joe             |            New York|
--------------------------------------------------------------------------------


*******************

EXAMPLE: */

/* [1]: Suppose we wanted to know who has the same last name as someone's first
  name. */

    SELECT a.customer_id, b.customer_id, a.first_name, a.last_name, b.first_name, b.last_name
    FROM customer AS a, customer AS b
    WHERE a.first_name = b.last_name
  __________

    SELECT a.customer_id, b.customer_id, a.first_name, a.last_name, b.first_name, b.last_name
    FROM customer AS a
    JOIN customer AS b
    ON a.first_name = b.last_name

    /* The two queries return the same, however, if we wanted to use the JOIN
      keyword we would use the second method. However, it is not necessary. */

/*############################################################################*/
/*######################## EXTRA NOTES #######################################*/
/*############################################################################*/

/* COMMON INTERVIEW QUESTION USING SQL:

    Google "manger employee self join" and those are commonly asked in interviews
    regarding SQL usage.

    Basically given a table with employees and managers, and you need to figure
    out what employees have a higher salary than employers, or stuff like that.

*/
