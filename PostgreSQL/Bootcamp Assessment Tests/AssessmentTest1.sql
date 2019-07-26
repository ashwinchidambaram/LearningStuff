/*########## SQL Bootcamp ####################################################*/
/*############## Assessment Test # 1  ########################################*/
/*############################################################################*/

/*############################################################################*/
/* Challenge # 1:

Return the customer IDs of customers who have spent at least $110 with the staff
member who has an ID of 2.
*/

SELECT customer_id, SUM(amount)
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 110

/* RESULT: CORRECT (187, 148) */


/*############################################################################*/
/* Challenge # 2:

How many films begin with the letter J?
*/

SELECT COUNT(title)
FROM film
WHERE title LIKE 'J%'

/* RESULT: CORRECT (20) */


/*############################################################################*/
/* Challenge # 3:

What customer has the highest customer ID number whose name starts with an 'E'
and has an address ID lower than 500?
*/

SELECT first_name, last_name
FROM customer
WHERE first_name LIKE 'E%' AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1

/* RESULT: CORRECT (Eddie Tomlin) */
