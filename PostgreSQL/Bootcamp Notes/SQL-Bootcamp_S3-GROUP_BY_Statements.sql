/*########## SQL Bootcamp ####################################################*/
/*############## Section 3: GROUP BY Statements ##############################*/
/*############################################################################*/

/*############################################################################*/
/* MIN, MAX, AVG, SUM, ROUND Aggregate Functions

Usage:
  - AVG: to determine the average value from some column
  - ROUND: to round a returned value from aggregate function to n decimal places
  - MIN: to return the smallest value from a column
  - MAX: to return the largest value from a column
  - SUM: sum values within a specified column


Basic syntax of AVG Function:

  AVG(amount)

Basic syntax of ROUND Function:

  ROUND(AVG(amount), n)                   //Where 'n' is # decimal places

Basic syntax of MIN Function:

  SELECT MIN(amount)

Basic syntax of MAX Function:

  SELECT MAX(amount)

Basic syntax of SUM Function:

  SELECT SUM(amount)

Notes:
  - If we ever want to round a returned decimal value, we can use the ROUND
    operator.

EXAMPLE: */

  SELECT AVG(amount)
  FROM payment
__________

  SELECT ROUND(AVG(amount), n)
  FROM payment
__________

  SELECT MIN(amount)
  FROM payment
__________

  SELECT MAX(amount)
  FROM payment
__________

  SELECT SUM(amount)
  FROM payment


/*############################################################################*/
/* GROUP BY Function

Usage: The GROUP BY clause divides the rows returned from the SELECT statement
  into groups

Basic syntax of GROUP BY Function:

  SELECT column1, someAggregateFunction(column2)
  FROM tableName
  GROUP BY column1

Notes:
  - For each group in a GROUP BY clause, we can apply an aggregate function like
    - Caluclating the sum of items
    - Count the number of items in a group
  - PostgreSQL is flexible as to how GROUP BY is used in terms of syntax,
    but some other SQL engines will not allow you to call a GROUP BY function
    without listing the the column being grouped in the SELECT statement

EXAMPLE: */

  SELECT customer_id
  FROM payment
  GROUP BY customer_id

/* The above query simply pulls customer_id from the payment table and groups
  by their ID. */
__________

  SELECT customer_id, SUM(amount)
  FROM payment
  GROUP BY customer_id

/* The GROUP BY function above is used to group the customers by ID, and then
  performs a SUM function on amount which is grouped by customer. As a result,
  it returns the amount spent by an individual customer. */
__________

  SELECT customer_id, SUM(amount)
  FROM payment
  GROUP BY customer_id
  ORDER BY SUM(amount)

/* In the above query, we also use an ORDER BY statement in addition to the
  GROUP BY statement. This is completely valid, and can be useful. */

/*############################################################################*/
/* HAVING Clause

Usage: We often use the HAVING clause in conjunction with the GROUP BY clause
  to filter group rows that do not satisfy a specific condition.

Basic syntax of :

  SELECT column1, someAggregateFunction(column2)
  FROM tableName
  GROUP BY column1
  HAVING someCondition

Notes:
  - The main difference between the HAVING and WHERE clauses is:
    - The HAVING clause sets the condition for grouped rows created by the
      GROUP BY clause |AFTER| the GROUP BY clause applies.
    - The WHERE clause sets the condition for the indicidual rows |BEFORE| the
      GROUP BY clause applies.

EXAMPLE: */

  SELECT customer_id, SUM(amount)
  FROM payment
  GROUP BY customer_id
  HAVING SUM(amount) > 200

/* Here the HAVING clause acts on the aggregate SUM function |AFTER| the GROUP
  BY statement works its magic. */
__________

  SELECT store_id, COUNT(customer_id)
  FROM customer
  GROUP BY store_id
  HAVING COUNT(customer_id) > 300
__________

  SELECT rating, ROUND(AVG(rental_rate), 2)
  FROM film
  WHERE rating IN ('R', 'G', 'PG')
  GROUP BY rating
  HAVING AVG(rental_rate) < 3

/* Here, we use both the WHERE and HAVING clauses in conjunction. The above
  query executes by using GROUP BY to group movies based on their rating WHERE
  the raing is 'R', 'G', or 'PG'. Once grouped, we check for which ratings have
  an average rental rate that is less than $3.00 */


/*############################################################################*/
/*######################## EXTRA NOTES #######################################*/
/*############################################################################*/
