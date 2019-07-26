/*########## SQL Bootcamp ####################################################*/
/*############## Section 3: GROUP BY Statements ##############################*/
/*######################### CHALLENGES #######################################*/

/*############################################################################*/
/* Challenge # 1: GROUP BY (1)

We have two staff members with Staff IDs 1 and 2. We want to give a bonus to the
staff member that handled the most payments. How many payments did each of the
staff members handle? And how much was the total amount processed by each staff
member?
*/

SELECT staff_id, COUNT(payment_id), SUM(amount)
FROM payment
GROUP BY staff_id


/* Challenge # 1: GROUP BY (2)

Corporate HQ is auditing our store! They want to know the average replacement
cost of movies by rating. For example, R rated movies have an average replacemnt
cost of $20.23
*/

SELECT rating, ROUND(AVG(replacement_cost), 2)
FROM film
GROUP BY rating


/* Challenge # 1: GROUP BY (3)

We want to send coupons to the 5 customers who have spent the most amount of
money. Get me the customerIDs of the top 5 spenders.
*/

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5


/*############################################################################*/
/* Challenge # 2: HAVING (1)

We want to know what customers are eligible for our platinum credit card. The
requirements are that the customer has at least a total of 40 transaction
payments. What customers (by customer_id) are elligible for the credit card?
*/

SELECT customer_id, COUNT(payment_id)
FROM payment
GROUP BY customer_id
HAVING COUNT(payment_id) >= 40

/* Challenge # 2: HAVING (2)

When grouped by rating, what movie ratings have an average rental duration of
more than 5 days?
*/

SELECT rating, ROUND(AVG(rental_duration), 0)
FROM film
GROUP BY rating
HAVING AVG(rental_duration) > 5
